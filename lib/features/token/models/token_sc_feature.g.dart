// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_sc_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenScFeature _$$_TokenScFeatureFromJson(Map<String, dynamic> json) =>
    _$_TokenScFeature(
      name: json['TokenName'] as String,
      ticker: json['TokenTicker'] as String,
      decimalPlaces: json['TokenDecimalPlaces'] as int,
      supply: (json['TokenSupply'] as num).toDouble(),
      burnable: json['TokenBurnable'] as bool,
      voting: json['TokenVoting'] as bool,
      imageUrl: json['TokenImageUrl'] as String?,
      imageBase64: json['TokenImageBase'] as String?,
    );

Map<String, dynamic> _$$_TokenScFeatureToJson(_$_TokenScFeature instance) =>
    <String, dynamic>{
      'TokenName': instance.name,
      'TokenTicker': instance.ticker,
      'TokenDecimalPlaces': instance.decimalPlaces,
      'TokenSupply': instance.supply,
      'TokenBurnable': instance.burnable,
      'TokenVoting': instance.voting,
      'TokenImageUrl': instance.imageUrl,
      'TokenImageBase': instance.imageBase64,
    };
