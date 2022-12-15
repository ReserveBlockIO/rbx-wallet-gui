import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

class PasswordRequiredProvider extends StateNotifier<bool> {
  PasswordRequiredProvider() : super(false) {
    Timer.periodic(Duration(seconds: 10), (timer) {
      check();
    });
    check();
  }

  Future<bool> check() async {
    final isEncrypted = await BridgeService().checkIfEncrypted();

    if (!isEncrypted) {
      state = false;
      return false;
    }

    final isNeeded = await BridgeService().checkIfPasswordIsNeeded();
    if (isNeeded) {
      state = false;
      return false;
    }

    state = true;
    return true;
  }

  Future<bool> unlock(String password) async {
    final unlocked = await BridgeService().unlockWallet(password);
    if (unlocked) {
      final locked = await check();
      return !locked;
    }

    return false;
  }
}

final passwordRequiredProvider = StateNotifierProvider<PasswordRequiredProvider, bool>((ref) {
  return PasswordRequiredProvider();
});
