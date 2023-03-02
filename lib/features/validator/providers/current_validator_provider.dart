import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/env.dart';
import '../../../utils/toast.dart';
import '../../bridge/services/bridge_service.dart';
import '../../wallet/models/wallet.dart';

class CurrentValidatorProvider extends StateNotifier<Wallet?> {
  final Ref ref;

  CurrentValidatorProvider(this.ref, [Wallet? wallet]) : super(wallet);

  void set(Wallet? wallet) {
    state = wallet;
  }

  Future<bool> startValidating(String name) async {
    if (state == null) {
      return false;
    }

    if (!Env.allowValidating) {
      Toast.error("Validating disabled in this environment.");
      return false;
    }

    final response = await BridgeService().startValidating(state!.address, name);

    if (response == "FAIL") {
      Toast.error();
      return false;
    }

    if (response == "Node name already taken.") {
      Toast.error("Node name already taken.");
      return false;
    }

    return true;
  }

  Future<bool> stopValidating() async {
    if (state == null) {
      return false;
    }

    final success = await BridgeService().turnOffValidator(state!.address);
    return success;
  }
}

final currentValidatorProvider = StateNotifierProvider<CurrentValidatorProvider, Wallet?>((ref) {
  return CurrentValidatorProvider(ref);
});
