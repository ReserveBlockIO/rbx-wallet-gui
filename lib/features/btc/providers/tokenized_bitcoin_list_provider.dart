import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tokenized_bitcoin.dart';
import '../services/btc_service.dart';

class TokenizedBitcoinListProvider extends StateNotifier<List<TokenizedBitcoin>> {
  final Ref ref;

  TokenizedBitcoinListProvider(this.ref) : super([]) {
    load();
  }

  Future<void> load() async {
    state = await BtcService().listTokenizedBitcoins();
  }

  void refresh() {
    load();
  }
}

final tokenizedBitcoinListProvider = StateNotifierProvider<TokenizedBitcoinListProvider, List<TokenizedBitcoin>>(
  (ref) => TokenizedBitcoinListProvider(ref),
);
