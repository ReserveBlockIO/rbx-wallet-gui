import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/breakpoints.dart';
import '../../../core/theme/pretty_icons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/components.dart';
import '../../web/components/web_mobile_drawer_button.dart';
import '../../web/components/web_wallet_type_switcher.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/html_helpers.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../nft/components/nft_qr_code.dart';
import '../../web/components/web_no_wallet.dart';

class WebReceiveScreen extends BaseScreen {
  const WebReceiveScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final isMobile = BreakPoints.useMobileLayout(context);

    final isBtc = ref.watch(webSessionProvider.select((v) => v.usingBtc));
    return AppBar(
      title: isBtc ? Text("Receive BTC") : Text("Receive VFX"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      leading: isMobile ? WebMobileDrawerButton() : null,
    );
  }

  Future<void> copyToClipboard(String value, [String? message]) async {
    await Clipboard.setData(ClipboardData(text: value));
    Toast.message(message ?? "'$value' Copied to clipboard");
  }

  String generateLink(String address, double amount) {
    return HtmlHelpers().getUrl().replaceAll("/receive", "/send/$address/$amount");
  }

  Future<void> showRequestPrompt({
    required BuildContext context,
    required String address,
    required Function(String str) onValidSubmission,
  }) async {
    PromptModal.show(
      contextOverride: context,
      tightPadding: true,
      title: "Request Funds",
      body: "Generate a URL to send to another user.",
      labelText: "Amount to request",
      validator: (value) => formValidatorNumber(value, "Amount"),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      confirmText: "Generate Link",
      onValidSubmission: onValidSubmission,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final address = ref.watch(webSessionProvider.select((v) => v.currentWallet?.address));
    final usingRa = ref.watch(webSessionProvider.select((v) => v.usingRa));
    final adnr = ref.watch(webSessionProvider.select((v) => v.adnr));

    if (address == null) {
      return const WebNotWallet();
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AppCard(
                padding: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppCard(
                      padding: 0,
                      color: AppColors.getGray(ColorShade.s300),
                      child: ListTile(
                        title: SelectableText(
                          address,
                          style: TextStyle(color: usingRa ? Colors.deepPurple.shade200 : Colors.white),
                        ),
                        subtitle: Text("Your Address"),
                        leading: Icon(Icons.wallet),
                        trailing: IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            copyToClipboard(address);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (adnr != null && adnr.isNotEmpty && !usingRa) ...[
                      AppCard(
                        padding: 0,
                        color: AppColors.getGray(ColorShade.s300),
                        child: ListTile(
                          title: SelectableText(
                            adnr,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text("Your Domain"),
                          leading: Icon(Icons.link),
                          trailing: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              copyToClipboard(adnr);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppVerticalIconButton(
                          label: "Copy\nLink",
                          icon: Icons.link,
                          prettyIconType: PrettyIconType.custom,
                          onPressed: () async {
                            showRequestPrompt(
                                context: context,
                                address: address,
                                onValidSubmission: (amount) async {
                                  if (double.tryParse(amount) != null) {
                                    final value = adnr != null && adnr.isNotEmpty && !usingRa ? adnr : address;
                                    final url = generateLink(value, double.parse(amount));

                                    await copyToClipboard(url, "Request funds link copied to clipboard");
                                  } else {
                                    Toast.error("Invalid amount");
                                  }
                                });
                          },
                        ),
                        const SizedBox(width: 6),
                        AppVerticalIconButton(
                          label: "QR\nCode",
                          icon: Icons.qr_code_rounded,
                          prettyIconType: PrettyIconType.custom,
                          onPressed: () async {
                            showRequestPrompt(
                                context: context,
                                address: address,
                                onValidSubmission: (amount) async {
                                  if (double.tryParse(amount) != null) {
                                    final value = adnr != null && adnr.isNotEmpty & !usingRa ? adnr : address;
                                    final url = generateLink(value, double.parse(amount));

                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: NftQrCode(
                                              data: url,
                                              withClose: true,
                                            ),
                                          );
                                        });
                                  } else {
                                    Toast.error("Invalid amount");
                                  }
                                });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
