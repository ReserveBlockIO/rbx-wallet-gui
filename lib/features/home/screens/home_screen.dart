import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/home/components/log_window.dart';
import 'package:rbx_wallet/features/home/components/footer.dart';
import 'package:rbx_wallet/features/home/components/transaction_window.dart';
import 'package:rbx_wallet/features/root/components/reload_button.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
          // includeMainDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Dashboard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      leading: ReloadButton(),
      actions: [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // AppButton(
            //   label: "kill",
            //   onPressed: () {
            //     BridgeService().killCli();
            //   },
            // ),
            Text(
              "General Tools",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Print Addresses",
                  onPressed: () {},
                  size: AppSizeVariant.Lg,
                ),
                AppButton(
                  label: "Show Validators",
                  onPressed: () {},
                  size: AppSizeVariant.Lg,
                ),
                AppButton(
                  label: "Get Blockchain",
                  onPressed: () {},
                  size: AppSizeVariant.Lg,
                ),
              ],
            ),
            Divider(),
            LogWindow(),
            Divider(),
            TransactionWindow(),
          ],
        ),
      ),
    );
  }
}
