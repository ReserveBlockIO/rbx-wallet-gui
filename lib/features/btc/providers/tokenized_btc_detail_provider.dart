import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/btc/models/tokenized_bitcoin.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_bitcoin_list_provider.dart';

import 'package:collection/collection.dart';

final tokenizedBtcDetailProvider = Provider.family<TokenizedBitcoin?, double>((ref, arg) {
  return ref.watch(tokenizedBitcoinListProvider).firstWhereOrNull((t) => t.id == arg);
});
