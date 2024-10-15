import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/breakpoints.dart';
import '../../../core/theme/components.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/auth_utils.dart';
import '../../web/components/web_activate_ra_button.dart';
import '../../web/components/web_fund_ra_account_button.dart';
import '../../web/components/web_mobile_drawer_button.dart';
import '../../web/components/web_recover_ra_button.dart';
import '../../web/components/web_restore_ra_button.dart';
import '../../web/components/web_wallet_type_switcher.dart';
import '../../web/providers/web_ra_pending_recovery_provider.dart';
import '../../../generated/assets.gen.dart';
import '../../../utils/toast.dart';

import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';

class WebReserveAccountOverviewScreen extends BaseScreen {
  const WebReserveAccountOverviewScreen({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.black,
          includeWebDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final isMobile = BreakPoints.useMobileLayout(context);

    return AppBar(
      title: Text("Your Vault Account"),
      backgroundColor: Colors.black,
      actions: [],
      leading: isMobile ? WebMobileDrawerButton() : null,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).raKeypair;

    final balance = ref.watch(webSessionProvider).raBalance ?? 0.0;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 800),
        child: ListView(
          children: [
            _Top(),
            if (keypair != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Account Details",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: 12),
                  AppCard(
                    padding: 0,
                    child: ListTile(
                      title: Text(keypair.address),
                      subtitle: Text("$balance VFX"),
                      leading: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: keypair.address));
                          Toast.message("Address copied to clipboard");
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () async {
                          final confirmed = await ConfirmDialog.show(
                            title: "Reveal Private Key?",
                            body: "Are you sure you want to reveal your private key for your Vault Account?",
                            confirmText: "Reveal",
                            cancelText: "Cancel",
                          );

                          if (confirmed == true) {
                            showRaKeys(context, keypair);
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        final hasRecovered = ref.watch(webRaPendingRecoveryProvider).contains(keypair.address);

                        if (hasRecovered) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Recovery In Progress",
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SelectableText(
                                "Your Reserve (Protected) Account is being recovered to your recovery address.\nAll non-settled transactions for funds and NFTs will be transferred as well as your current available balance.\nIt is recommended you import your recovery private key into a new machine.",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              AppButton(
                                label: "Reveal Keys",
                                onPressed: () {
                                  showRaKeys(context, keypair);
                                },
                              )
                            ],
                          );
                        }

                        if (ref.watch(webSessionProvider).raActivated) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppBadge(
                                label: "Activated",
                                variant: AppColorVariant.Success,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              WebRecoverRaButton()
                            ],
                          );
                        }

                        final balance = ref.watch(webSessionProvider).raBalance;

                        if (balance == 0) {
                          return Container(
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.02)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Awaiting Funds",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("To activate, you must first transfer 5.0 VFX to this address."),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if ((ref.watch(webSessionProvider).balance ?? 0) > 5 &&
                                          ref.watch(webSessionProvider).keypair != null &&
                                          ref.read(webSessionProvider).raKeypair != null)
                                        WebFundRaAccountButton(),
                                      AppButton(
                                        label: "Copy Address",
                                        icon: Icons.copy,
                                        onPressed: () async {
                                          await Clipboard.setData(ClipboardData(text: keypair.address));
                                          Toast.message("Address copied to clipboard");
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }

                        return WebActivateRaButton();
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  WebRestoreRaButton(),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class _Top extends BaseComponent {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Image.asset(
            Assets.images.animatedCube.path,
            scale: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "Vault Accounts [",
                    ),
                    TextSpan(
                        text: "xRBX",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                    TextSpan(
                      text: "] is a Cold Storage and On-Chain Escrow Feature to keep your VFX Funds and your Digital Assets Safe.\n\n",
                    ),
                    TextSpan(
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      text:
                          "This feature is separate from your VFX instant settlement address and enables both recovery and call-back on-chain escrow features that allows you to be able to recover funds and assets back to your Vault Account in the event of theft, misplacement, or from a recipient that requires trustless escrow within 24 hours of occurrence or within a user pre-set defined time.\n\n",
                    ),
                    TextSpan(
                      text: "These features are all on-chain and all peers are aware of their current state.\n",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Note: Activating this feature requires a 5 VFX deposit, 4 of which will be burned upon activation.",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
