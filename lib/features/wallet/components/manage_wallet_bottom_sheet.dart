import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_context_menu.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_detail_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/utils/toast.dart';

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
            shrinkWrap: true,
            itemCount: wallets.length + 1,
            itemBuilder: (context, index) {
              final isLast = index == wallets.length;

              if (isLast) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        label: "Restore Deleted",
                        type: AppButtonType.Text,
                        variant: AppColorVariant.Info,
                        onPressed: () {
                          singleton<Storage>()
                              .setList(Storage.DELETED_WALLETS_KEY, []);
                          ref.read(sessionProvider.notifier).init();
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
                ));
              }

              final wallet = wallets[index];

              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.white24,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    leading: Icon(Icons.account_balance_wallet_outlined),
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
                                ref
                                    .read(walletDetailProvider(wallet).notifier)
                                    .rename(value);
                              },
                            );
                          },
                          icon: Icon(
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
                            child: Icon(
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
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Private Key"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.security),
                                          title: TextFormField(
                                            initialValue: wallet.privateKey,
                                            decoration: InputDecoration(
                                              label: Text("Private Key"),
                                            ),
                                            style: TextStyle(fontSize: 13),
                                            readOnly: true,
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(Icons.copy),
                                            onPressed: () async {
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text: wallet.privateKey));
                                              Toast.message(
                                                  "Private Key copied to clipboard");
                                            },
                                          ),
                                        ),
                                        Divider(),
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
                          type: AppButtonType.Text,
                          variant: AppColorVariant.Danger,
                          label: "Delete",
                          onPressed: () async {
                            final confirmed = await ConfirmDialog.show(
                              title: "Delete wallet?",
                              body:
                                  "Are you sure you want to delete this wallet?",
                              destructive: true,
                              confirmText: "Delete",
                              cancelText: "Cancel",
                            );

                            if (confirmed) {
                              ref
                                  .read(walletDetailProvider(wallet).notifier)
                                  .delete();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
