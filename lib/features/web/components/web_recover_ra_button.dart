import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../raw/raw_service.dart';
import '../providers/web_ra_pending_recovery_provider.dart';
import '../utils/raw_transaction.dart';
import '../../../utils/toast.dart';

class WebRecoverRaButton extends BaseComponent {
  const WebRecoverRaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).raKeypair;
    final hasRecovered = ref.watch(webRaPendingRecoveryProvider).contains(keypair?.address);

    if (keypair == null) {
      return SizedBox();
    }
    return AppButton(
      label: "Recover",
      disabled: hasRecovered,
      icon: Icons.warning,
      type: AppButtonType.Text,
      variant: AppColorVariant.Warning,
      onPressed: () async {
        final raKeypair = ref.read(webSessionProvider).raKeypair;
        final loadingProvider = ref.read(globalLoadingProvider.notifier);

        if (raKeypair == null) {
          Toast.error();
          return null;
        }

        final confirmed = await ConfirmDialog.show(
          title: "Recover Funds & NFTs",
          body:
              "This is a destructive function that will callback all pending transactions and NFTs and move everything to this recovery address:\n\n${raKeypair.recoveryAddress}",
          confirmText: "Proceed",
          cancelText: "Cancel",
          destructive: true,
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

        final nonce = await txService.getNonce(raKeypair.address);
        if (nonce == null) {
          Toast.error("Failed to retrieve nonce");
          loadingProvider.complete();
          return false;
        }

        final currentTime = (DateTime.now().millisecondsSinceEpoch / 1000).round();

        final recoverySigScriptMessage = "$currentTime${raKeypair.recoveryAddress}";

        final recoverySigScript = await RawTransaction.getSignature(
            message: recoverySigScriptMessage, privateKey: raKeypair.recoveryPrivate, publicKey: raKeypair.recoveryPublic);

        if (recoverySigScript == null) {
          Toast.error("Problem generating RecoverySigScript");
          loadingProvider.complete();
          return false;
        }

        final data = {
          "Function": "Recover()",
          "RecoveryAddress": raKeypair.recoveryAddress,
          "RecoverySigScript": recoverySigScript,
          "SignatureTime": currentTime,
        };

        var txData = RawTransaction.buildTransaction(
          amount: 0,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: raKeypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          unlockTimestamp: 0,
        );

        final fee = await txService.getFee(txData);

        if (fee == null) {
          Toast.error("Failed to parse fee");
          loadingProvider.complete();
          return false;
        }

        txData = RawTransaction.buildTransaction(
          amount: 0,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: raKeypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          fee: fee,
          unlockTimestamp: 0,
        );

        final hash = (await txService.getHash(txData));
        if (hash == null) {
          Toast.error("Failed to parse hash");
          loadingProvider.complete();
          return false;
        }

        final signature = await RawTransaction.getSignature(message: hash, privateKey: raKeypair.private, publicKey: raKeypair.public);
        if (signature == null) {
          Toast.error("Signature generation failed.");
          loadingProvider.complete();
          return false;
        }

        final isValid = await txService.validateSignature(
          hash,
          raKeypair.address,
          signature,
        );

        if (!isValid) {
          Toast.error("Signature not valid");
          loadingProvider.complete();
          return false;
        }

        txData = RawTransaction.buildTransaction(
          amount: 0,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: raKeypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          fee: fee,
          hash: hash,
          signature: signature,
          unlockTimestamp: 0,
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
            Toast.message("Recovery transaction broadcasted.");
            ref.read(webRaPendingRecoveryProvider.notifier).addAddress(keypair.address);
            loadingProvider.complete();
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
