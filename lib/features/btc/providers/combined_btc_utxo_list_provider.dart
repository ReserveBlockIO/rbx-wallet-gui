import 'package:rbx_wallet/features/btc/models/btc_transaction.dart';
import 'package:rbx_wallet/features/btc/models/btc_utxo.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_utxo_list_provider.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_bitcoin_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combined_btc_utxo_list_provider.g.dart';

@Riverpod(keepAlive: true)
List<BtcUtxo> combinedBtcUtxoList(CombinedBtcUtxoListRef ref) {
  final accounts = ref.watch(btcAccountListProvider);

  final List<BtcUtxo> utxos = [];
  for (final a in accounts) {
    utxos.addAll(ref.watch(btcUtxoListProvider(a.address)));
  }
  final tokens = ref.watch(tokenizedBitcoinListProvider);

  for (final t in tokens) {
    if (t.btcAddress != null) {
      utxos.addAll(ref.watch(btcUtxoListProvider(t.btcAddress!)));
    }
  }

  return utxos..sort((a, b) => a.id > b.id ? -1 : 1);
}
