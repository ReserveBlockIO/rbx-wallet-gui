import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
abstract class Asset with _$Asset {
  const Asset._();

  @JsonSerializable(explicitToJson: true)
  factory Asset({
    @JsonKey(name: "AssetId") required String id,
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Location") required String location,
    @JsonKey(name: "Extension") required String extension,
    @JsonKey(name: "FileSize") required int fileSize,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  String get fileName {
    return location.split("/").last;
  }

  String get ext {
    return fileName.split('.').last.toLowerCase();
  }

  bool get isImage {
    final extensions = ['jpg', 'jpeg', 'gif', 'png'];
    return extensions.contains(ext);
  }

  String get fileType {
    //TODO: more of this jazz
    switch (ext) {
      case "jpg":
      case "jpeg":
      case "png":
      case "gif":
        return "Image";
      case "pdf":
      case "doc":
      case "docx":
        return "Document";
      default:
        return "File";
    }
  }

  File get file {
    return File(location);
  }

  String get folder {
    return File(location).parent.path;
  }
}
