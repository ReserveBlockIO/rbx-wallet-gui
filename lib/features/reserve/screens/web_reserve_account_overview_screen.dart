import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/auth/auth_utils.dart';
import 'package:rbx_wallet/features/keygen/models/ra_keypair.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/web/components/web_activate_ra_button.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';

import '../providers/reserve_account_provider.dart';

class WebReserveAccountOverviewScreen extends BaseScreen {
  const WebReserveAccountOverviewScreen({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.black,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Your Reserve Account"),
      backgroundColor: Colors.black,
      actions: [],
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
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: glowingBox,
                    ),
                    child: Card(
                      color: Colors.black,
                      child: ListTile(
                        title: Text(keypair.address),
                        subtitle: Text("$balance RBX"),
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
                              body: "Are you sure you want to reveal your private key for your Reserve Account?",
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(
                      builder: (context) {
                        if (ref.watch(webSessionProvider).raActivated) {
                          return AppBadge(
                            label: "Activated",
                            variant: AppColorVariant.Success,
                          );
                        }

                        final balance = ref.watch(webSessionProvider).raBalance;

                        if (balance == 0) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("To activate, you must first transfer 5.0 RBX to this address."),
                              SizedBox(
                                height: 8,
                              ),
                              AppButton(
                                label: "Copy Address",
                                icon: Icons.copy,
                                onPressed: () async {
                                  await Clipboard.setData(ClipboardData(text: keypair.address));
                                  Toast.message("Address copied to clipboard");
                                },
                              )
                            ],
                          );
                        }

                        return WebActivateRaButton();
                      },
                    ),
                  )
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
                      text: "Reserve (Protected) Accounts [",
                    ),
                    TextSpan(
                        text: "xRBX",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                    TextSpan(
                      text: "] is a Cold Storage and On-Chain Escrow Feature to keep your RBX Funds and your Digital Assets Safe.\n\n",
                    ),
                    TextSpan(
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      text:
                          "This feature is separate from your RBX instant settlement address and enables both recovery and call-back on-chain escrow features that allows you to be able to recover funds and assets back to your Reserve Account in the event of theft, misplacement, or from a recipient that requires trustless escrow within 24 hours of occurrence or within a user pre-set defined time.\n\n",
                    ),
                    TextSpan(
                      text: "These features are all on-chain and all peers are aware of their current state.\n",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Note: Activating this feature requires a 5 RBX deposit, 4 of which will be burned upon activation.",
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
