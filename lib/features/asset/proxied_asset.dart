import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/utils/formatting.dart';

part 'proxied_asset.freezed.dart';

@freezed
class ProxiedAsset with _$ProxiedAsset {
  const ProxiedAsset._();

  factory ProxiedAsset({required String key, required int fileSize, required String fileName, required String authorName}) = _ProxiedAsset;

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

  String get url {
    return "${Env.transactionApiBaseUrl}/asset?key=$key";
  }

  String get filesizeLabel {
    return readableFileSize(fileSize);
  }
}
