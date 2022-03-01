/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsCliGen {
  const $AssetsCliGen();

  /// File path: assets/cli/LiteDB.dll
  String get liteDB => 'assets/cli/LiteDB.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.Connections.Abstractions.dll
  String get microsoftAspNetCoreConnectionsAbstractions =>
      'assets/cli/Microsoft.AspNetCore.Connections.Abstractions.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.Http.Connections.Client.dll
  String get microsoftAspNetCoreHttpConnectionsClient =>
      'assets/cli/Microsoft.AspNetCore.Http.Connections.Client.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.Http.Connections.Common.dll
  String get microsoftAspNetCoreHttpConnectionsCommon =>
      'assets/cli/Microsoft.AspNetCore.Http.Connections.Common.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.Server.Kestrel.Https.dll
  String get microsoftAspNetCoreServerKestrelHttps =>
      'assets/cli/Microsoft.AspNetCore.Server.Kestrel.Https.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.Server.Kestrel.Transport.Abstractions.dll
  String get microsoftAspNetCoreServerKestrelTransportAbstractions =>
      'assets/cli/Microsoft.AspNetCore.Server.Kestrel.Transport.Abstractions.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.SignalR.Client.Core.dll
  String get microsoftAspNetCoreSignalRClientCore =>
      'assets/cli/Microsoft.AspNetCore.SignalR.Client.Core.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.SignalR.Client.dll
  String get microsoftAspNetCoreSignalRClient =>
      'assets/cli/Microsoft.AspNetCore.SignalR.Client.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.SignalR.Common.dll
  String get microsoftAspNetCoreSignalRCommon =>
      'assets/cli/Microsoft.AspNetCore.SignalR.Common.dll';

  /// File path: assets/cli/Microsoft.AspNetCore.SignalR.Protocols.Json.dll
  String get microsoftAspNetCoreSignalRProtocolsJson =>
      'assets/cli/Microsoft.AspNetCore.SignalR.Protocols.Json.dll';

  /// File path: assets/cli/Microsoft.Extensions.Features.dll
  String get microsoftExtensionsFeatures =>
      'assets/cli/Microsoft.Extensions.Features.dll';

  /// File path: assets/cli/Newtonsoft.Json.dll
  String get newtonsoftJson => 'assets/cli/Newtonsoft.Json.dll';

  /// File path: assets/cli/ReserveBlockCore
  String get reserveBlockCore => 'assets/cli/ReserveBlockCore';

  /// File path: assets/cli/ReserveBlockCore.dll
  String get reserveBlockCoreDll => 'assets/cli/ReserveBlockCore.dll';

  /// File path: assets/cli/ReserveBlockCore.pdb
  String get reserveBlockCorePdb => 'assets/cli/ReserveBlockCore.pdb';

  /// File path: assets/cli/ReserveBlockCore.deps.json
  String get reserveBlockCoreDeps => 'assets/cli/ReserveBlockCore.deps.json';

  /// File path: assets/cli/ReserveBlockCore.runtimeconfig.json
  String get reserveBlockCoreRuntimeconfig =>
      'assets/cli/ReserveBlockCore.runtimeconfig.json';

  /// File path: assets/cli/Spectre.Console.dll
  String get spectreConsole => 'assets/cli/Spectre.Console.dll';

  /// File path: assets/cli/System.IO.Pipelines.dll
  String get systemIOPipelines => 'assets/cli/System.IO.Pipelines.dll';

  /// File path: assets/cli/appsettings.json
  String get appsettings => 'assets/cli/appsettings.json';

  /// File path: assets/cli/web.config
  String get web => 'assets/cli/web.config';
}

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/dev_env
  String get devEnv => 'assets/env/dev_env';
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

  static const $AssetsCliGen cli = $AssetsCliGen();
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
