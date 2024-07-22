import '../models/btc_transaction.dart';
import '../services/btc_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'btc_transaction_list_provider.g.dart';

@Riverpod(keepAlive: true)
class BtcTransactionList extends _$BtcTransactionList {
  @override
  List<BtcTransaction> build() {
    return [];
  }

  load() async {
    final transactions = await BtcService().listAllTransactions();
    state = transactions..sort((a, b) => a.timestamp > b.timestamp ? -1 : 1);
  }
}
