// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:bip39/bip39.dart' as bip39;
import 'package:hex/hex.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/keygen/bip32/bip32.dart' as bip32;
import 'package:rbx_wallet/features/keygen/models/keypair.dart';

class KeygenService {
  static Future<Keypair> importPrivateKey(
    String privateKey, [
    String? mneumonic,
  ]) async {
    final String response = await js.context.callMethod('importPrivateKey', [privateKey, Env.isTestNet]);

    final a = response.split(":");
    final public = a[0];
    final publicInflated = a[1];
    final private = a[2];

    return Keypair(
      public: public,
      publicInflated: publicInflated,
      private: private,
      mneumonic: mneumonic,
    );
  }

  static Future<String> addressFromPrivateKey(String privateKey) async {
    final String response = await js.context.callMethod('addressFromPrivateKey', [privateKey, Env.isTestNet]);
    return response;
  }

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

    String privateKey = key.privateKeyHex();
    if (privateKey.length > 64 && privateKey.startsWith("00")) {
      privateKey = privateKey.substring(2);
    }

    final keypair = await KeygenService.importPrivateKey(
      privateKey,
      mnemonic,
    );
    return keypair;
  }

  static Future<Keypair?> seedToKeypair(String seed) async {
    final String privateKeyHex = await js.context.callMethod('seedToPrivate', [seed]);

    final keypair = await KeygenService.importPrivateKey(privateKeyHex);
    return keypair;
  }

  static Future<Keypair?> generate([int index = 0]) async {
    final mnemonic = bip39.generateMnemonic();

    return _mneumonicToKeypair(mnemonic, index);
  }

  static Future<Keypair?> recover(String mnemonic, [int index = 0]) async {
    return _mneumonicToKeypair(mnemonic, index);
  }
}
