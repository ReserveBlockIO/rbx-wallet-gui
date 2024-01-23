import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/btc/models/btc_wallet.dart';

class BtcSelectedWalletProvider extends StateNotifier<BtcWallet?> {
  BtcSelectedWalletProvider() : super(null);

  void set(BtcWallet wallet) {
    state = wallet;
  }

  void clear() {
    state = null;
  }
}

final btcSelectedWalletProvider = StateNotifierProvider<BtcSelectedWalletProvider, BtcWallet?>((ref) {
  return BtcSelectedWalletProvider();
});
