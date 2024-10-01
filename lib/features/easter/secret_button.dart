import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecretButton extends StatefulWidget {
  final Function onPressed;
  final String label;
  const SecretButton({
    Key? key,
    required this.onPressed,
    this.label = "π",
  }) : super(key: key);

  @override
  State<SecretButton> createState() => _SecretButtonState();
}

class _SecretButtonState extends State<SecretButton> {
  double opacity = 0;

  @override
  void initState() {
    RawKeyboard.instance.addListener((value) {
      if (!mounted) return;

      if (RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.altLeft) ||
          RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.altRight)) {
        setState(() {
          opacity = 1.0;
        });
      } else {
        setState(() {
          opacity = 0;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener((value) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: opacity != 1.0,
      child: InkWell(
        onTap: () {
          widget.onPressed();
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 300),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
