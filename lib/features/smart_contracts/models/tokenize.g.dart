// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokenize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tokenize _$$_TokenizeFromJson(Map<String, dynamic> json) => _$_Tokenize(
      assetName: json['AssetName'] as String,
      assetTicker: json['AssetTicker'] as String,
      keyRevealed: json['KeyRevealed'] as bool? ?? false,
      keyRevealedRequestHash: json['KeyRevealedRequestHash'] as String?,
      imageBase: json['ImageBase'] as String?,
    );

Map<String, dynamic> _$$_TokenizeToJson(_$_Tokenize instance) =>
    <String, dynamic>{
      'AssetName': instance.assetName,
      'AssetTicker': instance.assetTicker,
      'KeyRevealed': instance.keyRevealed,
      'KeyRevealedRequestHash': instance.keyRevealedRequestHash,
      'ImageBase': instance.imageBase,
    };
