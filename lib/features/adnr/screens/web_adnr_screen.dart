import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../components/create_adnr_dialog.dart';
import '../providers/adnr_pending_provider.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../raw/raw_service.dart';
import '../../web/components/web_no_wallet.dart';
import '../../web/utils/raw_transaction.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

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
    final address = keypair?.address;
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
          child: Container(
            decoration: BoxDecoration(
              boxShadow: glowingBox,
            ),
            child: Card(
              color: Colors.black87,
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
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: glowingBox,
          ),
          child: Card(
            color: Colors.black87,
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
                          if (balance < (ADNR_TRANSFER_COST + MIN_RBX_FOR_SC_ACTION)) {
                            Toast.error("Not enough RBX in this wallet to create a transaction.");
                            return;
                          }

                          PromptModal.show(
                              contextOverride: context,
                              title: "Transfer RBX Domain",
                              body: "There is a cost of $ADNR_TRANSFER_COST RBX to transfer an RBX Domain.",
                              validator: (value) => formValidatorRbxAddress(value, false),
                              labelText: "Address",
                              onValidSubmission: (toAddress) async {
                                ref.read(globalLoadingProvider.notifier).start();

                                final txData = await RawTransaction.generate(
                                  keypair: ref.read(webSessionProvider).keypair!,
                                  amount: ADNR_TRANSFER_COST,
                                  toAddress: toAddress,
                                  txType: TxType.adnr,
                                  data: {"Function": "AdnrTransfer()", "Name": adnr},
                                );

                                ref.read(globalLoadingProvider.notifier).complete();

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

                                ref.read(globalLoadingProvider.notifier).start();

                                final tx = await RawService().sendTransaction(
                                  transactionData: txData,
                                  execute: true,
                                  widgetRef: ref,
                                );

                                ref.read(globalLoadingProvider.notifier).complete();

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
                          if (balance < (ADNR_DELETE_COST + MIN_RBX_FOR_SC_ACTION)) {
                            Toast.error("Not enough RBX in this wallet to create a transaction.");
                            return;
                          }

                          final confirmed = await ConfirmDialog.show(
                            title: "Delete RBX Domain?",
                            body:
                                "Are you sure you want to delete this RBX Domain?\n${ADNR_DELETE_COST == 0 ? 'There is no cost to delete and RBX Domain (aside from the TX fee).' : 'There is a cost of $ADNR_DELETE_COST RBX to delete an RBX Domain.'}\n\nOnce deleted, this ADNR will no longer be able to receive any transactions.",
                            destructive: true,
                            cancelText: "Cancel",
                            confirmText: "Delete",
                          );

                          if (confirmed == true) {
                            ref.read(globalLoadingProvider.notifier).start();
                            final txData = await RawTransaction.generate(
                              keypair: ref.read(webSessionProvider).keypair!,
                              amount: ADNR_DELETE_COST,
                              toAddress: "Adnr_Base",
                              txType: TxType.adnr,
                              data: {"Function": "AdnrDelete()", "Name": adnr},
                            );

                            ref.read(globalLoadingProvider.notifier).complete();
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

                            ref.read(globalLoadingProvider.notifier).start();

                            final tx = await RawService().sendTransaction(transactionData: txData, execute: true, widgetRef: ref);
                            ref.read(globalLoadingProvider.notifier).complete();

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
      ),
    );
  }
}
