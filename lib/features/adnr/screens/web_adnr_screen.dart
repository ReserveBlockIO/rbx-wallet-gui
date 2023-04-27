import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/adnr/components/create_adnr_dialog.dart';
import 'package:rbx_wallet/features/adnr/providers/adnr_pending_provider.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/web/components/web_no_wallet.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class WebAdnrScreen extends BaseScreen {
  const WebAdnrScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("RBX Domains"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);
    final keypair = session.keypair;
    final address = keypair?.public;
    final adnr = session.adnr;

    if (keypair == null || address == null) {
      return const WebNotWallet();
    }

    final balance = session.balance ?? 0;
    final isPendingCreate = ref.watch(adnrPendingProvider).contains("$address.create.${adnr ?? 'null'}");
    final isPendingBurn = ref.watch(adnrPendingProvider).contains("$address.delete.${adnr ?? 'null'}");
    final isPendingTransfer = ref.watch(adnrPendingProvider).contains("$address.transfer.${adnr ?? 'null'}");

    if (isPendingCreate) {
      return const Center(
        child: AppBadge(
          label: "RBX Domain Pending",
          variant: AppColorVariant.Success,
        ),
      );
    }

    if (isPendingTransfer) {
      return const Center(
        child: AppBadge(
          label: "RBX Domain Transfer Pending",
          variant: AppColorVariant.Primary,
        ),
      );
    }

    if (isPendingBurn) {
      return const Center(
        child: AppBadge(
          label: "RBX Domain Delete Pending",
          variant: AppColorVariant.Danger,
        ),
      );
    }

    if (adnr == null) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Create an RBX Domain as an alias to your wallet's address for receiving funds.",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "RBX domains cost $ADNR_COST RBX plus the transaction fee.",
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  AppButton(
                    label: "Create Domain",
                    variant: AppColorVariant.Success,
                    onPressed: () async {
                      if (balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
                        Toast.error("Not enough RBX in this wallet to create an RBX domain. $ADNR_COST RBX required (plus TX fee).");
                        return;
                      }

                      await showDialog(
                          context: context,
                          builder: (context) {
                            return CreateAdnrDialog(
                              address: address,
                              adnr: "",
                            );
                          });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  adnr,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  address,
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      label: "Transfer",
                      onPressed: () async {
                        if (balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
                          Toast.error("Not enough RBX in this wallet to create a transaction.");
                          return;
                        }

                        PromptModal.show(
                            contextOverride: context,
                            title: "Transfer RBX Domain",
                            body: "There is a cost of $ADNR_COST RBX to transfer an RBX Domain.",
                            validator: (value) => formValidatorRbxAddress(value, false),
                            labelText: "Address",
                            onValidSubmission: (toAddress) async {
                              final txData = await RawTransaction.generate(
                                keypair: ref.read(webSessionProvider).keypair!,
                                amount: ADNR_COST,
                                toAddress: toAddress,
                                txType: TxType.adnr,
                                data: {"Function": "AdnrTransfer()", "Name": adnr},
                              );

                              if (txData == null) {
                                Toast.error("Invalid transaction data.");
                                return;
                              }

                              final txFee = txData['Fee'];

                              final confirmed = await ConfirmDialog.show(
                                title: "Valid Transaction",
                                body:
                                    "The RBX Domain transaction is valid.\nAre you sure you want to proceed?\n\nDomain: $adnr.rbx\nAmount: $ADNR_COST RBX\nFee: $txFee RBX\nTotal: ${ADNR_COST + txFee} RBX",
                                confirmText: "Send",
                                cancelText: "Cancel",
                              );

                              if (confirmed != true) {
                                Toast.message("Transaction Cancelled");
                                return;
                              }

                              final tx = await RawService().sendTransaction(
                                transactionData: txData,
                                execute: true,
                              );

                              if (tx != null && tx['Result'] == "Success") {
                                ref.read(adnrPendingProvider.notifier).addId(address, "transfer", adnr);

                                Toast.message("RBX Domain Transaction has been broadcasted. See log for hash.");

                                return;
                              }

                              Toast.error();
                            });
                      },
                    ),
                    AppButton(
                      label: "Delete",
                      variant: AppColorVariant.Danger,
                      onPressed: () async {
                        if (balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
                          Toast.error("Not enough RBX in this wallet to create a transaction.");
                          return;
                        }

                        final confirmed = await ConfirmDialog.show(
                          title: "Delete RBX Domain?",
                          body:
                              "Are you sure you want to delete this RBX Domain?\nThere is a cost of $ADNR_COST RBX to delete an RBX Domain.\n\nOnce deleted, this ADNR will no longer be able to receive any transactions.",
                          destructive: true,
                          cancelText: "Cancel",
                          confirmText: "Delete",
                        );

                        if (confirmed == true) {
                          final txData = await RawTransaction.generate(
                            keypair: ref.read(webSessionProvider).keypair!,
                            amount: ADNR_COST,
                            toAddress: "Adnr_Base",
                            txType: TxType.adnr,
                            data: {"Function": "AdnrDelete()", "Name": adnr},
                          );

                          if (txData == null) {
                            Toast.error("Invalid transaction data.");
                            return;
                          }

                          final txFee = txData['Fee'];

                          final confirmed = await ConfirmDialog.show(
                            title: "Valid Transaction",
                            body:
                                "The RBX Domain transaction is valid.\nAre you sure you want to proceed?\n\nDomain: $adnr.rbx\nAmount: $ADNR_COST RBX\nFee: $txFee RBX\nTotal: ${ADNR_COST + txFee} RBX",
                            confirmText: "Send",
                            cancelText: "Cancel",
                          );

                          if (confirmed != true) {
                            Toast.message("Transaction Cancelled");
                            return;
                          }

                          final tx = await RawService().sendTransaction(
                            transactionData: txData,
                            execute: true,
                          );

                          if (tx != null && tx['Result'] == "Success") {
                            ref.read(adnrPendingProvider.notifier).addId(address, "delete", adnr);

                            Toast.message("RBX Domain Transaction has been broadcasted. See log for hash.");
                            return;
                          }

                          Toast.error();
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
