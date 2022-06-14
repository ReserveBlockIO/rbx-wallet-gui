// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:convert';
import 'dart:js' as js;
import 'package:rbx_wallet/features/keygen/bip32/bip32.dart' as bip32;
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:bip39/bip39.dart' as bip39;
// import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';

class KeygenService {
  static Future<Keypair> importPrivateKey(
    String privateKey, [
    String? mneumonic,
  ]) async {
    final String response =
        await js.context.callMethod('generate', [privateKey]);

    final a = response.split(":");
    final public = a.first;
    final private = a.last;

    // TODO: save keypair to storage stuff

    return Keypair(
      public: public,
      private: private,
      mneumonic: mneumonic,
    );
  }

  // static Future<Keypair?> _mneumonicToKeypairOLD(
  //   String mnemonic,
  //   int index,
  // ) async {
  //   final isValid = bip39.validateMnemonic(mnemonic);

  //   if (!isValid) {
  //     return null;
  //   }

  //   final masterPrivateSeed = bip39.mnemonicToSeed(mnemonic);

  //   print(HEX.encode(masterPrivateSeed));
  //   print('===========');

  //   // final networkType = bip32.NetworkType(
  //   //   wif: 0x3c,
  //   //   bip32: bip32.Bip32Type(
  //   //     private: 0x0488b21e,
  //   //     public: 0x0488ade4,
  //   //   ),
  //   // );

  //   // print(networkType);

  //   final node = bip32.BIP32.fromSeed(masterPrivateSeed);
  //   final pk = HEX.encode(node.privateKey!);
  //   print(pk);
  //   print("----------============------------");

  //   // final node2 = bip32.BIP32.fromPrivateKey(
  //   //   node.privateKey!,
  //   // );

  //   final derivedKey = node.derivePath("m/0'/0'/$index'");

  //   final value = HEX.encode(derivedKey.privateKey!);
  //   final keypair = await KeygenService.importPrivateKey(value, mnemonic);
  //   return keypair;
  // }

  static Future<Keypair?> _mneumonicToKeypair(
    String mnemonic,
    int index,
  ) async {
    final isValid = bip39.validateMnemonic(mnemonic);

    if (!isValid) {
      return null;
    }

    final masterPrivateSeed = bip39.mnemonicToSeed(mnemonic);
    final chain = bip32.Chain.seed(HEX.encode(masterPrivateSeed));
    final key = chain.forPath("m/0'/0'/$index'") as bip32.ExtendedPrivateKey;

    final keypair = await KeygenService.importPrivateKey(
      key.privateKeyHex(),
      mnemonic,
    );
    return keypair;
  }

  static Future<Keypair?> generate([int index = 0]) async {
    // final mnemonic = bip39.generateMnemonic();
    const mnemonic =
        "memory kidney tuition describe rhythm expose display dress unique course midnight notice";

    return _mneumonicToKeypair(mnemonic, index);
  }

  static Future<Keypair?> recover(String mnemonic, [int index = 0]) async {
    return _mneumonicToKeypair(mnemonic, index);
  }
}
