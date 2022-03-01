import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class WalletDetailProvider extends StateNotifier<Wallet> {
  final Reader read;

  WalletDetailProvider(this.read, Wallet wallet) : super(wallet);

  void rename(String name) {
    read(walletListProvider.notifier).rename(state, name);
  }

  void delete() {
    read(walletListProvider.notifier).delete(state);
    List<dynamic>? deleted =
        singleton<Storage>().getList(Storage.DELETED_WALLETS_KEY);

    deleted ??= [];

    deleted.add(state.address);
    singleton<Storage>().setList(Storage.DELETED_WALLETS_KEY, deleted);
  }
}

final walletDetailProvider =
    StateNotifierProviderFamily<WalletDetailProvider, Wallet, Wallet>(
        (ref, wallet) {
  return WalletDetailProvider(ref.read, wallet);
});
