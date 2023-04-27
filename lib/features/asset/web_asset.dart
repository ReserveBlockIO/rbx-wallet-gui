import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebAsset {
  final String location;

  const WebAsset({
    required this.location,
  });

  String get filename {
    return location.split("/").last;
  }

  String get extension {
    return location.split(".").last.toLowerCase();
  }

  bool get isImage {
    final extensions = ['jpg', 'jpeg', 'gif', 'png', 'webp'];
    return extensions.contains(extension);
  }

  bool get isVideo {
    final extensions = ['mp4', 'mov', 'avi', 'webm', 'm4v'];
    return extensions.contains(extension);
  }

  bool get isText {
    final extensions = ['txt', 'rtf'];
    return extensions.contains(extension);
  }

  String get fileType {
    switch (extension) {
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
}
