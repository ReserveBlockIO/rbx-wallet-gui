// import 'package:rbx_wallet/features/btc/models/btc_transaction.dart';
// import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
// import 'package:rbx_wallet/features/btc/providers/btc_transaction_list_provider.dart';
// import 'package:rbx_wallet/features/btc/providers/tokenized_bitcoin_list_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'combined_btc_transaction_list_provider.g.dart';

// @Riverpod(keepAlive: true)
// List<BtcTransaction> combinedBtcTransactionList(CombinedBtcTransactionListRef ref) {
//   final accounts = ref.watch(btcAccountListProvider);

//   final List<BtcTransaction> transactions = [];
//   for (final a in accounts) {
//     transactions.addAll(ref.watch(btcTransactionListProvider(a.address)));
//   }

//   final tokens = ref.watch(tokenizedBitcoinListProvider);

//   for (final t in tokens) {
//     if (t.btcAddress != null) {
//       transactions.addAll(ref.watch(btcTransactionListProvider(t.btcAddress!)));
//     }
//   }

//   return transactions..sort((a, b) => a.timestamp > b.timestamp ? -1 : 1);
// }
