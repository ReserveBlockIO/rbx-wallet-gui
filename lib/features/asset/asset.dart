import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/utils/formatting.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

bytesToNull(Uint8List? input) => null;
nullToNull(dynamic blah) => null;

@freezed
abstract class Asset with _$Asset {
  const Asset._();

  @JsonSerializable(explicitToJson: true)
  factory Asset({
    @JsonKey(name: "AssetId") required String id,
    @JsonKey(name: "Name") String? name,
    @JsonKey(name: "AssetAuthorName") String? authorName,
    @JsonKey(name: "Location") String? location,
    @JsonKey(name: "Extension") String? extension,
    @JsonKey(name: "FileSize") required int fileSize,
    @JsonKey(toJson: bytesToNull, fromJson: nullToNull) Uint8List? bytes,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  String get fileName {
    final slash = !kIsWeb && Platform.isWindows ? "\\" : "/";
    if (name != null) {
      return name!.split(slash).last;
    }

    if (location != null) {
      return location!.split(slash).last;
    }
    return "";
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

  String get fixedLocation {
    if (Platform.isWindows && location != null) {
      return location!;
    }

    if (location != null) {
      return location!.replaceAll("/Volumes/Macintosh HD/", '/');
    }

    return "";
  }

  File get file {
    return File(fixedLocation);
  }

  File get folder {
    return File(File(fixedLocation).parent.path);
  }

  String get filesizeLabel {
    return readableFileSize(fileSize);
  }

  String locationData(String scId) {
    return "${scId.replaceAll(':', '%3A')}||$name";
  }
}
