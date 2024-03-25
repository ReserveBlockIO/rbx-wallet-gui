import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      title: Text("Reserve Accounts"),
      backgroundColor: Colors.black,
      actions: [
        // TextButton(
        //   onPressed: () {
        //     AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
        //   },
        //   child: Text(
        //     "Create Collection",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(reserveAccountProvider.notifier);
    final wallets = ref.watch(reserveAccountProvider);

    return wallets.isEmpty
        ? _Top()
        : ListView.builder(
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
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: glowingBox,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: ListTile(
                          title: SelectableText(wallet.address),
                          subtitle: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text("Available: ${wallet.availableBalance} RBX"),
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
                          trailing: Builder(builder: (context) {
                            if (wallet.isNetworkProtected) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppButton(
                                    label: "Recover",
                                    icon: Icons.warning,
                                    type: AppButtonType.Text,
                                    variant: AppColorVariant.Warning,
                                    onPressed: () async {
                                      final confirmed = await ConfirmDialog.show(
                                        title: "Recover Funds & NFTs",
                                        body:
                                            "This is a destructive function that will callback all pending transactions and NFTs and move everything to this recovery address:\n\n${wallet.recoveryAddress}",
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
                                onPressed: () {
                                  InfoDialog.show(
                                    title: "Funds Required",
                                    content: SelectableText("To activate, please send a minimum of 5 RBX to:\n\n${wallet.address}."),
                                  );
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
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
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
      Text(
        "Reserve Accounts",
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
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
      SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            label: "Setup Account",
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            label: "Restore Reserve Account",
            icon: Icons.refresh,
            type: AppButtonType.Text,
            variant: AppColorVariant.Light,
            onPressed: () async {
              provider.restoreAccount(context);
            },
          ),
        ],
      ),
      SizedBox(
        height: 8,
      ),
      Divider(),
      Text(
        "Existing Accounts",
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
      ),
      SizedBox(height: 3),
      if (wallets.isEmpty) Text("No Reserve Accounts")
    ]);
  }
}
