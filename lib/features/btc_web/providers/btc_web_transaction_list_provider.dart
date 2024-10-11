import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/btc_web_transaction.dart';
import '../services/btc_web_service.dart';

class BtcWebTransactionListProvider extends StateNotifier<List<BtcWebTransaction>> {
  final Ref ref;
  final String address;

  BtcWebTransactionListProvider(this.ref, this.address) : super([]) {
    load();
  }

  Future<void> load() async {
    final transactions = await BtcWebService().listTransactions(address);
    state = transactions;
  }

  Future<void> reload() async {
    await load();
  }
}

final btcWebTransactionListProvider = StateNotifierProvider.family<BtcWebTransactionListProvider, List<BtcWebTransaction>, String>((ref, address) {
  return BtcWebTransactionListProvider(ref, address);
});
