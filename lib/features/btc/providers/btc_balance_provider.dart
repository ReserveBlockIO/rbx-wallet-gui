import 'btc_account_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'btc_balance_provider.g.dart';

@Riverpod(keepAlive: true)
double btcBalance(BtcBalanceRef ref) {
  return ref.watch(btcAccountListProvider).fold(0, (previousValue, a) => previousValue + a.balance);
}
