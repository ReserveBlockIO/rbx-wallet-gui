// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Asset _$$_AssetFromJson(Map<String, dynamic> json) => _$_Asset(
      id: json['AssetId'] as String,
      name: json['Name'] as String?,
      authorName: json['AssetAuthorName'] as String?,
      location: json['Location'] as String?,
      extension: json['Extension'] as String?,
      fileSize: json['FileSize'] as int,
      bytes: nullToNull(json['bytes']),
      localPath: json['localPath'] as String?,
    );

Map<String, dynamic> _$$_AssetToJson(_$_Asset instance) => <String, dynamic>{
      'AssetId': instance.id,
      'Name': instance.name,
      'AssetAuthorName': instance.authorName,
      'Location': instance.location,
      'Extension': instance.extension,
      'FileSize': instance.fileSize,
    };
