import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/utils/formatting.dart';

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
      case "mov":
      case "mp4":
      case "avi":
        return "Video";
      case "mp3":
      case "m4a":
      case "wav":
      case "flac":
        return "Audio";
      default:
        return "File";
    }
  }

  IconData get icon {
    switch (fileType) {
      case "Image":
        return FontAwesomeIcons.fileImage;
      case "Document":
        return FontAwesomeIcons.filePdf;
      case "Video":
        return FontAwesomeIcons.fileVideo;
      case "Audio":
        return FontAwesomeIcons.fileAudio;
      default:
        return FontAwesomeIcons.file;
    }
  }

  File get file {
    return File(location);
  }

  String get folder {
    return File(location).parent.path;
  }

  String get filesizeLabel {
    return readableFileSize(fileSize);
  }
}
