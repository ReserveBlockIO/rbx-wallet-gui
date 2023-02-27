import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

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

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: wallets.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final wallet = wallets[index];
              final isLast = index >= wallets.length - 1;
              final isFirst = index == 0;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isFirst)
                    Center(
                      child: Padding(
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
                                singleton<Storage>().setList(Storage.DELETED_WALLETS_KEY, []);
                                ref.read(sessionProvider.notifier).init(false);
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
                      ),
                    ),
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
                        leading: const Icon(Icons.account_balance_wallet_outlined),
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(wallet.label),
                            Text(" [${wallet.balance} RBX]"),
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

                                if (confirmed) {
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
