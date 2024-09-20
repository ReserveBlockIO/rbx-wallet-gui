import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_data.freezed.dart';
part 'price_data.g.dart';

@freezed
class PriceData with _$PriceData {
  const PriceData._();

  factory PriceData({
    @JsonKey(name: 'coin_type') required String coinType,
    @JsonKey(name: 'usdt_price') required double usdtPrice,
    @JsonKey(name: 'volume_24h') required double volume24h,
    @JsonKey(name: 'percent_change_1h') required double percentChange1h,
    @JsonKey(name: 'percent_change_24h') required double percentChange24h,
    @JsonKey(name: 'percent_change_7d') required double percentChange7d,
    @JsonKey(name: 'percent_change_30d') required double percentChange30d,
    @JsonKey(name: 'percent_change_60d') required double percentChange60d,
    @JsonKey(name: 'percent_change_90d') required double percentChange90d,
    @JsonKey(name: 'last_updated') required DateTime lastUpdated,
  }) = _PriceData;

  factory PriceData.fromJson(Map<String, dynamic> json) => _$PriceDataFromJson(json);
}
