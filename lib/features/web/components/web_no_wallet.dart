import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';

class WebNotWallet extends StatelessWidget {
  const WebNotWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("No Wallet detected."),
          SizedBox(
            height: 8,
          ),
          AppButton(
            label: "Setup Wallet",
            onPressed: () {
              AutoRouter.of(context).replace(WebAuthRouter());
            },
          )
        ],
      ),
    );
  }
}
