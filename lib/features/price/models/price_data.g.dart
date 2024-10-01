// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceData _$$_PriceDataFromJson(Map<String, dynamic> json) => _$_PriceData(
      coinType: json['coin_type'] as String,
      usdtPrice: (json['usdt_price'] as num).toDouble(),
      volume24h: (json['volume_24h'] as num).toDouble(),
      percentChange1h: (json['percent_change_1h'] as num).toDouble(),
      percentChange24h: (json['percent_change_24h'] as num).toDouble(),
      percentChange7d: (json['percent_change_7d'] as num).toDouble(),
      percentChange30d: (json['percent_change_30d'] as num).toDouble(),
      percentChange60d: (json['percent_change_60d'] as num).toDouble(),
      percentChange90d: (json['percent_change_90d'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$$_PriceDataToJson(_$_PriceData instance) =>
    <String, dynamic>{
      'coin_type': instance.coinType,
      'usdt_price': instance.usdtPrice,
      'volume_24h': instance.volume24h,
      'percent_change_1h': instance.percentChange1h,
      'percent_change_24h': instance.percentChange24h,
      'percent_change_7d': instance.percentChange7d,
      'percent_change_30d': instance.percentChange30d,
      'percent_change_60d': instance.percentChange60d,
      'percent_change_90d': instance.percentChange90d,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };
