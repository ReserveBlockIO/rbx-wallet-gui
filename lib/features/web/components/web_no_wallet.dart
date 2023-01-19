import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/web_router.gr.dart';

class WebNotWallet extends StatelessWidget {
  const WebNotWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("No Wallet detected."),
          const SizedBox(
            height: 8,
          ),
          AppButton(
            label: "Setup Wallet",
            onPressed: () {
              AutoRouter.of(context).replace(const WebAuthRouter());
            },
          )
        ],
      ),
    );
  }
}
