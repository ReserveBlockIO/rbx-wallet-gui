import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bridge/services/bridge_service.dart';

class ValidatingStatusProvider extends StateNotifier<bool> {
  ValidatingStatusProvider() : super(false) {
    init();
  }
  void init() {
    check(true);
  }

  Future<void> check([bool loop = false]) async {
    final status = await BridgeService().isValidating();

    if (status == true) {
      state = true;
    } else if (status == false) {
      state = false;
    }

    if (loop) {
      await Future.delayed(const Duration(seconds: 5));
      check(true);
    }
  }
}

final validatingStatusProvider = StateNotifierProvider<ValidatingStatusProvider, bool>((ref) {
  return ValidatingStatusProvider();
});
