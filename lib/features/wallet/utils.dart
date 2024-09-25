import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/btc/models/btc_address_type.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import 'package:rbx_wallet/features/encrypt/utils.dart';
import 'package:rbx_wallet/features/wallet/components/bulk_import_wallet_modal.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

enum _VfxOrBtcOption {
  vfx,
  btc,
}

enum _NewOrImportOption {
  create,
  import,
}

class AccountUtils {
  static Future<void> promptVfxOrBtc(BuildContext context, WidgetRef ref) async {
    final selection = await SpecialDialog<_VfxOrBtcOption>().show(
      context,
      title: "Add New Account",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            dense: true,
            // leading: Icon(Icons.add),
            title: Text(
              "VFX",
              style: TextStyle(color: AppColors.getBlue()),
            ),
            subtitle: Text("Setup a VerifiedX account"),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.white54,
            ),
            onTap: () {
              Navigator.of(context).pop(_VfxOrBtcOption.vfx);
            },
          ),
          Divider(),
          ListTile(
            dense: true,
            // leading: Icon(Icons.upload),
            title: Text(
              "BTC",
              style: TextStyle(color: AppColors.getBtc()),
            ),
            subtitle: Text("Setup a Bitcoin account"),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.white54,
            ),
            onTap: () {
              Navigator.of(context).pop(_VfxOrBtcOption.btc);
            },
          ),
        ],
      ),
    );

    switch (selection) {
      case null:
        return;

      case _VfxOrBtcOption.vfx:
        return await promptVfxNewOrImport(context, ref);
      case _VfxOrBtcOption.btc:
        return await promptBtcNewOrImport(context, ref);
    }
  }

  static Future<void> promptVfxNewOrImport(BuildContext context, WidgetRef ref) async {
    final selection = await SpecialDialog<_NewOrImportOption>().show(
      context,
      title: "Add VFX Account",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            dense: true,
            leading: Icon(Icons.add, color: AppColors.getBlue()),
            title: Text("Create"),
            subtitle: Text("Create a new VFX account"),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.white54,
            ),
            onTap: () {
              Navigator.of(context).pop(_NewOrImportOption.create);
            },
          ),
          Divider(),
          ListTile(
            dense: true,
            leading: Icon(Icons.upload, color: AppColors.getBlue()),
            title: Text("Import"),
            subtitle: Text("Import an existing VFX private key"),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.white54,
            ),
            onTap: () {
              Navigator.of(context).pop(_NewOrImportOption.import);
            },
          ),
        ],
      ),
    );

    switch (selection) {
      case null:
        return;
      case _NewOrImportOption.create:
        return newVfxAccount(context, ref);
      case _NewOrImportOption.import:
        return importVfxAccount(context, ref);
    }
  }

  static Future<void> promptBtcNewOrImport(BuildContext context, WidgetRef ref) async {
    final selection = await SpecialDialog<_NewOrImportOption>().show(
      context,
      title: "Add BTC Account",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            dense: true,
            leading: Icon(
              Icons.add,
              color: AppColors.getBtc(),
            ),
            title: Text("Create"),
            subtitle: Text("Create a new BTC account"),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.white54,
            ),
            onTap: () {
              Navigator.of(context).pop(_NewOrImportOption.create);
            },
          ),
          Divider(),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.upload,
              color: AppColors.getBtc(),
            ),
            title: Text("Import"),
            subtitle: Text("Import an existing BTC private key"),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.white54,
            ),
            onTap: () {
              Navigator.of(context).pop(_NewOrImportOption.import);
            },
          ),
        ],
      ),
    );

    switch (selection) {
      case null:
        return;
      case _NewOrImportOption.create:
        return newBtcAccount(context, ref);
      case _NewOrImportOption.import:
        return importBtcAccount(context, ref);
    }
  }

  static Future<void> newVfxAccount(BuildContext context, WidgetRef ref) async {
    if (!await passwordRequiredGuard(context, ref)) return;

    await ref.read(walletListProvider.notifier).create();
  }

  static Future<void> importVfxAccount(BuildContext context, WidgetRef ref) async {
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
  }

  static Future<void> newBtcAccount(BuildContext context, WidgetRef ref) async {
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
                    style: TextStyle(color: AppColors.getBtc()),
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
                    label: Text("Private Key", style: TextStyle(color: AppColors.getBtc())),
                  ),
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  readOnly: true,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: AppColors.getBtc(),
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
                  style: TextStyle(color: AppColors.getBtc()),
                ))
          ],
        );
      },
    );
  }

  static Future<void> importBtcAccount(BuildContext context, WidgetRef ref) async {
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
                    style: TextStyle(color: AppColors.getBtc()),
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
                style: TextStyle(color: AppColors.getBtc()),
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
  }
}
