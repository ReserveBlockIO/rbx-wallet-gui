import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/btc_transaction_list_state.dart';
import '../models/btc_web_transaction.dart';
import '../services/btc_web_service.dart';

class BtcWebTransactionListProvider extends StateNotifier<BtcTransactionListState> {
  final Ref ref;
  final String address;

  BtcWebTransactionListProvider(this.ref, this.address) : super(BtcTransactionListState()) {
    load();
  }

  Future<void> load() async {
    state = state.copyWith(processing: true);

    final transactions = await BtcWebService().listTransactions(address);
    state = state.copyWith(results: transactions, processing: false);
  }

  Future<void> reload() async {
    await load();
  }
}

final btcWebTransactionListProvider = StateNotifierProvider.family<BtcWebTransactionListProvider, BtcTransactionListState, String>((ref, address) {
  return BtcWebTransactionListProvider(ref, address);
});
