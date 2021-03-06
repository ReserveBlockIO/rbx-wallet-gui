import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/root/web_dashboard_container.dart';
import 'package:rbx_wallet/features/web/components/web_latest_block.dart';
import 'package:rbx_wallet/features/web/components/web_wallet_details.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

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
      title: const Text("ReserveBlock"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(height: 16),
          const WebLatestBlock(),
        ],
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
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
    final isMobile = BreakPoints.useMobileLayout(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: isMobile ? 75 : 150,
            child: Image.asset(
              Assets.images.animatedCube.path,
              scale: 1,
            ),
          ),
          // Center(
          //   child: Image.asset(
          //     Assets.images.rbxWallet.path,
          //     width: 160,
          //     height: 27,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Center(
              child: Text(
            "RBX Web Wallet",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: isMobile ? 20 : 30),
          ))
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
    final tabsRouter = AutoTabsRouter.of(context);

    final isMobile = BreakPoints.useMobileLayout(context);

    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: isMobile ? 6 : 16,
          spacing: isMobile ? 6 : 16,
          alignment: WrapAlignment.center,
          children: [
            AppButton(
              label: "Send",
              onPressed: () {
                tabsRouter.setActiveIndex(WebRouteIndex.send);
              },
            ),
            AppButton(
              label: "Receive",
              onPressed: () {
                tabsRouter.setActiveIndex(WebRouteIndex.recieve);
              },
            ),
            AppButton(
              label: "Transactions",
              onPressed: () {
                tabsRouter.setActiveIndex(WebRouteIndex.transactions);
              },
            ),
            AppButton(
              label: "NFTs",
              onPressed: () {
                tabsRouter.setActiveIndex(WebRouteIndex.nfts);
              },
            ),
            AppButton(
              label: "Smart Contracts",
              onPressed: () {
                tabsRouter.setActiveIndex(WebRouteIndex.smartContracts);
              },
            ),
            AppButton(
              label: "DST Auction",
              onPressed: () {
                tabsRouter.setActiveIndex(WebRouteIndex.dst);
              },
            ),
            AppButton(
              label: "Open Explorer",
              onPressed: () {
                launchUrl(Uri.parse("https://rbx.network/"));
              },
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
            if (ref.read(webSessionProvider).keypair != null)
              AppButton(
                label: "Logout",
                onPressed: () async {
                  await ref.read(webSessionProvider.notifier).logout();

                  AutoRouter.of(context).replace(const WebAuthRouter());
                },
                variant: AppColorVariant.Danger,
              ),
            if (ref.read(webSessionProvider).keypair == null)
              AppButton(
                label: "Setup Wallet",
                onPressed: () async {
                  AutoRouter.of(context).replace(const WebAuthRouter());
                },
              ),
          ],
        ),
      ),
    );
  }
}
