import 'dart:io';
import 'dart:convert';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../../reserve/models/new_reserve_account.dart';
import '../../reserve/services/reserve_account_service.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import 'bulk_import_wallet_modal.dart';

import '../../../app.dart';
import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/guards.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../encrypt/utils.dart';
import '../providers/wallet_list_provider.dart';
import 'manage_wallet_bottom_sheet.dart';

class WalletSelector extends BaseComponent {
  final bool truncatedLabel;
  final bool withOptions;
  const WalletSelector({
    Key? key,
    this.truncatedLabel = true,
    this.withOptions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;
    // final List<dynamic> deleted = singleton<Storage>().getList(Storage.DELETED_WALLETS_KEY) ?? [];

    final allWallets = ref.watch(walletListProvider);

    final color = currentWallet != null && currentWallet.isReserved ? Colors.deepPurple.shade200 : Colors.white;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentWallet != null)
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: currentWallet.address),
              );
              Toast.message("${currentWallet.address} copied to clipboard");
            },
            child: Icon(
              Icons.copy,
              size: 12,
              color: color,
            ),
          ),
        PopupMenuButton(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentWallet != null
                        ? truncatedLabel
                            ? currentWallet.label
                            : currentWallet.labelWithoutTruncation
                        : "Wallet",
                    style: TextStyle(color: color),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 18,
                    color: color,
                  ),
                ],
              ),
            ),
          ),
          itemBuilder: (context) {
            final list = <PopupMenuEntry<int>>[];

            if (withOptions) {
              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.publish, size: 16),
                      SizedBox(width: 8),
                      Text("Import Wallet"),
                    ],
                  ),
                  onTap: () async {
                    if (!await passwordRequiredGuard(context, ref)) return;
                    if (!widgetGuardWalletIsNotResyncing(ref)) return;

                    PromptModal.show(
                      title: "Import Wallet",
                      titleTrailing: InkWell(
                        child: const Text(
                          "Bulk Import",
                          style: TextStyle(
                            fontSize: 12,
                            // decoration: TextDecoration.underline,
                            color: Colors.white70,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(rootNavigatorKey.currentContext!).pop();

                          showModalBottomSheet(
                              context: rootNavigatorKey.currentContext!,
                              builder: (context) {
                                return const BulkImportWalletModal();
                              });
                        },
                      ),
                      validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                      labelText: "Private Key",
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                      onValidSubmission: (value) async {
                        final resync = await ConfirmDialog.show(
                          title: "Rescan Blocks?",
                          body: "Would you like to rescan the chain to include any transactions relevant to this key?",
                          confirmText: "Yes",
                          cancelText: "No",
                        );

                        await ref.read(walletListProvider.notifier).import(value, false, resync == true);
                      },
                    );
                  },
                ),
              );
              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add, size: 16),
                      SizedBox(width: 8),
                      Text("New Wallet"),
                    ],
                  ),
                  onTap: () async {
                    if (!await passwordRequiredGuard(context, ref)) return;

                    await ref.read(walletListProvider.notifier).create();
                  },
                ),
              );

              // list.add(
              //   PopupMenuItem(
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: const [
              //         Icon(Icons.security, size: 16),
              //         SizedBox(width: 8),
              //         Text("Reserve Accounts"),
              //       ],
              //     ),
              //     onTap: () async {

              //       // await ref.read(walletListProvider.notifier).create();
              //     },
              //   ),
              // );

              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.wallet, size: 16),
                      SizedBox(width: 8),
                      Text("Manage Wallets"),
                    ],
                  ),
                  onTap: () async {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: rootNavigatorKey.currentContext!,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return const ManageWalletBottomSheet();
                      },
                    );
                  },
                ),
              );
              if (allWallets.isNotEmpty) {
                list.add(const PopupMenuDivider());
              }
            }

            for (final wallet in allWallets) {
              final isSelected = currentWallet != null && wallet.address == currentWallet.address;

              final color = wallet.isReserved ? Colors.deepPurple.shade200 : Theme.of(context).textTheme.bodyText1!.color;

              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isSelected ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                        color: color,
                      ),
                      SizedBox(width: 8),
                      Text(
                        truncatedLabel ? wallet.label : wallet.labelWithoutTruncation,
                        style: TextStyle(
                          color: color,
                          decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
                  },
                ),
              );
            }

            return list;
          },
        ),
      ],
    );
  }
}

class ReserveAccountDetails extends StatelessWidget {
  final NewReserveAccount account;

  const ReserveAccountDetails({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Reserve Account Created",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: SizedBox(
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "🚨 Make sure to backup your RESTORE CODE somewhere safe. 🚨",
                style: TextStyle(
                  color: Colors.red.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: TextFormField(
                decoration: InputDecoration(
                  label: Text("Restore Code"),
                ),
                minLines: 3,
                maxLines: 6,
                readOnly: true,
                initialValue: account.restoreCode,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Center(
              child: AppButton(
                icon: Icons.copy,
                label: "Copy Restore Code",
                variant: AppColorVariant.Success,
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: account.restoreCode));
                  Toast.message("Restore Code copied to clipboard");
                },
              ),
            ),
            SizedBox(height: 6),
            Text(
              "You will need the Restore Code and Password to Recover any transaction. It is highly advised to copy all and store safely as you would for any private key.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 6),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: TextFormField(
                initialValue: account.address,
                decoration: const InputDecoration(label: Text("Address")),
                readOnly: true,
                style: const TextStyle(fontSize: 13),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.copy,
                ),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: account.address));
                  Toast.message("Address copied to clipboard");
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: TextFormField(
                initialValue: account.privateKey,
                decoration: const InputDecoration(
                  label: Text("Private Key"),
                ),
                style: const TextStyle(fontSize: 13),
                readOnly: true,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.copy,
                ),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: account.privateKey));
                  Toast.message("Private Key copied to clipboard");
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: TextFormField(
                initialValue: account.recoveryAddress,
                decoration: const InputDecoration(label: Text("Recovery Address")),
                readOnly: true,
                style: const TextStyle(fontSize: 13),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.copy,
                ),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: account.recoveryAddress));
                  Toast.message("Recovery Address copied to clipboard");
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: TextFormField(
                initialValue: account.recoveryPrivateKey,
                decoration: const InputDecoration(
                  label: Text("Recovery Private Key"),
                ),
                style: const TextStyle(fontSize: 13),
                readOnly: true,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.copy,
                ),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: account.recoveryPrivateKey));
                  Toast.message("Recovery Private Key copied to clipboard");
                },
              ),
            ),
            const Divider(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                    label: "Copy All",
                    icon: Icons.copy,
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: account.backupContents));
                      Toast.message("Reserve Account Data copied to clipboard");
                    }),
                AppButton(
                    label: "Save as File",
                    icon: Icons.save,
                    onPressed: () async {
                      List<int> bytes = utf8.encode(account.backupContents);

                      final date = DateTime.now();
                      final d = "${date.year}-${date.month}-${date.day}";

                      if (Platform.isMacOS) {
                        await FileSaver.instance.saveAs("xRBX Reserve Account Backup-$d", Uint8List.fromList(bytes), 'txt', MimeType.TEXT);
                        Toast.message("Reserve Account Data saved");
                      } else {
                        final data = await FileSaver.instance
                            .saveFile("xRBX Reserve Account Backup-$d", Uint8List.fromList(bytes), 'txt', mimeType: MimeType.TEXT);
                        Toast.message("Reserve Account Data saved to $data");
                      }
                    }),
                AppButton(
                  label: "Close",
                  icon: Icons.check,
                  onPressed: () async {
                    final shouldClose = await ConfirmDialog.show(
                      title: "Backed up?",
                      body: "Please confirm you have backed up your RESTORE CODE as well as your PASSWORD.",
                      confirmText: "I'm Backed Up",
                      cancelText: "Cancel",
                    );

                    if (shouldClose == true) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
