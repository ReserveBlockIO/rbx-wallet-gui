import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/env.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import 'payment_disclaimer.dart';
import 'package:rbx_wallet/features/payment/components/payment_iframe_container.dart'
    if (dart.library.io) 'package:rbx_wallet/features/payment/components/payment_iframe_container_mock.dart';

class WebBuyRBXButton extends BaseComponent {
  const WebBuyRBXButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.read(webSessionProvider).keypair?.address;

    if (address == null) {
      return SizedBox.shrink();
    }

    return AppButton(
      label: "Get \$VFX/\$BTC Now",
      variant: AppColorVariant.Success,
      onPressed: () async {
        if (Env.isTestNet) {
          launchUrlString("https://testnet.rbx.network/faucet");
          return;
        }

        final maxWidth = BreakPoints.useMobileLayout(context) ? 400.0 : 750.0;
        final maxHeight = BreakPoints.useMobileLayout(context) ? 500.0 : 700.0;
        double width = MediaQuery.of(context).size.width - 32;
        double height = MediaQuery.of(context).size.height - 64;

        if (width > maxWidth) {
          width = maxWidth;
        }

        if (height > maxHeight) {
          height = maxHeight;
        }

        final agreed = await PaymentTermsDialog.show(context);

        if (agreed != true) {
          return;
        }

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WebPaymentIFrameContainer(
                    walletAddress: address,
                    coinAmount: 5000,
                    width: width,
                    height: height,
                  ),
                  SizedBox(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PaymentDisclaimer(),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
