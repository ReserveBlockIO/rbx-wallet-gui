import 'package:flutter/material.dart';

import '../../../app.dart';

class WebMobileDrawerButton extends StatelessWidget {
  const WebMobileDrawerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        rootScaffoldKey.currentState!.openDrawer();
      },
    );
  }
}
