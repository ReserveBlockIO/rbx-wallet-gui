import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

class WalletIsEncryptedProvider extends StateNotifier<bool> {
  WalletIsEncryptedProvider() : super(false) {
    init();
  }

  Future<void> init() async {
    state = await BridgeService().checkIfEncrypted();
  }

  void set(bool value) {
    state = value;
  }
}

final walletIsEncryptedProvider = StateNotifierProvider<WalletIsEncryptedProvider, bool>((ref) {
  return WalletIsEncryptedProvider();
});
