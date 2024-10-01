// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_sc_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenScFeature _$$_TokenScFeatureFromJson(Map<String, dynamic> json) =>
    _$_TokenScFeature(
      name: json['TokenName'] as String? ?? "Unnamed",
      ticker: json['TokenTicker'] as String? ?? "unnamed",
      decimalPlaces:
          json['TokenDecimalPlaces'] as int? ?? TOKEN_DEFAULT_DECIMAL_PLACES,
      supply: (json['TokenSupply'] as num?)?.toDouble() ?? 0.0,
      burnable: json['TokenBurnable'] as bool? ?? false,
      mintable: json['TokenMintable'] as bool? ?? false,
      voting: json['TokenVoting'] as bool? ?? false,
      imageUrl: json['TokenImageURL'] as String?,
      imageBase64: json['TokenImageBase'] as String?,
    );

Map<String, dynamic> _$$_TokenScFeatureToJson(_$_TokenScFeature instance) =>
    <String, dynamic>{
      'TokenName': instance.name,
      'TokenTicker': instance.ticker,
      'TokenDecimalPlaces': instance.decimalPlaces,
      'TokenSupply': supplyToJson(instance.supply),
      'TokenBurnable': instance.burnable,
      'TokenMintable': instance.mintable,
      'TokenVoting': instance.voting,
      'TokenImageURL': instance.imageUrl,
      'TokenImageBase': instance.imageBase64,
    };
