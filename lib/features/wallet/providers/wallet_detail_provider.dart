import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/singletons.dart';
import '../../../core/storage.dart';
import '../models/wallet.dart';
import 'wallet_list_provider.dart';

class WalletDetailProvider extends StateNotifier<Wallet> {
  final Reader read;

  WalletDetailProvider(this.read, Wallet wallet) : super(wallet);

  void rename(String name) {
    read(walletListProvider.notifier).rename(state, name);
  }

  void delete() {
    read(walletListProvider.notifier).delete(state);
    List<dynamic>? deleted = singleton<Storage>().getList(Storage.DELETED_WALLETS_KEY);

    deleted ??= [];

    deleted.add(state.address);
    singleton<Storage>().setList(Storage.DELETED_WALLETS_KEY, deleted);
  }
}

final walletDetailProvider = StateNotifierProviderFamily<WalletDetailProvider, Wallet, Wallet>((ref, wallet) {
  return WalletDetailProvider(ref.read, wallet);
});
