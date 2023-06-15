import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebActivateRaButton extends BaseComponent {
  const WebActivateRaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).raKeypair;

    if (keypair == null) {
      return SizedBox();
    }

    return AppButton(
      label: "Activate Now",
      variant: AppColorVariant.Light,
      onPressed: () async {
        final confirmed = await ConfirmDialog.show(
          title: "Activate Reserve Account?",
          body: "There is a cost of $RA_ACTIVATION_COST RBX to activate your reserve account which is burned.\nContinue?",
          confirmText: "Activate",
          cancelText: "Canacel",
        );

        if (confirmed != true) {
          return null;
        }

        final txService = RawService();

        final timestamp = await txService.getTimestamp();

        if (timestamp == null) {
          Toast.error("Failed to retrieve timestamp");
          return false;
        }

        final nonce = await txService.getNonce(keypair.address);
        if (nonce == null) {
          Toast.error("Failed to retrieve nonce");
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
          return false;
        }

        final signature = await RawTransaction.getSignature(message: hash, privateKey: keypair.private, publicKey: keypair.public);
        if (signature == null) {
          Toast.error("Signature generation failed.");
          return false;
        }

        final isValid = await txService.validateSignature(
          hash,
          keypair.address,
          signature,
        );

        if (!isValid) {
          Toast.error("Signature not valid");
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
            return true;
          }
        }

        Toast.error();
        return false;
      },
    );
  }
}
