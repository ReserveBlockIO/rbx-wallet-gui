import '../../../generated/assets.gen.dart';
import 'package:flutter/material.dart';

class WebWordmark extends StatelessWidget {
  const WebWordmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.images.wordmarkWeb.path, width: 200, height: 25);
  }
}
