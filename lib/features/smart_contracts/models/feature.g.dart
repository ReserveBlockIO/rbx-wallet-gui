// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feature _$$_FeatureFromJson(Map<String, dynamic> json) => _$_Feature(
      type: $enumDecodeNullable(_$FeatureTypeEnumMap, json['type']) ??
          FeatureType.royalty,
      data: json['data'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_FeatureToJson(_$_Feature instance) =>
    <String, dynamic>{
      'type': _$FeatureTypeEnumMap[instance.type]!,
      'data': instance.data,
    };

const _$FeatureTypeEnumMap = {
  FeatureType.royalty: 'royalty',
  FeatureType.evolution: 'evolution',
  FeatureType.multiAsset: 'multiAsset',
  FeatureType.ticket: 'ticket',
  FeatureType.tokenization: 'tokenization',
  FeatureType.music: 'music',
  FeatureType.additionalOwners: 'additionalOwners',
  FeatureType.selfDestructive: 'selfDestructive',
  FeatureType.consumable: 'consumable',
  FeatureType.fractionalization: 'fractionalization',
  FeatureType.pair: 'pair',
  FeatureType.soulBound: 'soulBound',
  FeatureType.wrap: 'wrap',
  FeatureType.token: 'token',
  FeatureType.btcTokenization: 'btcTokenization',
  FeatureType.notImplemented: 'notImplemented',
};
