import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';

class RemoteShopContainerScreen extends BaseScreen {
  const RemoteShopContainerScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Padding(padding: EdgeInsets.all(0), child: AutoRouter());
  }
}
