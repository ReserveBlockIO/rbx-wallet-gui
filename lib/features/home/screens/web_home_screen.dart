import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/dialogs.dart';
import '../../web/components/web_wordmark.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/env.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/web_router.gr.dart';
import '../../../generated/assets.gen.dart';
import '../../root/web_dashboard_container.dart';
import '../../web/components/web_latest_block.dart';
import '../../web/components/web_wallet_details.dart';

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
      title: const Text("Dashboard"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - 60),
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
            const SizedBox(height: 16),
            const WebLatestBlock(),
          ],
        ),
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
            child: WebWordmark(),
          )
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
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              runSpacing: isMobile ? 6 : 16,
              spacing: isMobile ? 6 : 16,
              alignment: WrapAlignment.center,
              children: [
                // AppButton(
                //   label: "Test",
                //   onPressed: () {
                //     runTests();
                //   },
                // ),
                // AppButton(
                //   label: "Other Test",
                //   onPressed: () {
                //     otherTest();
                //   },
                // ),

                AppButton(
                  label: "Send",
                  icon: Icons.outbox,
                  onPressed: () {
                    tabsRouter.setActiveIndex(WebRouteIndex.send);
                  },
                ),
                AppButton(
                  label: "Receive",
                  icon: Icons.move_to_inbox,
                  onPressed: () {
                    tabsRouter.setActiveIndex(WebRouteIndex.recieve);
                  },
                ),
                AppButton(
                  label: "Transactions",
                  icon: Icons.paid,
                  onPressed: () {
                    tabsRouter.setActiveIndex(WebRouteIndex.transactions);
                  },
                ),

                AppButton(
                  label: "RBX Domains",
                  icon: Icons.link,
                  onPressed: () {
                    tabsRouter.setActiveIndex(WebRouteIndex.adnrs);
                  },
                ),

                AppButton(
                  label: "Smart Contracts",
                  icon: Icons.receipt_long,
                  onPressed: () {
                    tabsRouter.setActiveIndex(WebRouteIndex.smartContracts);
                  },
                ),
                AppButton(
                  label: "NFTs",
                  icon: Icons.lightbulb_outline,
                  onPressed: () {
                    tabsRouter.setActiveIndex(WebRouteIndex.nfts);
                  },
                ),
                AppButton(
                  label: "P2P Auctions",
                  icon: Icons.leak_add,
                  onPressed: () {
                    tabsRouter.setActiveIndex(WebRouteIndex.shop);
                  },
                ),
                AppButton(
                  label: "Open Explorer",
                  icon: Icons.explore,
                  onPressed: () {
                    launchUrl(Uri.parse(Env.baseExplorerUrl));
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
                    icon: Icons.logout,
                    onPressed: () async {
                      final confirmed = await ConfirmDialog.show(
                        title: "Logout",
                        body: "Are you sure you want to logout of the RBX Web Wallet?",
                        destructive: true,
                        confirmText: "Logout",
                        cancelText: "Cancel",
                      );
                      if (confirmed == true) {
                        await ref.read(webSessionProvider.notifier).logout();

                        AutoRouter.of(context).replace(const WebAuthRouter());
                      }
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
        ),
      ),
    );
  }
}
