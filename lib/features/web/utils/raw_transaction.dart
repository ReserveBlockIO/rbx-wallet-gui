// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:hex/hex.dart';
import 'package:pointycastle/pointycastle.dart' as PC;
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_bip66/dart_bip66.dart';
import 'package:secp256k1/secp256k1.dart' as secp256k1;
import 'package:convert/convert.dart';

class RawTxValue {
  final String hash;
  final int nonce;
  final double fee;
  final int timestamp;

  const RawTxValue({
    required this.hash,
    required this.nonce,
    required this.fee,
    required this.timestamp,
  });
}

class RawTransaction {
  static Future<Map<String, dynamic>?> generate({
    required Keypair keypair,
    required String toAddress,
    required double amount,
  }) async {
    final rawTx = await _getTransactionForSignature(
      fromAddress: keypair.public,
      toAddress: toAddress,
      amount: amount,
    );

    if (rawTx == null) {
      return null;
    }

    final hash = rawTx.hash;

    final signature = await _getSignature(
      message: hash,
      privateKey: keypair.private,
    );

    print("Signature: $signature");

    final r = signature.R;
    final s = signature.S;
    final der = toDer(r, s);
    if (der == null) {
      print("Der failed");
      return null;
    }

    final base64Signature = base64Encode(der);

    String publicKey = keypair.publicInflated;

    if (publicKey.startsWith("04")) {
      publicKey = publicKey.replaceFirst("04", "");
    }

    print("Publickey: $publicKey");

    final hex = HEX.decode(publicKey);

    final base58PublicKey = base58Encode(hex);
    print("base58PublicKey: $base58PublicKey");

    final fullSignature = "$base64Signature.$base58PublicKey";

    final txService = TransactionService();
    final validateData = await txService.validateSignature(
      hash,
      keypair.public,
      fullSignature,
    );

    if (!_responseIsValid(validateData)) {
      print("Signature not valid");
      return null;
    }

    final txData = _buildTransaction(
      hash: rawTx.hash,
      toAddress: toAddress,
      fromAddress: keypair.public,
      amount: amount,
      nonce: rawTx.nonce,
      timestamp: rawTx.timestamp,
      fee: rawTx.fee,
      signature: fullSignature,
    );

    final verifyTransactionData = (await txService.sendTransaction(
      transactionData: txData,
      execute: false,
    ))!['data'];

    print(verifyTransactionData);

    if (!_responseIsValid(verifyTransactionData)) {
      print("Transaction not valid");
      return null;
    }

    return txData;
  }

  static Future<RawTxValue?> _getTransactionForSignature({
    required String fromAddress,
    required String toAddress,
    required double amount,
  }) async {
    final txService = TransactionService();

    final timestampData = await txService.getTimestamp();

    if (!_responseIsValid(timestampData)) {
      print("Failed to retrieve timestamp");
      return null;
    }

    final int? timestamp = timestampData!['Timestamp'];
    if (timestamp == null) {
      print("Failed to parse timestamp");
      return null;
    }

    final nonceData = await txService.getNonce(fromAddress);
    if (!_responseIsValid(nonceData)) {
      print("Failed to retrieve nonce");
      return null;
    }

    final int? nonce = nonceData!['Nonce'];
    if (nonce == null) {
      print("Failed to parse nonce");
      return null;
    }

    Map<String, dynamic> txData = _buildTransaction(
      toAddress: toAddress,
      fromAddress: fromAddress,
      amount: amount,
      nonce: nonce,
      timestamp: timestamp,
    );

    final feeData = (await txService.getFee(txData))!['data'];

    if (!_responseIsValid(feeData)) {
      print("Failed to retreive fee");
      return null;
    }

    final double? fee = feeData!['Fee'];
    if (fee == null) {
      print("Failed to parse fee");
      return null;
    }

    txData = _buildTransaction(
      toAddress: toAddress,
      fromAddress: fromAddress,
      amount: amount,
      nonce: nonce,
      timestamp: timestamp,
      fee: fee,
    );

    final hashData = (await txService.getHash(txData))!['data'];

    if (!_responseIsValid(hashData)) {
      print("Failed to retreive fee");
      return null;
    }

    final String? hash = hashData!['Hash'];

    if (hash == null) {
      return null;
    }

    return RawTxValue(
      fee: fee,
      hash: hash,
      nonce: nonce,
      timestamp: timestamp,
    );
  }

  static Future<secp256k1.Signature> _getSignature({
    required String message,
    required String privateKey,
  }) async {
    final hashMessage = sha256.convert(utf8.encode(message));
    final hashMessageString = hashMessage.toString();
    print("hashMessageString: $hashMessageString");

    var pk = secp256k1.PrivateKey.fromHex(privateKey);
    final sig = pk.signature(hashMessageString);

    return sig;
  }

  static bool _responseIsValid(Map<String, dynamic>? data) {
    if (data == null || data['Result'] != "Success") {
      return false;
    }
    return true;
  }

  static Map<String, dynamic> _buildTransaction({
    String? hash,
    required String toAddress,
    required String fromAddress,
    int type = 0,
    required double amount,
    required int nonce,
    double? fee,
    required int timestamp,
    String? signature,
  }) {
    return {
      'Hash': hash ?? '',
      'ToAddress': toAddress,
      'FromAddress': fromAddress,
      'TransactionType': type,
      'Amount': amount,
      'Nonce': nonce,
      'Fee': fee ?? 0,
      'Timestamp': timestamp,
      'Signature': signature ?? '',
      'Height': 0,
      'Data': null,
    };
  }

  static PC.SecureRandom _getSecureRandom() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(PC.KeyParameter(new Uint8List.fromList(seeds)));
    return secureRandom;
  }

  static String base58Encode(List<int> array) {
    const String ALPHABET =
        "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
    String output = "";

    BigInt encodeSize = BigInt.from(ALPHABET.length);
    BigInt arrayToInt = BigInt.zero;

    for (int i = 0; i < array.length; i++) {
      arrayToInt = (arrayToInt * BigInt.from(256)) + BigInt.from(array[i]);
    }

    while (arrayToInt > BigInt.zero) {
      int rem = (arrayToInt % encodeSize).toInt();
      arrayToInt = arrayToInt ~/ encodeSize;
      output = ALPHABET[rem] + output;
    }

    for (int i = 0; i < array.length && array[i] == 0; i++) {
      output = ALPHABET[0] + output;
    }

    return output;
  }

  static Uint8List? toDer(BigInt r, BigInt s) {
    String rHex = r.toRadixString(16);

    bool rHexPadded = false;

    if (rHex.length % 2 == 1) {
      rHex = "0$rHex";
      rHexPadded = true;
    }

    String sHex = s.toRadixString(16);

    bool sHexPadded = false;
    if (sHex.length % 2 == 1) {
      sHex = "0$sHex";
      sHexPadded = true;
    }

    try {
      return der.encode(
        DER(
          r: Uint8List.fromList(hex.decode(rHex)),
          s: Uint8List.fromList(hex.decode(sHex)),
        ),
      );
    } catch (e) {
      try {
        return der.encode(
          DER(
            r: Uint8List.fromList(
              hex.decode("${rHexPadded ? '' : '00'}$rHex"),
            ),
            s: Uint8List.fromList(
              hex.decode("${sHexPadded ? '' : '00'}$sHex"),
            ),
          ),
        );
      } catch (e) {
        try {
          return der.encode(
            DER(
              r: Uint8List.fromList(
                hex.decode(rHex),
              ),
              s: Uint8List.fromList(
                  hex.decode("${sHexPadded ? '' : '00'}$sHex")),
            ),
          );
        } catch (e) {
          try {
            return der.encode(
              DER(
                r: Uint8List.fromList(
                  hex.decode("${rHexPadded ? '' : '00'}$rHex"),
                ),
                s: Uint8List.fromList(hex.decode(sHex)),
              ),
            );
          } catch (e) {
            print(e);
            print("ENTIRE FAIL WTF");
            return null;
          }
        }
      }
    }
  }

  static Uint8List bigIntToUint8List(BigInt bigInt) {
    return bigIntToByteData(bigInt).buffer.asUint8List();
  }

  static ByteData bigIntToByteData(BigInt bigInt) {
    final data = ByteData((bigInt.bitLength / 8).ceil());
    var _bigInt = bigInt;

    for (var i = 1; i <= data.lengthInBytes; i++) {
      data.setUint8(data.lengthInBytes - i, _bigInt.toUnsigned(8).toInt());
      _bigInt = _bigInt >> 8;
    }

    return data;
  }

  // static BigInt bytesToBigInt(Uint8List bytes) {
  //   BigInt read(int start, int end) {
  //     if (end - start <= 4) {
  //       int result = 0;
  //       for (int i = end - 1; i >= start; i--) {
  //         result = result * 256 + bytes[i];
  //       }
  //       return new BigInt.from(result);
  //     }
  //     int mid = start + ((end - start) >> 1);
  //     var result = read(start, mid) +
  //         read(mid, end) * (BigInt.one << ((mid - start) * 8));
  //     return result;
  //   }

  //   return read(0, bytes.length);
  // }
  // static Uint8List bigIntToUint8List(BigInt number) {
  //   // Not handling negative numbers. Decide how you want to do that.
  //   int bytes = (number.bitLength + 7) >> 3;
  //   var b256 = BigInt.from(256);
  //   var result = Uint8List(bytes);
  //   for (int i = 0; i < bytes; i++) {
  //     result[i] = number.remainder(b256).toInt();
  //     number = number >> 8;
  //   }
  //   return result;
  // }
}
