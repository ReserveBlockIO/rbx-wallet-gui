import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../generated/assets.gen.dart';

class CompileAnimation extends StatefulWidget {
  final bool mint;
  final bool btc;
  const CompileAnimation(this.mint, {Key? key, this.btc = false}) : super(key: key);

  @override
  State<CompileAnimation> createState() => _CompileAnimationState();
}

class _CompileAnimationState extends State<CompileAnimation> with TickerProviderStateMixin {
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
                      height: 100,
                      child: Image.asset(
                        widget.btc ? Assets.images.vbtcGif.path : Assets.images.animatedCube.path,
                        scale: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.mint ? "Minting…" : "Compiling & Minting…",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, letterSpacing: 1),
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
  final bool mint;
  final bool btc;
  const CompileAnimationComplete(
    this.mint, {
    Key? key,
    this.btc = false,
  }) : super(key: key);

  @override
  State<CompileAnimationComplete> createState() => _CompileAnimationCompleteState();
}

class _CompileAnimationCompleteState extends State<CompileAnimationComplete> with TickerProviderStateMixin {
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
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      controller.animateToEnd();
    });
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
                  duration: const Duration(milliseconds: 500),
                  startIconColor: Colors.transparent,
                  endIconColor: widget.btc ? Theme.of(context).colorScheme.btcOrange : Theme.of(context).colorScheme.success,
                  clockwise: false,
                ),
                Text(
                  widget.mint ? "Minted!" : "Compiled!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
