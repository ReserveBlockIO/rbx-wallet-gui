// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rarity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rarity _$$_RarityFromJson(Map<String, dynamic> json) => _$_Rarity(
      name: json['name'] as String? ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 1,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_RarityToJson(_$_Rarity instance) => <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'description': instance.description,
    };
