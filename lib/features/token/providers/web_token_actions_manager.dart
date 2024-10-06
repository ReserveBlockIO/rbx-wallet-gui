import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/token/models/web_fungible_token.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';

import '../../../core/app_constants.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../keygen/models/keypair.dart';
import '../../raw/raw_service.dart';

class WebTokenActionsManager {
  final Ref ref;

  WebTokenActionsManager(this.ref);

  Future<bool?> _verifyConfirmAndSendTx({
    required String toAddress,
    required Map<String, dynamic> data,
    Keypair? keypairOverride,
    int txType = TxType.tokenTx,
    double amount = 0,
  }) async {
    final keypair = keypairOverride ?? ref.read(webSessionProvider).keypair;
    if (keypair == null) {
      Toast.error("No keypair found to sign transaction");
      return false;
    }

    ref.read(globalLoadingProvider.notifier).start();

    final txData = await RawTransaction.generate(
      keypair: keypair,
      toAddress: toAddress,
      amount: amount,
      txType: txType,
      data: data,
    );

    ref.read(globalLoadingProvider.notifier).complete();

    if (txData == null) {
      Toast.error("Invalid transaction data.");
      return false;
    }

    final txFee = txData['Fee'];

    final confirmed = await ConfirmDialog.show(
      title: "Valid Transaction",
      body: "Transaction verified. There will be a fee of $txFee VFX. Would you like to proceed?",
      confirmText: "Yes",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();

    final tx = await RawService().sendTransaction(transactionData: txData, execute: true, ref: ref);
    ref.read(globalLoadingProvider.notifier).complete();

    if (tx != null && tx['Result'] == "Success") {
      Toast.message("Transaction broadcasted!");
      return true;
    }

    Toast.error(tx?['Message']);
    return false;
  }

  Future<bool?> mintTokens(WebFungibleToken token, String address, double amount) async {
    final data = {
      "Function": "TokenMint()",
      "ContractUID": token.smartContractId,
      "FromAddress": address,
      "Amount": amount,
      "TokenTicker": token.ticker,
      "TokenName": token.name,
    };

    return await _verifyConfirmAndSendTx(
      toAddress: "Token_Base",
      data: data,
    );
  }

  Future<bool?> transferAmount(WebFungibleToken token, String toAddress, String fromAddress, double amount) async {
    final data = {
      "Function": "TokenTransfer()",
      "ContractUID": token.smartContractId,
      "FromAddress": fromAddress,
      "ToAddress": toAddress,
      "Amount": amount,
      "TokenTicker": token.ticker,
      "TokenName": token.name,
    };

    return await _verifyConfirmAndSendTx(
      toAddress: toAddress,
      data: data,
    );
  }

  Future<bool?> burnAmount(WebFungibleToken token, String address, double amount) async {
    final data = {
      "Function": "TokenBurn()",
      "ContractUID": token.smartContractId,
      "FromAddress": address,
      "Amount": amount,
      "TokenTicker": token.ticker,
      "TokenName": token.name,
    };

    return await _verifyConfirmAndSendTx(
      toAddress: "Token_Base",
      data: data,
    );
  }

  // String? getSenderAddress({Keypair? keypairOverride}) {
  //   final keypair = keypairOverride ?? ref.read(webSessionProvider).keypair;

  //   if (keypair == null) {
  //     Toast.error("A standard VFX account is required to proceed");
  //     return null;
  //   }

  //   return keypair.address;
  // }

  bool verifyBalance({bool isRa = false}) {
    if (isRa) {
      if ((ref.read(webSessionProvider).raBalance ?? 0) < MIN_RBX_FOR_SC_ACTION) {
        Toast.error("A balance on your Vault account is required to broadcast this transaction");

        return false;
      }
      return true;
    }

    if ((ref.read(webSessionProvider).balance ?? 0) < MIN_RBX_FOR_SC_ACTION) {
      Toast.error("A balance on your VFX account is required to broadcast this transaction");

      return false;
    }
    return true;
  }

  bool guardIsTokenOwner(WebFungibleToken token) {
    final sessionModel = ref.read(webSessionProvider);

    if ([sessionModel.keypair?.address, sessionModel.raKeypair?.address].contains(token.ownerAddress)) {
      return true;
    }
    Toast.error("Only the owner of this token can perform this action");
    return false;
  }

  bool guardIsTokenOwnerAndNotVault(WebFungibleToken token) {
    if (!guardIsTokenOwner(token)) {
      return false;
    }

    final sessionModel = ref.read(webSessionProvider);

    if (sessionModel.keypair?.address == token.ownerAddress) {
      return true;
    }

    Toast.error("Vault accounts cannot perform this action. Please transfer ownership to your standard VFX account first");
    return false;
  }

  Future<String?> promptForAddress({String title = "Address"}) async {
    final address = await PromptModal.show(
      title: title,
      validator: formValidatorRbxAddress,
      labelText: "Address",
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
      ],
    );

    if (address == null || address.isEmpty) {
      return null;
    }

    return address;
  }

  Future<double?> promptForAmount({String title = "Amount"}) async {
    final amount = await PromptModal.show(
      title: title,
      validator: (val) => formValidatorNumber(val, "Amount"),
      labelText: "Amount",
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
    );
    if (amount == null || amount.isEmpty) {
      return null;
    }

    final amountDouble = double.tryParse(amount);

    if (amountDouble == null) {
      Toast.error("Invalid Amount");
      return null;
    }
    return amountDouble;
  }
}

final webTokenActionsManager = Provider((ref) {
  return WebTokenActionsManager(ref);
});
