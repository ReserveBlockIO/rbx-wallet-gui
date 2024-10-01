import '../models/keypair.dart';
import '../models/ra_keypair.dart';

// mock version of keygen service to allow compiling on non web devices

class KeygenService {
  static Future<Keypair> importPrivateKey(
    String privateKey, [
    String? mneumonic,
  ]) async {
    return Keypair(
      private: "mock",
      address: "mock",
      public: "mock",
      email: "mock@mock.com",
    );
  }

  static Future<RaKeypair> importReserveAccountPrivateKey(String privateKey) async {
    return RaKeypair(
      private: "mock",
      address: "mock",
      public: "mock",
      recoveryPrivate: "mock",
      recoveryAddress: "mock",
      recoveryPublic: "mock",
      restoreCode: "mock",
    );
  }

  static Future<String> addressFromPrivateKey(String privateKey) async {
    return "";
  }

  static Future<Keypair?> seedToKeypair(
    String seed,
  ) async {
    return Keypair(
      private: "mock",
      address: "mock",
      public: "mock",
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
