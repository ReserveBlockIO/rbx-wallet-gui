import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils/formatting.dart';

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
    @JsonKey(toJson: bytesToNull, fromJson: nullToNull, includeToJson: false) Uint8List? bytes,
    @JsonKey(includeToJson: false) String? localPath,
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

  String truncatedFileName([int maxLength = 24]) {
    if (maxLength >= fileName.length) {
      return fileName;
    }
    return fileName.replaceRange(maxLength, fileName.length, "...");
  }

  String get ext {
    return fileName.split('.').last.toLowerCase();
  }

  bool get isImage {
    final extensions = ['jpg', 'jpeg', 'gif', 'png', 'webp'];
    return extensions.contains(ext.toLowerCase());
  }

  bool get isPdf {
    return ext.toLowerCase() == "pdf";
  }

  String get fileType {
    switch (ext) {
      case "jpg":
      case "jpeg":
      case "png":
      case "gif":
      case "webp":
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
