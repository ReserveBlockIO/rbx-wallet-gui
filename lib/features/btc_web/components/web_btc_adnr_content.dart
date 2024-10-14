import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../adnr/components/create_adnr_dialog.dart';
import '../../adnr/providers/adnr_pending_provider.dart';
import '../models/btc_web_account.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/components.dart';
import '../../raw/raw_service.dart';
import '../../web/utils/raw_transaction.dart';

class WebBtcAdnrContent extends BaseComponent {
  final BtcWebAccount account;
  const WebBtcAdnrContent({super.key, required this.account});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);

    final address = account.address;
    final adnr = account.adnr;

    final balance = session.balance ?? 0;

    final isPendingCreate = ref.watch(adnrPendingProvider).contains("$address.create.${adnr ?? 'null'}");
    final isPendingBurn = ref.watch(adnrPendingProvider).contains("$address.delete.${adnr ?? 'null'}");
    final isPendingTransfer = ref.watch(adnrPendingProvider).contains("$address.transfer.${adnr ?? 'null'}");

    if (isPendingCreate) {
      return const Center(
        child: AppBadge(
          label: "BTC Domain Pending",
          variant: AppColorVariant.Success,
        ),
      );
    }

    if (isPendingTransfer) {
      return const Center(
        child: AppBadge(
          label: "BTC Domain Transfer Pending",
          variant: AppColorVariant.Primary,
        ),
      );
    }

    if (isPendingBurn) {
      return const Center(
        child: AppBadge(
          label: "BTC Domain Delete Pending",
          variant: AppColorVariant.Danger,
        ),
      );
    }

    if (adnr == null) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: AppCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create a BTC Domain as an alias to your account's address for receiving funds.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "BTC domains cost $ADNR_COST VFX plus the transaction fee.",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Divider(),
                ),
                AppButton(
                  label: "Create Domain",
                  variant: AppColorVariant.Btc,
                  onPressed: () async {
                    if (balance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
                      Toast.error("Not enough VFX in your account to create a VFX domain. $ADNR_COST VFX required (plus TX fee).");
                      return;
                    }

                    await showDialog(
                      context: context,
                      builder: (context) {
                        return CreateAdnrDialog(
                          address: address,
                          adnr: "",
                          isBtc: true,
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: AppCard(
          padding: 8,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      label: "Transfer",
                      onPressed: () async {
                        if (balance < (ADNR_TRANSFER_COST + MIN_RBX_FOR_SC_ACTION)) {
                          Toast.error("Not enough VFX in this account to create a transaction.");
                          return;
                        }

                        final btcToAddress = await PromptModal.show(
                          contextOverride: context,
                          title: "Transfer BTC Domain",
                          body: "There is a cost of $ADNR_TRANSFER_COST VFX to transfer a BTC Domain.",
                          validator: (value) => formValidatorNotEmpty(value, "BTC Address"),
                          labelText: "BTC Address",
                        );
                        if (btcToAddress == null) return;

                        final vfxToAddress = await PromptModal.show(
                            contextOverride: context,
                            title: "VFX Owner",
                            body: "What VFX address will manage this BTC domain?",
                            validator: (value) => formValidatorRbxAddress(value, false),
                            labelText: "VFX Address,");
                        if (vfxToAddress == null) return;

                        ref.read(globalLoadingProvider.notifier).start();

                        final txData = await RawTransaction.generate(
                          keypair: ref.read(webSessionProvider).keypair!,
                          amount: ADNR_TRANSFER_COST,
                          toAddress: vfxToAddress,
                          txType: TxType.adnr,
                          data: {
                            "Function": "BTCAdnrTransfer()",
                            "BTCToAddress": btcToAddress,
                            "BTCFromAddress": account.address,
                          },
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
                              "The BTC Domain transaction is valid.\nAre you sure you want to proceed?\n\nDomain: $adnr.vfx\nAmount: $ADNR_COST VFX\nFee: $txFee VFX\nTotal: ${ADNR_COST + txFee} VFX",
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

                          Toast.message("BTC Domain Transaction has been broadcasted. See log for hash.");

                          return;
                        }

                        Toast.error();
                      },
                    ),
                    AppButton(
                      label: "Delete",
                      variant: AppColorVariant.Danger,
                      onPressed: () async {
                        if (balance < (ADNR_DELETE_COST + MIN_RBX_FOR_SC_ACTION)) {
                          Toast.error("Not enough VFX in this account to create a transaction.");
                          return;
                        }

                        final confirmed = await ConfirmDialog.show(
                          title: "Delete BTC Domain?",
                          body:
                              "Are you sure you want to delete this BTC Domain?\n${ADNR_DELETE_COST == 0 ? 'There is no cost to delete and BTC Domain (aside from the TX fee).' : 'There is a cost of $ADNR_DELETE_COST VFX to delete a BTC Domain.'}\n\nOnce deleted, this ADNR will no longer be able to receive any transactions.",
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
                            data: {"Function": "BTCAdnrDelete()", "BTCFromAddress": account.address},
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
                                "The VFX Domain transaction is valid.\nAre you sure you want to proceed?\n\nDomain: $adnr.btc\nAmount: $ADNR_COST VFX\nFee: $txFee VFX\nTotal: ${ADNR_COST + txFee} VFX",
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

                            Toast.message("BTC Domain Transaction has been broadcasted. See log for hash.");
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
