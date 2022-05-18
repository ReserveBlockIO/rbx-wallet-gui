import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';

class CompileAnimation extends StatefulWidget {
  const CompileAnimation({Key? key}) : super(key: key);

  @override
  State<CompileAnimation> createState() => _CompileAnimationState();
}

class _CompileAnimationState extends State<CompileAnimation>
    with TickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: true);
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.elasticOut,
  // );

  // late final AnimationController _controller2 = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: false);

  // late final Animation<double> _animation2 = CurvedAnimation(
  //   parent: _controller2,
  //   curve: Curves.elasticOut,
  // );

  @override
  void dispose() {
    // _controller.dispose();
    // _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.black,
                  child: Center(
                    child: Container(
                      color: Colors.black,
                      width: 100,
                      child: GifView.asset(
                        Assets.images.animatedCube.path,
                        frameRate: 120,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Compiling…",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white, letterSpacing: 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompileAnimationComplete extends StatefulWidget {
  const CompileAnimationComplete({Key? key}) : super(key: key);

  @override
  State<CompileAnimationComplete> createState() =>
      _CompileAnimationCompleteState();
}

class _CompileAnimationCompleteState extends State<CompileAnimationComplete>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isAnimating = false;

  late AnimateIconController controller;

  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 1),
    // );

    // Future.delayed(Duration(milliseconds: 100)).then((value) {
    //   _animationController.forward();
    // });

    controller = AnimateIconController();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      controller.animateToEnd();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimateIcons(
                  startIcon: Icons.check_box,
                  endIcon: Icons.check,
                  size: 72,
                  controller: controller,
                  onStartIconPress: () {
                    return false;
                  },
                  onEndIconPress: () {
                    return false;
                  },
                  duration: Duration(milliseconds: 500),
                  startIconColor: Colors.transparent,
                  endIconColor: Theme.of(context).colorScheme.success,
                  clockwise: false,
                ),
                Text(
                  "Compiled!",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white, letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
