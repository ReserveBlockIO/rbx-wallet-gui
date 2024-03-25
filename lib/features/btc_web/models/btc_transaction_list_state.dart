import 'package:freezed_annotation/freezed_annotation.dart';
import 'btc_web_transaction.dart';

part 'btc_transaction_list_state.freezed.dart';

@freezed
class BtcTransactionListState with _$BtcTransactionListState {
  const BtcTransactionListState._();

  factory BtcTransactionListState({
    @Default(false) bool processing,
    @Default(false) bool canLoadMore,
    @Default([]) List<BtcWebTransaction> results,
  }) = _BtcTransactionListState;
}
