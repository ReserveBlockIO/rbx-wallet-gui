// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_bip66/dart_bip66.dart';
import 'package:hex/hex.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:secp256k1/secp256k1.dart' as secp256k1;

class RawTxValue {
  final String hash;
  final int nonce;
  final double fee;
  final int timestamp;
  final dynamic data;

  const RawTxValue({
    required this.hash,
    required this.nonce,
    required this.fee,
    required this.timestamp,
    this.data,
  });
}

class RawTransaction {
  static Future<Map<String, dynamic>?> generate({
    required Keypair keypair,
    required String toAddress,
    required double amount,
    required int txType,
    dynamic data,
    int? unlockHours,
  }) async {
    final unlockTimestamp = unlockHours != null ? (DateTime.now().add(Duration(hours: unlockHours)).millisecondsSinceEpoch / 1000).round() : null;

    final rawTx = await _getTransactionForSignature(
      fromAddress: keypair.address,
      toAddress: toAddress,
      amount: amount,
      data: data,
      txType: txType,
      unlockTimestamp: unlockTimestamp,
    );

    if (rawTx == null) {
      return null;
    }

    final hash = rawTx.hash;

    final signature = await getSignature(
      message: hash,
      privateKey: keypair.private,
      publicKey: keypair.public,
    );

    if (signature == null) {
      return null;
    }

    final rawTxService = RawService();

    final signatureIsValid = await rawTxService.validateSignature(
      hash,
      keypair.address,
      signature,
    );

    if (!signatureIsValid) {
      print("Signature not valid");
      return null;
    }

    final txData = buildTransaction(
      type: txType,
      hash: rawTx.hash,
      toAddress: toAddress,
      fromAddress: keypair.address,
      amount: amount,
      nonce: rawTx.nonce,
      timestamp: rawTx.timestamp,
      fee: rawTx.fee,
      signature: signature,
      data: data,
      unlockTimestamp: unlockTimestamp,
    );

    final verifyTransactionData = await rawTxService.sendTransaction(
      transactionData: txData,
      execute: false,
    );

    if (verifyTransactionData == null) {
      print("Transaction not valid");
      return null;
    }

    if (verifyTransactionData['Result'] == "Fail") {
      print("Transaction Not Verified");
      print(verifyTransactionData['Message']);
      return null;
    }

    return txData;
  }

  static Future<RawTxValue?> _getTransactionForSignature({
    required String fromAddress,
    required String toAddress,
    required double amount,
    required int txType,
    dynamic data,
    int? unlockTimestamp,
  }) async {
    final rawTxService = RawService();

    final timestamp = await rawTxService.getTimestamp();

    if (timestamp == null) {
      print("Failed to retrieve timestamp");
      return null;
    }

    final nonce = await rawTxService.getNonce(fromAddress);
    if (nonce == null) {
      print("Failed to retrieve nonce");
      return null;
    }

    Map<String, dynamic> txData = buildTransaction(
      toAddress: toAddress,
      fromAddress: fromAddress,
      amount: amount,
      nonce: nonce,
      timestamp: timestamp,
      type: txType,
      data: data,
      unlockTimestamp: unlockTimestamp,
    );

    final fee = await rawTxService.getFee(txData);

    if (fee == null) {
      print("Failed to parse fee");
      return null;
    }

    txData = buildTransaction(
      type: txType,
      toAddress: toAddress,
      fromAddress: fromAddress,
      amount: amount,
      nonce: nonce,
      timestamp: timestamp,
      fee: fee,
      data: data,
      unlockTimestamp: unlockTimestamp,
    );

    final hash = await rawTxService.getHash(txData);

    if (hash == null) {
      print("Failed to parse hash");

      return null;
    }

    return RawTxValue(
      fee: fee,
      hash: hash,
      nonce: nonce,
      timestamp: timestamp,
      data: data,
    );
  }

  static Future<String?> getSignature({
    required String message,
    required String privateKey,
    required String publicKey,
  }) async {
    final hashMessage = sha256.convert(utf8.encode(message));
    final hashMessageString = hashMessage.toString();

    var pk = secp256k1.PrivateKey.fromHex(privateKey);
    final signature = pk.signature(hashMessageString);

    final r = signature.R;
    final s = signature.S;
    final der = toDer(r, s);
    if (der == null) {
      print("Der failed");
      return null;
    }

    final base64Signature = base64Encode(der);

    if (publicKey.startsWith("04")) {
      publicKey = publicKey.replaceFirst("04", "");
    }

    final hex = HEX.decode(publicKey);

    final base58PublicKey = base58Encode(hex);

    final fullSignature = "$base64Signature.$base58PublicKey";

    return fullSignature;
  }

  static bool _responseIsValid(Map<String, dynamic>? data) {
    if (data == null || data['Result'] != "Success") {
      return false;
    }
    return true;
  }

  static Map<String, dynamic> buildTransaction({
    String? hash,
    required String toAddress,
    required String fromAddress,
    required int type,
    required double amount,
    required int nonce,
    double? fee,
    required int timestamp,
    String? signature,
    dynamic data,
    int? unlockTimestamp,
  }) {
    return {
      'Hash': hash ?? '',
      'ToAddress': toAddress,
      'FromAddress': fromAddress,
      'TransactionType': type,
      'Amount': amount.toDouble(),
      'Nonce': nonce,
      'Fee': fee ?? 0,
      'Timestamp': timestamp,
      'Signature': signature ?? '',
      'Height': 0,
      'Data': data,
      'UnlockTime': unlockTimestamp,
    };
  }

  static String base58Encode(List<int> array) {
    const String ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
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
              s: Uint8List.fromList(hex.decode("${sHexPadded ? '' : '00'}$sHex")),
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
}
