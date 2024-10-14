import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../theme/colors.dart';

class _Animation extends StatelessWidget {
  final double size;
  const _Animation({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    final tween = ColorTween(end: AppColors.getBlue(ColorShade.s100), begin: AppColors.getBlue(ColorShade.s300));

    return SpinKitCubeGrid(
      size: size,
      itemBuilder: (context, index) {
        final t = index >= 4 ? (8 - index) / 4 : index / 4;

        final c = tween.lerp(t);

        return DecoratedBox(decoration: BoxDecoration(color: c));
      },
    );
  }
}

class CenteredLoader extends StatelessWidget {
  final double size;
  final bool isSimple;

  const CenteredLoader({super.key, this.isSimple = false, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    if (isSimple) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    return Center(
      child: _Animation(
        size: size,
      ),
    );
  }
}
