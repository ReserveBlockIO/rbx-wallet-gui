import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/btc/models/btc_wallet.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';

class BtcWalletListProvider extends StateNotifier<List<BtcWallet>> {
  BtcWalletListProvider() : super([]);

  Future<void> load() async {
    final wallets = await BtcService().listWallets();

    state = wallets;
  }
}

final btcWalletListProvider = StateNotifierProvider<BtcWalletListProvider, List<BtcWallet>>((ref) {
  return BtcWalletListProvider();
});
