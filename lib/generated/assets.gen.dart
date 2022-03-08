/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/dev_env
  String get devEnv => 'assets/env/dev_env';

  /// File path: assets/env/dev_win_env
  String get devWinEnv => 'assets/env/dev_win_env';

  /// File path: assets/env/mac_dev_env
  String get macDevEnv => 'assets/env/mac_dev_env';

  /// File path: assets/env/release_env
  String get releaseEnv => 'assets/env/release_env';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/animated_cube.gif
  AssetGenImage get animatedCube =>
      const AssetGenImage('assets/images/animated_cube.gif');

  /// File path: assets/images/decor_bottom.png
  AssetGenImage get decorBottom =>
      const AssetGenImage('assets/images/decor_bottom.png');

  /// File path: assets/images/decor_bottom_left.png
  AssetGenImage get decorBottomLeft =>
      const AssetGenImage('assets/images/decor_bottom_left.png');

  /// File path: assets/images/decor_bottom_right.png
  AssetGenImage get decorBottomRight =>
      const AssetGenImage('assets/images/decor_bottom_right.png');

  /// File path: assets/images/decor_top_left.png
  AssetGenImage get decorTopLeft =>
      const AssetGenImage('assets/images/decor_top_left.png');

  /// File path: assets/images/globe.png
  AssetGenImage get globe => const AssetGenImage('assets/images/globe.png');

  /// File path: assets/images/grid.jpg
  AssetGenImage get grid => const AssetGenImage('assets/images/grid.jpg');

  /// File path: assets/images/grid_cropped.jpg
  AssetGenImage get gridCropped =>
      const AssetGenImage('assets/images/grid_cropped.jpg');

  /// File path: assets/images/nodelines.png
  AssetGenImage get nodelines =>
      const AssetGenImage('assets/images/nodelines.png');

  /// File path: assets/images/wordmark.png
  AssetGenImage get wordmark =>
      const AssetGenImage('assets/images/wordmark.png');
}

class Assets {
  Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
