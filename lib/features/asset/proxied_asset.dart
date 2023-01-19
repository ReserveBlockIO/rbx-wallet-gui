import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/env.dart';
import '../../utils/formatting.dart';

part 'proxied_asset.freezed.dart';

@freezed
class ProxiedAsset with _$ProxiedAsset {
  const ProxiedAsset._();

  factory ProxiedAsset({required String key, required int fileSize, required String fileName, required String authorName}) = _ProxiedAsset;

  String get ext {
    return fileName.split('.').last.toLowerCase();
  }

  bool get isImage {
    final extensions = ['jpg', 'jpeg', 'gif', 'png', 'webp'];
    return extensions.contains(ext);
  }

  bool get isVideo {
    final extensions = ['mp4', 'mov', 'avi', 'webm', 'm4v'];
    return extensions.contains(ext);
  }

  bool get isText {
    final extensions = ['txt', 'rtf'];
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
      case "webm":
      case "m4v":
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

  String get url {
    return "${Env.transactionApiBaseUrl}/asset?key=$key";
  }

  String get filesizeLabel {
    return readableFileSize(fileSize);
  }
}
