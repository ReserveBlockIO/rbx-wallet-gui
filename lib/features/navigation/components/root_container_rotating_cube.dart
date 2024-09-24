import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';

import '../../../generated/assets.gen.dart';

class RootContainerRotatingCube extends BaseComponent {
  const RootContainerRotatingCube({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionProvider).btcSelected
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
