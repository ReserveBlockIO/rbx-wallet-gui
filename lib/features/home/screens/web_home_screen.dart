import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/web/components/web_latest_block.dart';
import 'package:rbx_wallet/features/web/components/web_wallet_details.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';

class WebHomeScreen extends BaseScreen {
  const WebHomeScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("RBX Web Wallet"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              WebWalletDetails(),
              SizedBox(height: 32),
            ],
          ),
        ),
        const _Brand(),
        const _Actions(),
        const WebLatestBlock(),
      ],
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 150,
            child: Image.asset(
              Assets.images.animatedCube.path,
              scale: 1,
            ),
          ),
          Center(
            child: Image.asset(
              Assets.images.rbxWallet.path,
              width: 160,
              height: 27,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _Actions extends BaseComponent {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 16,
          spacing: 16,
          alignment: WrapAlignment.center,
          children: [
            AppButton(
              label: "Send Funds",
              onPressed: () {},
            ),
            AppButton(
              label: "Receive Funds",
              onPressed: () {},
            ),
            AppButton(
              label: "NFTs",
              onPressed: () {},
            ),
            AppButton(
              label: "Smart Contracts",
              onPressed: () {},
            ),
            // AppButton(
            //   label: "DEBUG BUTTON",
            //   onPressed: () async {
            //     await RawTransaction.generate(
            //       keypair: ref.read(webSessionProvider).keypair!,
            //       amount: 1.1,
            //       toAddress: "RKY4KEZrYc1Uj7vcKnmuSkqCkCPwFxPono",
            //     );

            //   },
            // ),
            AppButton(
              label: "Logout",
              onPressed: () {},
              variant: AppColorVariant.Danger,
            ),
          ],
        ),
      ),
    );
  }
}
