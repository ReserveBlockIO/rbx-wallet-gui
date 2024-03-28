import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc_recommended_fees.freezed.dart';
part 'btc_recommended_fees.g.dart';

@freezed
class BtcRecommendedFees with _$BtcRecommendedFees {
  const BtcRecommendedFees._();

  factory BtcRecommendedFees({
    required int fastestFee,
    required int halfHourFee,
    required int hourFee,
    required int economyFee,
    required int minimumFee,
  }) = _BtcRecommendedFees;

  factory BtcRecommendedFees.fromJson(Map<String, dynamic> json) => _$BtcRecommendedFeesFromJson(json);

  factory BtcRecommendedFees.fallback() {
    return BtcRecommendedFees(
      fastestFee: 30,
      halfHourFee: 27,
      hourFee: 25,
      economyFee: 12,
      minimumFee: 6,
    );
  }
}
