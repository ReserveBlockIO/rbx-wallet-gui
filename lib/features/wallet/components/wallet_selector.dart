import 'dart:io';
import 'dart:convert';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../btc/models/btc_address_type.dart';
import '../../btc/providers/btc_account_list_provider.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../reserve/models/new_reserve_account.dart';
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
  final bool headerHasCopy;
  final bool includeRbx;
  final bool includeBtc;
  final bool includeRa;
  const WalletSelector({
    Key? key,
    this.truncatedLabel = true,
    this.withOptions = true,
    this.headerHasCopy = true,
    this.includeRbx = true,
    this.includeBtc = true,
    this.includeRa = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final btcSelected = ref.watch(sessionProvider.select((v) => v.btcSelected));
    final currentWallet = !btcSelected ? ref.watch(sessionProvider.select((v) => v.currentWallet)) : null;
    final currentBtcAccount = btcSelected ? ref.watch(sessionProvider.select((v) => v.currentBtcAccount)) : null;
    // final List<dynamic> deleted = singleton<Storage>().getList(Storage.DELETED_WALLETS_KEY) ?? [];

    final allWallets = ref.watch(walletListProvider);

    final color = currentWallet != null && currentWallet.isReserved ? Colors.deepPurple.shade200 : Colors.white;

    final btcOrange = Theme.of(context).colorScheme.btcOrange;

    final btcAccounts = ref.watch(btcAccountListProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentWallet != null && headerHasCopy)
          Tooltip(
            message: "Copy VFX Address",
            child: InkWell(
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
          ),
        if (currentBtcAccount != null && headerHasCopy)
          Tooltip(
            message: "Copy BTC Address",
            child: InkWell(
              onTap: () async {
                await Clipboard.setData(
                  ClipboardData(text: currentBtcAccount.address),
                );
                Toast.message("${currentBtcAccount.address} copied to clipboard");
              },
              child: Icon(
                Icons.copy,
                size: 12,
                color: btcOrange,
              ),
            ),
          ),
        PopupMenuButton(
          color: Color(0xFF080808),
          constraints: const BoxConstraints(
            minWidth: 2.0 * 56.0,
            maxWidth: 8.0 * 56.0,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!btcSelected)
                    Text(
                      currentWallet != null
                          ? truncatedLabel
                              ? currentWallet.label
                              : currentWallet.labelWithoutTruncation
                          : "VFX/BTC Account Addresses",
                      style: TextStyle(color: color),
                    ),
                  if (btcSelected)
                    Text(
                      currentBtcAccount != null
                          ? truncatedLabel
                              ? currentBtcAccount.label
                              : currentBtcAccount.address
                          : "VFX/BTC Account Addresses",
                      style: TextStyle(color: btcOrange),
                    ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 18,
                    color: btcSelected ? btcOrange : color,
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
                      Text("New Account"),
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
              //         Text("Vault Accounts"),
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
                    children: [
                      Icon(Icons.publish, size: 16, color: btcOrange),
                      SizedBox(width: 8),
                      Text(
                        "Import BTC Wallet",
                        style: TextStyle(color: btcOrange),
                      ),
                    ],
                  ),
                  onTap: () async {
                    final privateKeyController = TextEditingController();
                    final List<String>? data = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Import BTC Private Key"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Paste in your BTC private key to import your account."),
                              ),
                              ListTile(
                                leading: const Icon(Icons.security),
                                title: TextFormField(
                                  controller: privateKeyController,
                                  decoration: InputDecoration(
                                      label: Text(
                                    "Private Key",
                                    style: TextStyle(color: btcOrange),
                                  )),
                                  style: const TextStyle(fontSize: 13),
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
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop([privateKeyController.text, "test"]);
                              },
                              child: Text(
                                "Import",
                                style: TextStyle(color: btcOrange),
                              ),
                            )
                          ],
                        );
                      },
                    );

                    if (data != null) {
                      if (data.length == 2) {
                        final privateKey = data.first;
                        const addressType = BtcAddressType.segwit;
                        final success = await ref.read(btcAccountListProvider.notifier).importPrivateKey(privateKey, addressType);
                        final btcAccountSyncInfo = ref.read(sessionProvider).btcAccountSyncInfo;

                        if (success) {
                          if (btcAccountSyncInfo != null) {
                            Toast.message("Private Key Imported! Please wait until ${btcAccountSyncInfo.nextSyncFormatted} for the balance to sync.");
                          } else {
                            Toast.message("Private Key Imported!");
                          }
                        } else {
                          Toast.error();
                        }
                      }
                    }
                  },
                ),
              );

              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 16, color: btcOrange),
                      SizedBox(width: 8),
                      Text(
                        "New BTC Account",
                        style: TextStyle(color: btcOrange),
                      ),
                    ],
                  ),
                  onTap: () async {
                    if (!await passwordRequiredGuard(context, ref)) return;

                    final account = await ref.read(btcAccountListProvider.notifier).create();
                    if (account == null) {
                      Toast.error();
                      return;
                    }

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("BTC Account Created"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Here are your BTC account details. Please ensure to back up your private key in a safe place."),
                              ),
                              ListTile(
                                leading: const Icon(Icons.account_balance_wallet),
                                title: TextFormField(
                                  initialValue: account.address,
                                  decoration: InputDecoration(
                                      label: Text(
                                    "Address",
                                    style: TextStyle(color: btcOrange),
                                  )),
                                  readOnly: true,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.security),
                                title: TextFormField(
                                  initialValue: account.privateKey,
                                  decoration: InputDecoration(
                                    label: Text("Private Key", style: TextStyle(color: btcOrange)),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  readOnly: true,
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.copy,
                                    color: btcOrange,
                                  ),
                                  onPressed: () async {
                                    await Clipboard.setData(ClipboardData(text: account.privateKey));
                                    Toast.message("Private Key copied to clipboard");
                                  },
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
                                  "Done",
                                  style: TextStyle(color: btcOrange),
                                ))
                          ],
                        );
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
                      Icon(Icons.wallet, size: 16),
                      SizedBox(width: 8),
                      Text("Manage Accounts"),
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
              if (!includeRbx) {
                break;
              }

              if (wallet.isReserved && !includeRa) {
                continue;
              }
              final isSelected = currentWallet != null && wallet.address == currentWallet.address;

              final color = wallet.isReserved ? Colors.deepPurple.shade200 : Theme.of(context).textTheme.bodyLarge!.color;

              list.add(
                PopupMenuItem(
                  child: Tooltip(
                    message: "${wallet.balance} VFX",
                    child: Row(
                      children: [
                        Icon(
                          isSelected ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                          color: color,
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            truncatedLabel ? wallet.label : wallet.labelWithoutTruncation,
                            style: TextStyle(
                              color: color,
                              decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: wallet.address));
                            Toast.message("${wallet.address} copied to clipboard");
                          },
                          child: SizedBox(width: 40, height: 20, child: Icon(Icons.copy, size: 15)),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
                  },
                ),
              );
            }

            if (btcAccounts.isNotEmpty && includeBtc) {
              list.add(const PopupMenuDivider());
            }

            for (final account in btcAccounts) {
              if (!includeBtc) {
                break;
              }
              final isSelected = currentBtcAccount?.address == account.address;

              list.add(
                PopupMenuItem(
                  child: Tooltip(
                    message: "${account.balance} BTC",
                    child: Row(
                      children: [
                        Icon(
                          isSelected ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                          color: btcOrange,
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            truncatedLabel ? account.label : account.address,
                            style: TextStyle(
                              color: btcOrange,
                              decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: account.address));
                            Toast.message("${account.address} copied to clipboard");
                          },
                          child: SizedBox(
                              width: 40,
                              height: 20,
                              child: Icon(
                                Icons.copy,
                                size: 15,
                                color: btcOrange,
                              )),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    ref.read(sessionProvider.notifier).setCurrentBtcAccount(account);
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
        "Vault Account Created",
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
              trailing: IconButton(
                icon: Icon(
                  Icons.copy,
                ),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: account.restoreCode));
                  Toast.message("Restore Code copied to clipboard");
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  icon: Icons.copy,
                  label: "Copy All",
                  variant: AppColorVariant.Success,
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: account.backupContents));
                    Toast.message("Vault Account Data copied to clipboard");
                  },
                ),
                AppButton(
                    label: "Save as File",
                    icon: Icons.save,
                    variant: AppColorVariant.Success,
                    onPressed: () async {
                      List<int> bytes = utf8.encode(account.backupContents);

                      final date = DateTime.now();
                      final d = "${date.year}-${date.month}-${date.day}";
                      if (Platform.isMacOS) {
                        await FileSaver.instance
                            .saveAs(name: "xRBX Vault Account Backup-$d", bytes: Uint8List.fromList(bytes), ext: 'txt', mimeType: MimeType.text);
                      } else {
                        final data = await FileSaver.instance
                            .saveFile(name: "xRBX Vault Account Backup-$d", bytes: Uint8List.fromList(bytes), ext: 'txt', mimeType: MimeType.text);

                        Toast.message("Saved to $data");
                      }

                      // if (Platform.isMacOS) {
                      //   await FileSaver.instance.saveAs("xRBX Vault Account Backup-$d", Uint8List.fromList(bytes), 'txt', MimeType.TEXT);
                      //   Toast.message("Vault Account Data saved");
                      // } else {
                      //   final data = await FileSaver.instance
                      //       .saveFile("xRBX Vault Account Backup-$d", Uint8List.fromList(bytes), 'txt', mimeType: MimeType.TEXT);
                      //   Toast.message("Vault Account Data saved to $data");
                      // }
                    }),
              ],
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
            Center(
              child: AppButton(
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
            )
          ],
        ),
      ),
    );
  }
}
