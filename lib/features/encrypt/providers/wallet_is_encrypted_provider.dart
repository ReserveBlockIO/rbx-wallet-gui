import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bridge/services/bridge_service.dart';

class WalletIsEncryptedProvider extends StateNotifier<bool> {
  WalletIsEncryptedProvider() : super(false) {
    check();
  }

  Future<void> check() async {
    state = await BridgeService().checkIfEncrypted();
  }

  void set(bool value) {
    state = value;
  }
}

final walletIsEncryptedProvider = StateNotifierProvider<WalletIsEncryptedProvider, bool>((ref) {
  return WalletIsEncryptedProvider();
});
