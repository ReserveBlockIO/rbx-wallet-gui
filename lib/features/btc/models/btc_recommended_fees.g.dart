// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_recommended_fees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BtcRecommendedFees _$$_BtcRecommendedFeesFromJson(
        Map<String, dynamic> json) =>
    _$_BtcRecommendedFees(
      fastestFee: json['fastestFee'] as int,
      halfHourFee: json['halfHourFee'] as int,
      hourFee: json['hourFee'] as int,
      economyFee: json['economyFee'] as int,
      minimumFee: json['minimumFee'] as int,
    );

Map<String, dynamic> _$$_BtcRecommendedFeesToJson(
        _$_BtcRecommendedFees instance) =>
    <String, dynamic>{
      'fastestFee': instance.fastestFee,
      'halfHourFee': instance.halfHourFee,
      'hourFee': instance.hourFee,
      'economyFee': instance.economyFee,
      'minimumFee': instance.minimumFee,
    };
