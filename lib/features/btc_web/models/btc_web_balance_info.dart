import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc_web_balance_info.freezed.dart';
part 'btc_web_balance_info.g.dart';

@freezed
class BtcWebBalanceInfo with _$BtcWebBalanceInfo {
  const BtcWebBalanceInfo._();

  factory BtcWebBalanceInfo({
    required int totalRecieved,
    required int totalSent,
    required int balance,
    required int unconfirmedBalance,
    required int finalBalance,
    required int txCount,
    required int unconfirmedTxCount,
    required int finalTxCount,
  }) = _BtcWebBalanceInfo;

  factory BtcWebBalanceInfo.fromJson(Map<String, dynamic> json) => _$BtcWebBalanceInfoFromJson(json);
}
