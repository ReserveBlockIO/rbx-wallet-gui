import 'package:rbx_wallet/features/keygen/models/keypair.dart';

// mock version of keygen service to allow compiling on non web devices

class KeygenService {
  static Future<Keypair> importPrivateKey(
    String privateKey, [
    String? mneumonic,
  ]) async {
    return Keypair(
      private: "mock",
      public: "mock",
      publicInflated: "mock",
      email: "mock@mock.com",
    );
  }

  static Future<Keypair?> seedToKeypair(
    String seed,
    int index,
  ) async {
    return Keypair(
      private: "mock",
      public: "mock",
      publicInflated: "mock",
      email: "mock@mock.com",
    );
  }

  static Future<Keypair?> generate([int index = 0]) async {
    return null;
  }

  static Future<Keypair?> recover(String mnemonic, [int index = 0]) async {
    return null;
  }
}
