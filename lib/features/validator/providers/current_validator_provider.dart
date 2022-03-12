import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CurrentValidatorProvider extends StateNotifier<Wallet?> {
  final Reader read;

  CurrentValidatorProvider(this.read, [Wallet? wallet]) : super(wallet);

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

    final response =
        await BridgeService().startValidating(state!.address, name);

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

final currentValidatorProvider =
    StateNotifierProvider<CurrentValidatorProvider, Wallet?>((ref) {
  return CurrentValidatorProvider(ref.read);
});
