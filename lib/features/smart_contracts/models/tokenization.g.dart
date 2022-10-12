// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokenization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tokenization _$$_TokenizationFromJson(Map<String, dynamic> json) =>
    _$_Tokenization(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      photo: json['photo'] == null
          ? null
          : Asset.fromJson(json['photo'] as Map<String, dynamic>),
      provenance: json['provenance'] == null
          ? null
          : Asset.fromJson(json['provenance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TokenizationToJson(_$_Tokenization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'properties': instance.properties.map((e) => e.toJson()).toList(),
      'photo': instance.photo?.toJson(),
      'provenance': instance.provenance?.toJson(),
    };
