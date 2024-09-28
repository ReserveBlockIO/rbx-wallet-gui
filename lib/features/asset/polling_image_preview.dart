import 'dart:io';

import 'package:flutter/material.dart';

class PollingImagePreview extends StatefulWidget {
  const PollingImagePreview({
    Key? key,
    required this.localPath,
    required this.expectedSize,
    this.withProgress = true,
  }) : super(key: key);

  final String localPath;
  final int expectedSize;
  final bool withProgress;

  @override
  State<PollingImagePreview> createState() => _PollingImagePreviewState();
}

class _PollingImagePreviewState extends State<PollingImagePreview> {
  bool ready = false;
  bool hide = false;
  int? currentSize;

  @override
  void initState() {
    confirmFileSize();
    super.initState();
  }

  Future<void> confirmFileSize([int attempt = 1]) async {
    final size = await File(widget.localPath).length();

    if (size >= widget.expectedSize) {
      if (attempt == 1) {
        setState(() {
          ready = true;
        });
      } else {
        await FileImage(File(widget.localPath)).evict();
        setState(() {
          hide = true;
        });
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          hide = false;
          ready = true;
        });
      }
    } else {
      setState(() {
        ready = false;
        currentSize = size;
      });
      await Future.delayed(const Duration(seconds: 3));
      confirmFileSize(attempt + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hide) {
      return const SizedBox();
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.file(
        File(widget.localPath),
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) {
          return Text(
            "File not found for preview.\nLikely this means this NFT no longer exists on this machine.\n",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.left,
          );
        },
      ),
    );

    // return Stack(
    //   children: [
    //     Positioned.fill(
    //       child: Image.file(
    //         File(widget.localPath),
    //         width: double.infinity,
    //         fit: BoxFit.cover,
    //         errorBuilder: (context, _, __) {
    //           return Text(
    //             "File not found for preview.\nLikely this means this NFT no longer exists on this machine.\n",
    //             style: Theme.of(context).textTheme.caption,
    //             textAlign: TextAlign.left,
    //           );
    //         },
    //       ),
    //     ),
    //     if (!ready && widget.withProgress)
    //       Container(
    //         color: Colors.black38,
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: currentSize != null ? Text("Transferred $currentSize of ${widget.expectedSize} bytes.") : Text("Transferring..."),
    //         ),
    //       ),
    //   ],
    // );
  }
}
