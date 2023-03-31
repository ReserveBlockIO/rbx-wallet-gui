import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';

class RemoteThumbnailPreview extends StatelessWidget {
  final double width;
  final double height;
  final Nft nft;
  final String filename;
  final BoxFit boxFit;

  const RemoteThumbnailPreview({
    super.key,
    required this.nft,
    required this.filename,
    this.width = 32,
    this.height = 32,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final ds = Platform.isMacOS ? "/" : "\\";
    final path = "${nft.thumbsPath}$ds$filename";

    final ext = path.split(".").last.toLowerCase();
    final imageExtensions = ['jpg', 'jpeg', 'gif', 'png', 'webp'];

    if (imageExtensions.contains(ext)) {
      return Image.file(
        File(path),
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }

    return Icon(Icons.document_scanner_sharp);
  }
}
