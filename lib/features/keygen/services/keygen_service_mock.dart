import '../models/keypair.dart';

// mock version of keygen service to allow compiling on non web devices

class KeygenService {
  static Future<Keypair> importPrivateKey(
    String privateKey,
    String email, [
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

  static Future<Keypair?> generate(String email, [int index = 0]) async {
    return null;
  }

  static Future<Keypair?> recover(String mnemonic, String email, [int index = 0]) async {
    return null;
  }
}
