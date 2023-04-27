import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/reserve/providers/reserve_account_provider.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/singletons.dart';
import '../../../core/storage.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../encrypt/utils.dart';
import '../providers/wallet_detail_provider.dart';
import '../providers/wallet_list_provider.dart';

class ManageWalletBottomSheet extends BaseComponent {
  const ManageWalletBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletListProvider);
    // final List<Wallet> wallets = [];

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: wallets.isEmpty
              ? _Header()
              : ListView.builder(
                  itemCount: wallets.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final wallet = wallets[index];
                    final isLast = index >= wallets.length - 1;
                    final isFirst = index == 0;

                    final color = wallet.isReserved ? Colors.deepPurple.shade300 : Colors.white;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isFirst) Center(child: _Header()),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: isLast ? 0 : 1,
                                color: isLast ? Colors.transparent : Colors.white24,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: ListTile(
                              // leading: Icon(Icons.account_balance_wallet_outlined, color: color),
                              leading: wallet.address == ref.watch(sessionProvider).currentWallet?.address
                                  ? IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.check_box_rounded, color: color),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
                                      },
                                      icon: Icon(Icons.check_box_outline_blank_outlined, color: color),
                                    ),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    wallet.label,
                                    style: TextStyle(color: color),
                                  ),
                                  wallet.isReserved
                                      ? Text(
                                          " [Available: ${wallet.availableBalance} RBX]",
                                          style: TextStyle(color: color),
                                        )
                                      : Text(
                                          " [${wallet.balance} RBX]",
                                          style: TextStyle(color: color),
                                        ),
                                  if (wallet.isReserved || wallet.lockedBalance > 0)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: InkWell(
                                        onTap: () {
                                          ref.read(reserveAccountProvider.notifier).showBalanceInfo(wallet);
                                        },
                                        child: Icon(
                                          Icons.help,
                                          size: 14,
                                          color: Theme.of(context).colorScheme.secondary,
                                        ),
                                      ),
                                    ),
                                  IconButton(
                                    onPressed: () {
                                      PromptModal.show(
                                        title: "Rename ${wallet.label}",
                                        validator: (_) => null,
                                        labelText: "Name",
                                        initialValue: wallet.friendlyName ?? "",
                                        onValidSubmission: (value) {
                                          ref.read(walletDetailProvider(wallet).notifier).rename(value);
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 12,
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(wallet.address),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: InkWell(
                                      child: const Icon(
                                        Icons.copy,
                                        size: 12,
                                      ),
                                      onTap: () async {
                                        await Clipboard.setData(
                                          ClipboardData(text: wallet.address),
                                        );
                                        Toast.message("Address copied to clipboard");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (wallet.isReserved && wallet.isNetworkProtected)
                                    Text(
                                      "Activated",
                                      style: TextStyle(color: color),
                                    ),
                                  // if (wallet.isReserved && !wallet.isNetworkProtected)
                                  //   AppButton(
                                  //     label: "Publish",
                                  //     type: AppButtonType.Text,
                                  //     variant: AppColorVariant.Info,
                                  //     onPressed: () async {
                                  //       await ref.read(reserveAccountProvider.notifier).activate(wallet);
                                  //     },
                                  //   ),
                                  if (!wallet.isReserved)
                                    AppButton(
                                        type: AppButtonType.Text,
                                        label: "Reveal Private Key",
                                        variant: AppColorVariant.Info,
                                        onPressed: () async {
                                          if (!await passwordRequiredGuard(context, ref)) return;

                                          final decryptedWallet = ref.read(walletListProvider).firstWhereOrNull((w) => w.address == wallet.address);
                                          if (decryptedWallet == null) {
                                            return;
                                          }
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text("Private Key"),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ListTile(
                                                      leading: const Icon(Icons.security),
                                                      title: SizedBox(
                                                        width: 500,
                                                        child: TextFormField(
                                                          initialValue: decryptedWallet.privateKey,
                                                          decoration: const InputDecoration(
                                                            label: Text("Private Key"),
                                                          ),
                                                          style: const TextStyle(fontSize: 12),
                                                          readOnly: true,
                                                        ),
                                                      ),
                                                      trailing: IconButton(
                                                        icon: const Icon(Icons.copy),
                                                        onPressed: () async {
                                                          await Clipboard.setData(ClipboardData(text: decryptedWallet.privateKey));
                                                          Toast.message("Private Key copied to clipboard");
                                                        },
                                                      ),
                                                    ),
                                                    const Divider(),
                                                    AppButton(
                                                      label: "Close",
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                  AppButton(
                                    label: "Rescan",
                                    type: AppButtonType.Text,
                                    variant: AppColorVariant.Light,
                                    onPressed: () async {
                                      final resync = await ConfirmDialog.show(
                                        title: "Rescan Blocks?",
                                        body: "Would you like to rescan the chain to include any transactions relevant to this address?",
                                        confirmText: "Yes",
                                        cancelText: "No",
                                      );
                                      if (resync == true) {
                                        final success = await BridgeService().rescanAddress(wallet.address);
                                        if (success) {
                                          InfoDialog.show(title: "Rescan has started", body: "Updated TXs will show up shortly");
                                        } else {
                                          OverlayToast.error();
                                        }
                                      }
                                    },
                                  ),
                                  AppButton(
                                    type: AppButtonType.Text,
                                    variant: AppColorVariant.Danger,
                                    label: "Hide Account",
                                    onPressed: () async {
                                      final confirmed = await ConfirmDialog.show(
                                        title: "Hide wallet?",
                                        body: "Are you sure you want to hide this wallet from the GUI?",
                                        destructive: true,
                                        confirmText: "Hide",
                                        cancelText: "Cancel",
                                      );

                                      if (confirmed == true) {
                                        ref.read(walletDetailProvider(wallet).notifier).delete();
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class _Header extends BaseComponent {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButton(
            label: "Restore Hidden Accounts",
            type: AppButtonType.Text,
            variant: AppColorVariant.Info,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return WalletRestorer();
                  }));
            },
          ),
          AppButton(
            label: "Close",
            type: AppButtonType.Text,
            variant: AppColorVariant.Info,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class WalletRestorer extends StatefulWidget {
  WalletRestorer({
    super.key,
  });

  @override
  State<WalletRestorer> createState() => _WalletRestorerState();
}

class _WalletRestorerState extends State<WalletRestorer> {
  late List hiddenWallets;
  late List<bool> values;

  @override
  initState() {
    super.initState();
    hiddenWallets = singleton<Storage>().getList(Storage.DELETED_WALLETS_KEY) ?? [];
    values = hiddenWallets.map((e) => false).toList();
  }

  @override
  Widget build(BuildContext context) {
    return hiddenWallets.isEmpty
        ? InfoDialog.alert(context, title: 'No wallets to restore', body: "You don't have any hidden wallets.")
        : Consumer(builder: (context, ref, child) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.spaceBetween,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Wallet(s) to restore",
                    style: const TextStyle(color: Colors.white),
                  ),
                  AppButton(
                    label: 'Restore all',
                    onPressed: () {
                      restoreWallets([], context, ref);
                    },
                  )
                ],
              ),
              content: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600, maxHeight: 800),
                child: SizedBox(
                  height: 30.0 * values.length,
                  width: 600,
                  child: ListView.builder(
                      itemCount: values.length,
                      itemBuilder: ((context, index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                                value: values[index],
                                onChanged: (val) {
                                  setState(() {
                                    values[index] = val ?? false;
                                  });
                                }),
                            Text(hiddenWallets[index])
                          ],
                        );
                      })),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.light,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final nonRestoredWallets = hiddenWallets
                        .whereIndexed(
                          (index, element) => !values[index],
                        )
                        .toList();

                    restoreWallets(nonRestoredWallets, context, ref);
                  },
                  child: Text(
                    "Restore Selected",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            );
          });
  }

  void restoreWallets(List<dynamic> nonRestoredWallets, BuildContext context, WidgetRef ref) {
    singleton<Storage>().setList(Storage.DELETED_WALLETS_KEY, nonRestoredWallets);
    ref.read(sessionProvider.notifier).init(false);
    Navigator.of(context).pop();
  }
}
