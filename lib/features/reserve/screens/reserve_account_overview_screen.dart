import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/components/back_to_home_button.dart';
import '../../../core/theme/components.dart';
import 'manage_reserve_accounts_screen.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils.dart';
import '../../../utils/toast.dart';
import '../../../core/base_component.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';

import '../../../core/theme/app_theme.dart';
import '../providers/pending_activation_provider.dart';

import '../providers/reserve_account_provider.dart';
import '../../wallet/models/wallet.dart';

class ReserveAccountOverviewScreen extends BaseScreen {
  const ReserveAccountOverviewScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        "Vault Accounts",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      // leading: BackToHomeButton(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: TextButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: _RaInfo(),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Close",
                          style: TextStyle(color: AppColors.getReserve()),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.help,
              size: 16,
              color: AppColors.getReserve(),
            ),
            label: Text(
              "What are Vault Accounts?",
              style: TextStyle(
                color: AppColors.getReserve(),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(reserveAccountProvider.notifier);
    final wallets = ref.watch(reserveAccountProvider);

    return wallets.isEmpty
        ? _Top()
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: wallets.length,
                  itemBuilder: (context, index) {
                    final wallet = wallets[index];

                    return Column(
                      children: [
                        if (index == 0)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: _Top(),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: MouseRegion(
                            cursor: wallet.isNetworkProtected ? SystemMouseCursors.click : MouseCursor.defer,
                            child: GestureDetector(
                              onTap: wallet.isNetworkProtected
                                  ? () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return ModalContainer(
                                              children: [
                                                ReserveAccountManageCard(wallet),
                                              ],
                                            );
                                          });
                                    }
                                  : null,
                              child: AppCard(
                                padding: 4,
                                child: ListTile(
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        wallet.address,
                                        style: TextStyle(color: AppColors.getReserve()),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            await Clipboard.setData(ClipboardData(text: wallet.address));
                                            Toast.message("Address copied to clipboard");
                                          },
                                          icon: Icon(
                                            Icons.copy,
                                            size: 16,
                                            color: AppColors.getReserve(),
                                          ))
                                    ],
                                  ),
                                  subtitle: Row(mainAxisSize: MainAxisSize.min, children: [
                                    Text("Available: ${wallet.availableBalance} VFX"),
                                    SizedBox(width: 4),
                                    InkWell(
                                      onTap: () {
                                        provider.showBalanceInfo(context, wallet);
                                      },
                                      child: Icon(
                                        Icons.help,
                                        size: 16,
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    )
                                  ]),
                                  trailing: ReserveAccountStatusBadge(wallet: wallet),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              AppButton(
                label: "Restore Vault Account",
                icon: Icons.refresh,
                type: AppButtonType.Text,
                variant: AppColorVariant.Light,
                onPressed: () async {
                  provider.restoreAccount(context);
                },
              ),
            ],
          );
  }
}

class ReserveAccountStatusBadge extends BaseComponent {
  const ReserveAccountStatusBadge({
    super.key,
    required this.wallet,
    this.withRecoverButton = true,
  });

  final Wallet wallet;
  final bool withRecoverButton;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(reserveAccountProvider.notifier);

    if (wallet.isNetworkProtected) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (withRecoverButton) ReserveAccountRecoverButton(wallet: wallet),
          AppBadge(
            label: "Activated",
            variant: AppColorVariant.Success,
          ),
        ],
      );
    }

    if (ref.watch(pendingActivationProvider).contains(wallet.address)) {
      return AppBadge(
        label: "Activation Pending",
        variant: AppColorVariant.Warning,
      );
    }

    if (wallet.balance < 5) {
      return AppButton(
        label: "Awaiting Funds",
        variant: AppColorVariant.Danger,
        onPressed: () async {
          // await InfoDialog.show(
          //   title: "Funds Required",
          //   content: SelectableText("To activate, please send a minimum of 5 VFX to:\n\n${wallet.address}."),
          // );

          provider.fundAccount(context, wallet.address);
        },
      );
    }

    return AppButton(
      label: "Activate Now",
      variant: AppColorVariant.Light,
      onPressed: () {
        provider.activate(context, wallet);
      },
    );
  }
}

class ReserveAccountRecoverButton extends BaseComponent {
  const ReserveAccountRecoverButton({
    super.key,
    required this.wallet,
  });

  final Wallet wallet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(reserveAccountProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButton(
        label: "Recover",
        icon: FontAwesomeIcons.triangleExclamation,
        type: AppButtonType.Outlined,
        variant: AppColorVariant.Warning,
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
            title: "Recover Funds & NFTs",
            body:
                "This is a destructive function that will callback all pending transactions and NFTs and move everything to this recovery account:\n\n${wallet.recoveryAddress}",
            confirmText: "Proceed",
            cancelText: "Cancel",
            destructive: true,
          );

          if (confirmed != true) {
            return;
          }

          final backup = await ConfirmDialog.show(
            title: "Backup Media",
            body:
                "NFT Media will not be transferred in this process. Would you like to export a backup now now so you can import into your new environment?",
            confirmText: "Backup",
            cancelText: "No",
          );

          if (backup == true) {
            await backupMedia(context, ref);
          }

          provider.recoverAccount(context, wallet.address);
        },
      ),
    );
  }
}

class _Top extends BaseComponent {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(reserveAccountProvider.notifier);
    final wallets = ref.watch(reserveAccountProvider);

    return Column(children: [
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Center(
      //     child: _RaInfo(),
      //   ),
      // ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (wallets.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: AppButton(
                label: "Manage Vault Accounts",
                icon: Icons.settings,
                variant: AppColorVariant.Reserve,
                onPressed: () {
                  AutoRouter.of(context).push(const ManageReserveAccountsScreenRoute());
                },
              ),
            ),
          AppButton(
            label: "Setup New Account",
            icon: Icons.add,
            variant: AppColorVariant.Success,
            onPressed: () {
              provider.newAccount(context);
            },
          ),
        ],
      ),
      SizedBox(
        height: 16,
      ),

      SizedBox(
        height: 16,
      ),
      Text(
        "Existing Accounts",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
      ),
      SizedBox(height: 3),
      if (wallets.isEmpty) Text("No Vault Accounts"),
      if (wallets.isEmpty)
        AppButton(
          label: "Restore Vault Account",
          icon: Icons.refresh,
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          onPressed: () async {
            provider.restoreAccount(context);
          },
        ),
    ]);
  }
}

class _RaInfo extends StatelessWidget {
  const _RaInfo();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
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
                  color: AppColors.getReserve(),
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
    );
  }
}
