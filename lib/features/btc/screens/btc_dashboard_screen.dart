import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/btc_wallet_selector.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/open_db_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/open_log_button.dart';
import 'package:rbx_wallet/features/home/components/home_buttons/restart_cli_button.dart';
import 'package:rbx_wallet/features/home/components/log_window.dart';
import 'package:rbx_wallet/features/home/components/transaction_window.dart';
import 'package:rbx_wallet/features/payment/payment_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/components/home_buttons/print_addresses_button.dart';
import '../../home/components/home_buttons/show_debug_data_button.dart';

class BtcDashboardScreen extends BaseScreen {
  const BtcDashboardScreen({super.key})
      : super(
          backgroundColor: const Color(0xff4d4d4d),
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final rbxAddress = ref.watch(sessionProvider).currentWallet?.address;

    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FontAwesomeIcons.bitcoin,
          ),
          SizedBox(
            width: 6,
          ),
          const Text("Bitcoin Dashboard"),
        ],
      ),
      // backgroundColor: Theme.of(context).colorScheme.btcOrange,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leadingWidth: rbxAddress == null || !ALLOW_PAYMENT ? null : 140,

      centerTitle: true,
      actions: [
        BtcWalletSelector(),
      ],
      leading: rbxAddress == null || !ALLOW_PAYMENT
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: AppButton(
                onPressed: () async {
                  final agreed = await PaymentTermsDialog.show(context);

                  if (agreed != true) {
                    return;
                  }

                  final url = paymentUrl(amount: 5000, walletAddress: rbxAddress);
                  if (url != null) {
                    launchUrl(Uri.parse(url));
                  }
                },
                label: "Get \$RBX Now",
                variant: AppColorVariant.Success,
              ),
            ),
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
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                const RestartCliButton(forBtc: true),
                const PrintAdressesButton(forBtc: true),
                const ShowDebugDataButton(forBtc: true),
                const OpenDbFolderButton(forBtc: true),
                const OpenLogButton(forBtc: true),
                AppButton(
                  variant: AppColorVariant.Btc,
                  onPressed: () {},
                  icon: FontAwesomeIcons.btc,
                  label: "Tokenize Reserve Bitcoin",
                )
              ],
            ),
            const Divider(),
            const LogWindow(forBtc: true),
            const Divider(),
            // Align(
            //   child: Padding(
            //     padding: const EdgeInsets.all(12.0),
            //     child: _CreateBtcScButton(),
            //   ),
            // ),
            const TransactionWindow(forBtc: true),
          ],
        ),
      ),
    );
  }
}

class _CreateBtcScButton extends StatelessWidget {
  const _CreateBtcScButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.btcOrange,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 4.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create Reserved Bitcoin\nSmart Contract",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
