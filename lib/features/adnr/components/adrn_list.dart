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
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
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

        final adnrVerified = wallet.adnr?.contains('rbx') == true;
        final adnrLabel = wallet.adnr == null ? "No Domain" : "@${wallet.adnr!} ${!adnrVerified ? '(Not Verified)' : ''}";
        final isPending = ref.watch(adnrPendingProvider).contains(wallet.address) && wallet.adnr == null;

        return Card(
          child: ListTile(
            leading: Icon(Icons.wallet),
            title: Text(wallet.address),
            subtitle: Text("$adnrLabel\n${wallet.balance} RBX"),
            isThreeLine: true,
            trailing: Builder(
              builder: (context) {
                if (isPending) {
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
                    onPressed: () {
                      if (wallet.balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
                        Toast.error("Not enough RBX in this wallet to create an RBX domain. $ADNR_COST RBX required (plus TX fee).");
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return CreateAdnrDialog(address: wallet.address);
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
                            : () {
                                PromptModal.show(
                                    contextOverride: context,
                                    title: "Transfer RBX Domain",
                                    validator: (value) => formValidatorRbxAddress(value),
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
                        label: "Burn",
                        // type: AppButtonType.Text,
                        variant: AppColorVariant.Danger,
                        onPressed: () async {
                          final confirmed = await ConfirmDialog.show(
                            title: "Burn RBX Domain?",
                            body: "Are you sure you want to burn this RBX Domain?",
                            destructive: true,
                            cancelText: "Cancel",
                            confirmText: "Delete",
                          );

                          if (confirmed == true) {
                            final result = await TransactionService().deleteAdnr(wallet.address);
                            if (result.success) {
                              Toast.message("RBX domain burn transaction has been broadcasted. Check logs for tx hash");

                              if (result.hash != null) {
                                ref.read(logProvider.notifier).append(
                                      LogEntry(
                                          message: "RBX domain burn transaction broadcasted. Tx Hash: ${result.hash}",
                                          textToCopy: result.hash,
                                          variant: AppColorVariant.Success),
                                    );
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