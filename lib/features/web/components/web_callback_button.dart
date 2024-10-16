import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../raw/raw_service.dart';
import '../../reserve/providers/pending_callback_provider.dart';
import '../../transactions/models/web_transaction.dart';
import '../utils/raw_transaction.dart';
import '../../../utils/toast.dart';

class WebCallbackButton extends BaseComponent {
  final WebTransaction tx;
  const WebCallbackButton(this.tx, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider.select((v) => v.raKeypair));

    if (keypair == null) {
      return SizedBox.shrink();
    }

    final address = ref.watch(webSessionProvider.select((v) => v.currentWallet?.address));
    final toMe = tx.toAddress == address;

    if (tx.isPending || toMe || tx.unlockTime == null) {
      return SizedBox.shrink();
    }

    final canCallback = tx.unlockTime!.isAfter(DateTime.now());

    if (!canCallback) {
      return SizedBox.shrink();
    }

    return AppButton(
      label: "Callback",
      variant: AppColorVariant.Warning,
      disabled: ref.watch(pendingCallbackProvider).contains(tx.hash),
      onPressed: () async {
        final confirmed = await ConfirmDialog.show(
          title: "Callback Transaction",
          body: "Are you sure you want to callback this transaction?",
          confirmText: "Callback",
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
          "Function": "CallBack()",
          "Hash": tx.hash,
        };

        var txData = RawTransaction.buildTransaction(
          amount: 0,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: keypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          unlockTimestamp: 0,
        );

        final fee = await txService.getFee(txData);

        if (fee == null) {
          Toast.error("Failed to parse fee");
          return false;
        }

        txData = RawTransaction.buildTransaction(
          amount: 0,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: keypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          unlockTimestamp: 0,
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
          amount: 0,
          type: TxType.reserve,
          toAddress: "Reserve_Base",
          fromAddress: keypair.address,
          timestamp: timestamp,
          nonce: nonce,
          data: data,
          unlockTimestamp: 0,
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

        final _tx = await RawService().sendTransaction(
          transactionData: txData,
          execute: true,
          widgetRef: ref,
        );

        if (_tx != null) {
          if (_tx['Result'] == "Success") {
            ref.read(pendingCallbackProvider.notifier).addHash(tx.hash);
            Toast.message("Callback TX broadcasted");
            return true;
          }
        }
      },
    );
  }
}
