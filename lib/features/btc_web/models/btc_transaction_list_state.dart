import 'package:freezed_annotation/freezed_annotation.dart';
import 'btc_web_transaction.dart';

part 'btc_transaction_list_state.freezed.dart';

@freezed
class WebBtcTransactionListState with _$WebBtcTransactionListState {
  const WebBtcTransactionListState._();

  factory WebBtcTransactionListState({
    @Default(false) bool processing,
    @Default(false) bool canLoadMore,
    @Default([]) List<BtcWebTransaction> results,
  }) = _WebBtcTransactionListState;
}
