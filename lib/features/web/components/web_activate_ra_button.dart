import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/components/buttons.dart';
import 'package:flutter/material.dart';
import '../../../core/app_constants.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../raw/raw_service.dart';
import '../providers/web_ra_pending_activation_provider.dart';
import '../utils/raw_transaction.dart';
import '../../../utils/toast.dart';

class WebActivateRaButton extends BaseComponent {
  const WebActivateRaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).raKeypair;

    final hasActivated =
        ref.watch(webRaPendingActivationProvider).contains(keypair?.address);

    if (keypair == null) {
      return SizedBox();
    }

    if (hasActivated) {
      return AppBadge(
        label: "Pending Activation",
        variant: AppColorVariant.Warning,
      );
    }

    return AppButton(
      label: "Activate Now",
      variant: AppColorVariant.Light,
      onPressed: () async {
        final loadingProvider = ref.read(globalLoadingProvider.notifier);

        final confirmed = await ConfirmDialog.show(
          title: "Activate Reserve Account?",
          body:
              "There is a cost of $RA_ACTIVATION_COST VFX to activate your reserve account which is burned.\n\nContinue?",
          confirmText: "Activate",
          cancelText: "Canacel",
        );

        if (confirmed != true) {
          return null;
        }

        loadingProvider.start();

        final txService = RawService();

        final timestamp = await txService.getTimestamp();

        if (timestamp == null) {
          Toast.error("Failed to retrieve timestamp");
          loadingProvider.complete();
          return false;
        }

        final nonce = await txService.getNonce(keypair.address);
        if (nonce == null) {
          Toast.error("Failed to retrieve nonce");
          loadingProvider.complete();
          return false;
        }

        final data = {
          "Function": "Register()",
          "RecoveryAddress": keypair.recoveryAddress,
        };

        var txData = RawTransaction.buildTransaction(
          amount: RA_ACTIVATION_COST,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: keypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
        );

        final fee = await txService.getFee(txData);

        if (fee == null) {
          Toast.error("Failed to parse fee");
          loadingProvider.complete();
          return false;
        }

        txData = RawTransaction.buildTransaction(
          amount: RA_ACTIVATION_COST,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: keypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          fee: fee,
        );

        final hash = (await txService.getHash(txData));
        if (hash == null) {
          Toast.error("Failed to parse hash");
          loadingProvider.complete();
          return false;
        }

        final signature = await RawTransaction.getSignature(
            message: hash,
            privateKey: keypair.private,
            publicKey: keypair.public);
        if (signature == null) {
          Toast.error("Signature generation failed.");
          loadingProvider.complete();
          return false;
        }

        final isValid = await txService.validateSignature(
          hash,
          keypair.address,
          signature,
        );

        if (!isValid) {
          Toast.error("Signature not valid");
          loadingProvider.complete();
          return false;
        }

        txData = RawTransaction.buildTransaction(
          amount: RA_ACTIVATION_COST,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: keypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          fee: fee,
          hash: hash,
          signature: signature,
        );

        final verifyTransactionData = (await txService.sendTransaction(
          transactionData: txData,
          execute: false,
        ));

        if (verifyTransactionData == null) {
          Toast.error("Transaction not valid");
          loadingProvider.complete();
          return false;
        }

        final tx = await RawService().sendTransaction(
          transactionData: txData,
          execute: true,
          widgetRef: ref,
        );

        if (tx != null) {
          if (tx['Result'] == "Success") {
            Toast.message("Activation transaction broadcasted");
            loadingProvider.complete();
            ref
                .read(webRaPendingActivationProvider.notifier)
                .addAddress(keypair.address);
            return true;
          }
        }

        Toast.error();
        loadingProvider.complete();
        return false;
      },
    );
  }
}
