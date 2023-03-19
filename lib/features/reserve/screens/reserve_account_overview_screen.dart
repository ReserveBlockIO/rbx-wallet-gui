import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';

import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/reserve/providers/pending_activation_provider.dart';

import 'package:rbx_wallet/features/reserve/providers/reserve_account_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

class ReserveAccountOverviewScreen extends BaseScreen {
  const ReserveAccountOverviewScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Reserve Accounts"),
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
                  if (index == 0) _Top(),
                  Card(
                    child: ListTile(
                      title: SelectableText(wallet.address),
                      subtitle: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text("Available: ${wallet.availableBalance} RBX"),
                        SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            provider.showBalanceInfo(wallet);
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
                          return AppBadge(
                            label: "Activated",
                            variant: AppColorVariant.Success,
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
                          label: "Activate",
                          onPressed: () {
                            provider.activate(wallet);
                          },
                        );
                      }),
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
                ),
                children: [
                  TextSpan(
                    text: "Reserve Accounts [",
                  ),
                  TextSpan(
                      text: "xRBX",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  TextSpan(
                    text: "] is a personal safe deposit storage feature that is on-chain to help keep your RBX funds and / or NFT assets safe.\n\n",
                  ),
                  TextSpan(
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    text:
                        "This feature is separate from your RBX instant settlement address and enables both recovery and call-back on-chain escrow features that allows you to be able to revert funds and assets back to your Reserve Account in the event of theft, misplacement, or from a recipient that requires trustless escrow within 24 hours of occurrence or within a user pre-set defined time.\n\n",
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
          SizedBox(width: 8),
          AppButton(
            label: "Restore Account",
            icon: Icons.upload,
            type: AppButtonType.Text,
            variant: AppColorVariant.Light,
            onPressed: () async {
              provider.recoverAccount(context);
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
