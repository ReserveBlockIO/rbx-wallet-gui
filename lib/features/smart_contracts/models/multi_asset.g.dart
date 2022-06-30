// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MultiAsset _$$_MultiAssetFromJson(Map<String, dynamic> json) =>
    _$_MultiAsset(
      id: json['id'] as String? ?? "",
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MultiAssetToJson(_$_MultiAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assets': instance.assets.map((e) => e.toJson()).toList(),
    };
