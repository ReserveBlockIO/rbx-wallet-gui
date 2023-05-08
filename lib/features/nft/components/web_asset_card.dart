import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/breakpoints.dart';
import '../../asset/web_asset.dart';
import '../models/nft.dart';
import 'package:video_player/video_player.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../utils/html_helpers.dart';

class WebAssetCard extends StatelessWidget {
  final Nft? nft;
  final WebAsset? asset;

  const WebAssetCard(this.nft, this.asset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Future<String> _assetDownload = Future<String>.delayed(
    //   const Duration(seconds: 1),
    //   () => 'Data Loaded',
    // );
    // final asset = nft!.primaryAssetWeb;
    final isMobile = BreakPoints.useMobileLayout(context);

    Future<String> _textDownload() async {
      final url = asset!.location;

      final response = await Dio().get(url);

      final value = response.data;
      return Future.value(value);
    }

    if (asset == null) return const SizedBox();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        asset!.isImage
            ? Image.network(
                asset!.location,
                width: double.infinity,
                height: isMobile ? 300 : null,
                fit: BoxFit.contain,
              )
            : asset!.isVideo
                ? VideoPreview(
                    videoUrl: asset!.location,
                  )
                : asset!.isText
                    ? FutureBuilder(
                        future: _textDownload(),
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data != null) {
                              return SelectableText(snapshot.data!);
                            }
                            return const Text("Error");
                          } else {
                            return const Center(child: CenteredLoader());
                          }
                        })
                    : Icon(asset!.icon),
        // if (asset!.authorName.isNotEmpty)
        //   Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 4),
        //     child: Text(
        //       "Creator: ${asset!.authorName}",
        //       style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
        //     ),
        //   ),
        Wrap(
          children: [
            SizedBox(
              width: 200,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(asset!.icon),
                title: Text(asset!.fileType),
                subtitle: const Text("File Type"),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                leading: const Icon(Icons.line_weight),
                contentPadding: EdgeInsets.zero,
                title: Text(nft!.primaryAsset.filesizeLabel),
                subtitle: const Text("File Size"),
              ),
            ),
          ],
        ),
        const Divider(),
        Center(
          child: AppButton(
            label: "Download Asset",
            icon: Icons.file_open,
            onPressed: () {
              HtmlHelpers().triggerDownload(asset!.location);
            },
          ),
        ),
      ],
    );
  }
}

class VideoPreview extends StatefulWidget {
  final String videoUrl;
  const VideoPreview({required this.videoUrl, Key? key}) : super(key: key);

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(constraints: const BoxConstraints(maxHeight: 300), child: VideoPlayer(_controller)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying ? _controller.pause() : _controller.play();
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ))
            ],
          )
        : const Padding(
            padding: EdgeInsets.all(8.0),
            child: CenteredLoader(),
          );
  }
}
