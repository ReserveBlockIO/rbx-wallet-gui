// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pair _$$_PairFromJson(Map<String, dynamic> json) => _$_Pair(
      id: json['id'] as String? ?? "",
      network: json['network'] as String? ?? "VFX",
      nftAddress: json['nftAddress'] as String? ?? "",
      description: json['description'] as String? ?? "",
      reason: json['reason'] as String? ?? "",
      metadataUrl: json['metadataUrl'] as String? ?? "",
      provenance: json['provenance'] == null
          ? null
          : Asset.fromJson(json['provenance'] as Map<String, dynamic>),
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PairToJson(_$_Pair instance) => <String, dynamic>{
      'id': instance.id,
      'network': instance.network,
      'nftAddress': instance.nftAddress,
      'description': instance.description,
      'reason': instance.reason,
      'metadataUrl': instance.metadataUrl,
      'provenance': instance.provenance?.toJson(),
      'properties': instance.properties.map((e) => e.toJson()).toList(),
    };
