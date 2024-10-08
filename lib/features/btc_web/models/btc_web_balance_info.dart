import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/app_constants.dart';

part 'btc_web_balance_info.freezed.dart';
part 'btc_web_balance_info.g.dart';

@freezed
class BtcWebBalanceInfo with _$BtcWebBalanceInfo {
  const BtcWebBalanceInfo._();

  factory BtcWebBalanceInfo({
    required int totalRecieved,
    required int totalSent,
    required int balance,
    required int txCount,
  }) = _BtcWebBalanceInfo;

  factory BtcWebBalanceInfo.fromJson(Map<String, dynamic> json) => _$BtcWebBalanceInfoFromJson(json);

  double get btcBalance {
    return balance * BTC_SATOSHI_MULTIPLIER;
  }

  double get btcTotalRecieved {
    return totalRecieved * BTC_SATOSHI_MULTIPLIER;
  }

  double get btcTotalSent {
    return totalSent * BTC_SATOSHI_MULTIPLIER;
  }
}
