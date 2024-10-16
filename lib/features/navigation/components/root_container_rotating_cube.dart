import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/providers/session_provider.dart';

import '../../../generated/assets.gen.dart';

class RootContainerRotatingCube extends BaseComponent {
  const RootContainerRotatingCube({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionProvider.select((v) => v.btcSelected))
        ? Image.asset(
            Assets.images.animatedCubeBtc.path,
            scale: 1,
            width: 42,
            height: 42,
          )
        : Image.asset(
            Assets.images.animatedCube.path,
            scale: 1,
            width: 42,
            height: 42,
          );
  }
}
