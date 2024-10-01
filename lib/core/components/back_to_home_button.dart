import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AutoTabsRouter.of(context).setActiveIndex(0);
      },
      icon: Icon(
        Icons.navigate_before,
        size: 32,
      ),
    );
  }
}
