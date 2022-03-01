import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/wallet/components/import_wallet_form.dart';
import 'package:rbx_wallet/features/wallet/components/manage_wallet_bottom_sheet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

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
    final allWallets = ref.watch(walletListProvider);

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
            ),
          ),
        PopupMenuButton(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(currentWallet != null
                      ? truncatedLabel
                          ? currentWallet.label
                          : currentWallet.labelWithoutTruncation
                      : "Wallet"),
                  Icon(Icons.arrow_drop_down, size: 18),
                ],
              ),
            ),
          ),
          itemBuilder: (context) {
            final list = <PopupMenuEntry<int>>[];

            for (final wallet in allWallets) {
              final isSelected = currentWallet != null &&
                  wallet.address == currentWallet.address;

              final color = isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).textTheme.bodyText1!.color;

              list.add(
                PopupMenuItem(
                  child: Text(
                    truncatedLabel
                        ? wallet.label
                        : wallet.labelWithoutTruncation,
                    style: TextStyle(color: color),
                  ),
                  onTap: () {
                    ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
                  },
                ),
              );
            }

            if (withOptions) {
              if (list.isNotEmpty) {
                list.add(PopupMenuDivider());
              }

              list.add(
                PopupMenuItem(
                  child: Text("Import Wallet"),
                  onTap: () {
                    PromptModal.show(
                      title: "Import Wallet",
                      validator: (String? value) =>
                          formValidatorNotEmpty(value, "Private Key"),
                      labelText: "Private Key",
                      onValidSubmission: (value) async {
                        await ref
                            .read(walletListProvider.notifier)
                            .import(value);
                      },
                    );
                  },
                ),
              );
              list.add(
                PopupMenuItem(
                  child: Text("New Wallet"),
                  onTap: () async {
                    await ref.read(walletListProvider.notifier).create();
                  },
                ),
              );

              list.add(
                PopupMenuItem(
                  child: Text("Manage Wallets"),
                  onTap: () async {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: rootNavigatorKey.currentContext!,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return ManageWalletBottomSheet();
                      },
                    );
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
