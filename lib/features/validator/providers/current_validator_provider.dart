import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

class CurrentValidatorProvider extends StateNotifier<Wallet?> {
  final Reader read;

  CurrentValidatorProvider(this.read, [Wallet? wallet]) : super(wallet);

  void set(Wallet? wallet) {
    state = wallet;
  }
}

final currentValidatorProvider =
    StateNotifierProvider<CurrentValidatorProvider, Wallet?>((ref) {
  return CurrentValidatorProvider(ref.read);
});
