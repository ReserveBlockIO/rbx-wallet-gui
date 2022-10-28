import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/adnr/components/create_adnr_dialog.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_detail_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

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
                        label: "Restore Hidden Accounts",
                        type: AppButtonType.Text,
                        variant: AppColorVariant.Info,
                        onPressed: () {
                          singleton<Storage>().setList(Storage.DELETED_WALLETS_KEY, []);
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
                decoration: const BoxDecoration(
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
                        // if (wallet.adnr == null)
                        //   AppButton(
                        //     label: "Create ADNR",
                        //     type: AppButtonType.Text,
                        //     variant: AppColorVariant.Secondary,
                        //     onPressed: () {
                        //       Navigator.of(context).pop();

                        //       if (wallet.balance < ADNR_COST + MIN_RBX_FOR_SC_ACTION) {
                        //         Toast.error("Not enough RBX in this wallet to create an ADNR. $ADNR_COST RBX required (plus TX fee).");
                        //         return;
                        //       }

                        //       showDialog(
                        //           context: context,
                        //           builder: (context) {
                        //             return CreateAdnrDialog(address: wallet.address);
                        //           });
                        //     },
                        //   ),
                        // if (wallet.adnr != null) ...[
                        //   AppButton(
                        //     label: "Transfer ADNR",
                        //     type: AppButtonType.Text,
                        //     variant: AppColorVariant.Secondary,
                        //     onPressed: () {
                        //       Navigator.of(context).pop();
                        //       PromptModal.show(
                        //           contextOverride: context,
                        //           title: "Transfer ADNR",
                        //           validator: (value) => formValidatorRbxAddress(value),
                        //           labelText: "Address",
                        //           onValidSubmission: (toAddress) async {
                        //             final result = await TransactionService().transferAdnr(wallet.address, toAddress);
                        //             if (result.success) {
                        //               Toast.message("ADNR transfer transaction has been broadcasted. Check logs for tx hash");

                        //               if (result.hash != null) {
                        //                 ref.read(logProvider.notifier).append(
                        //                       LogEntry(
                        //                           message: "ADNR transfer transaction broadcasted. Tx Hash: ${result.hash}",
                        //                           textToCopy: result.hash,
                        //                           variant: AppColorVariant.Success),
                        //                     );
                        //               }
                        //               return;
                        //             }

                        //             Toast.error(result.message);
                        //           });
                        //     },
                        //   ),
                        //   AppButton(
                        //     label: "Burn ADNR",
                        //     type: AppButtonType.Text,
                        //     variant: AppColorVariant.Danger,
                        //     onPressed: () async {
                        //       Navigator.of(context).pop();
                        //       final confirmed = await ConfirmDialog.show(
                        //         title: "Burn ADNR?",
                        //         body: "Are you sure you want to delete this ADNR?",
                        //         destructive: true,
                        //         cancelText: "Cancel",
                        //         confirmText: "Delete",
                        //       );

                        //       if (confirmed == true) {
                        //         final result = await TransactionService().deleteAdnr(wallet.address);
                        //         if (result.success) {
                        //           Toast.message("ADNR delete transaction has been broadcasted. Check logs for tx hash");

                        //           if (result.hash != null) {
                        //             ref.read(logProvider.notifier).append(
                        //                   LogEntry(
                        //                       message: "ADNR delete transaction broadcasted. Tx Hash: ${result.hash}",
                        //                       textToCopy: result.hash,
                        //                       variant: AppColorVariant.Success),
                        //                 );
                        //           }
                        //         }
                        //       }
                        //     },
                        //   ),
                        // ],
                        AppButton(
                            type: AppButtonType.Text,
                            label: "Reveal Private Key",
                            variant: AppColorVariant.Info,
                            onPressed: () {
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
                                              initialValue: wallet.privateKey,
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
                                              await Clipboard.setData(ClipboardData(text: wallet.privateKey));
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
              );
            },
          ),
        ),
      ),
    );
  }
}
