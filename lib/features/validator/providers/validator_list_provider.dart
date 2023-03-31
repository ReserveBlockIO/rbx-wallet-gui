import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../wallet/models/wallet.dart';

class ValidatorListProvider extends StateNotifier<List<Wallet>> {
  final Ref ref;

  ValidatorListProvider(this.ref, [List<Wallet> wallet = const []]) : super(wallet);

  void set(List<Wallet> wallets) {
    state = wallets;
  }
}

final validatorListProvider = StateNotifierProvider<ValidatorListProvider, List<Wallet>>((ref) {
  return ValidatorListProvider(ref);
});
