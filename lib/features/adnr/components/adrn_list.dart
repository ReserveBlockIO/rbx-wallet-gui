import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/adnr/components/create_adnr_dialog.dart';
import 'package:rbx_wallet/features/adnr/providers/adnr_pending_provider.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/encrypt/utils.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class AdnrList extends BaseComponent {
  const AdnrList({
    Key? key,
    required this.wallets,
  }) : super(key: key);

  final List<Wallet> wallets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: wallets.length,
      itemBuilder: (context, index) {
        final wallet = wallets[index];

        final adnrVerified = wallet.adnr != null;
        final adnrLabel = wallet.adnr == null ? "No Domain" : "@${wallet.adnr!}";
        final isPendingCreate = ref.watch(adnrPendingProvider).contains("${wallet.address}.create.${wallet.adnr ?? 'null'}");

        final isPendingBurn = ref.watch(adnrPendingProvider).contains("${wallet.address}.burn.${wallet.adnr ?? 'null'}");

        final isPendingTransfer = ref.watch(adnrPendingProvider).contains("${wallet.address}.transfer.${wallet.adnr ?? 'null'}");

        return Card(
          child: ListTile(
            leading: Icon(Icons.wallet),
            title: SelectableText(wallet.address),
            subtitle: Text("$adnrLabel\n${wallet.balance} RBX"),
            isThreeLine: true,
            trailing: Builder(
              builder: (context) {
                if (isPendingBurn) {
                  return AppBadge(
                    label: "Delete Pending",
                    variant: AppColorVariant.Danger,
                  );
                }

                if (isPendingTransfer) {
                  return AppBadge(
                    label: "Transfer Pending",
                    variant: AppColorVariant.Dark,
                  );
                }

                if (isPendingCreate) {
                  return AppBadge(
                    label: "Pending",
                    variant: AppColorVariant.Warning,
                  );
                }

                if (wallet.adnr == null) {
                  return AppButton(
                    label: "Create Domain",
                    // type: AppButtonType.Text,
                    variant: AppColorVariant.Success,
                    onPressed: () async {
                      if (!await passwordRequiredGuard(context, ref)) return;

                      if (!guardWalletIsSynced(ref.read)) {
                        return;
                      }
                      if (wallet.balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
                        Toast.error("Not enough RBX in this wallet to create an RBX domain. $ADNR_COST RBX required (plus TX fee).");
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return CreateAdnrDialog(
                              address: wallet.address,
                              adnr: wallet.adnr,
                            );
                          });
                    },
                  );
                } else {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton(
                        label: "Transfer",
                        onPressed: !adnrVerified
                            ? null
                            : () async {
                                if (!await passwordRequiredGuard(context, ref)) return;
                                if (!guardWalletIsSynced(ref.read)) {
                                  return;
                                }
                                PromptModal.show(
                                    contextOverride: context,
                                    title: "Transfer RBX Domain",
                                    validator: (value) => formValidatorRbxAddress(value, false),
                                    labelText: "Address",
                                    onValidSubmission: (toAddress) async {
                                      final result = await TransactionService().transferAdnr(wallet.address, toAddress);
                                      if (result.success) {
                                        Toast.message("RBX domain transfer transaction has been broadcasted. Check logs for tx hash");

                                        if (result.hash != null) {
                                          ref.read(logProvider.notifier).append(
                                                LogEntry(
                                                    message: "RBX domain transfer transaction broadcasted. Tx Hash: ${result.hash}",
                                                    textToCopy: result.hash,
                                                    variant: AppColorVariant.Success),
                                              );

                                          ref.read(adnrPendingProvider.notifier).addId(wallet.address, "transfer", wallet.adnr ?? "null");
                                        }

                                        return;
                                      }

                                      Toast.error(result.message);
                                    });
                              },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      AppButton(
                        label: "Delete",
                        // type: AppButtonType.Text,
                        variant: AppColorVariant.Danger,
                        onPressed: () async {
                          if (!await passwordRequiredGuard(context, ref)) return;
                          if (!guardWalletIsSynced(ref.read)) {
                            return;
                          }
                          final confirmed = await ConfirmDialog.show(
                            title: "Delete RBX Domain?",
                            body: "Are you sure you want to delete this RBX Domain?",
                            destructive: true,
                            cancelText: "Cancel",
                            confirmText: "Delete",
                          );

                          if (confirmed == true) {
                            final result = await TransactionService().deleteAdnr(wallet.address);
                            if (result.success) {
                              Toast.message("RBX domain delete transaction has been broadcasted. Check logs for tx hash");

                              if (result.hash != null) {
                                ref.read(logProvider.notifier).append(
                                      LogEntry(
                                          message: "RBX domain delete transaction broadcasted. Tx Hash: ${result.hash}",
                                          textToCopy: result.hash,
                                          variant: AppColorVariant.Success),
                                    );
                                ref.read(adnrPendingProvider.notifier).addId(wallet.address, "burn", wallet.adnr ?? "null");
                              }
                            }
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
