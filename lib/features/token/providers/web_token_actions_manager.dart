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
import '../../keygen/models/ra_keypair.dart';
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
    int? unlockHours,
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
      unlockHours: unlockHours,
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

  Future<bool?> transferOwnership(
    WebFungibleToken token,
    String toAddress,
    String fromAddress,
  ) async {
    final data = {
      "Function": "TokenContractOwnerChange()",
      "ContractUID": token.smartContractId,
      "FromAddress": fromAddress,
      "ToAddress": toAddress,
    };

    return await _verifyConfirmAndSendTx(
      toAddress: toAddress,
      data: data,
    );
  }

  Future<bool?> transferOwnershipFromVault(
    WebFungibleToken token,
    String toAddress,
    String fromAddress,
    RaKeypair raKeypair,
    int unlockHours,
  ) async {
    final data = {
      "Function": "TokenContractOwnerChange()",
      "ContractUID": token.smartContractId,
      "FromAddress": fromAddress,
      "ToAddress": toAddress,
    };

    return await _verifyConfirmAndSendTx(
      toAddress: toAddress,
      data: data,
      keypairOverride: raKeypair.asKeypair,
      unlockHours: unlockHours,
    );
  }

  Future<bool?> pause(
    WebFungibleToken token,
    String address,
    bool pause,
  ) async {
    final data = {
      "Function": "TokenPause()",
      "ContractUID": token.smartContractId,
      "FromAddress": address,
      "Pause": pause,
    };

    return await _verifyConfirmAndSendTx(
      toAddress: "Token_Base",
      data: data,
    );
  }

  Future<bool?> banAddress(
    WebFungibleToken token,
    String ownerAddress,
    String banAddress,
  ) async {
    final data = {
      "Function": "TokenBanAddress()",
      "ContractUID": token.smartContractId,
      "FromAddress": ownerAddress,
      "BanAddress": banAddress,
    };

    return await _verifyConfirmAndSendTx(
      toAddress: "Token_Base",
      data: data,
    );
  }

  Future<bool?> createVotingTopic(WebFungibleToken token) async {
    print("TODO!");
    final data = {
      "Function": "TokenVoteTopicCreate()",
      "ContractUID": "7ea07bcbc7914f36a9b53e587eef2369:1728133202", //**
      "FromAddress": "xMjrfrzkrNC2g3KJidbwF21gB7R3m46B9w", //**
      "TokenVoteTopic": {
        "SmartContractUID": "7ea07bcbc7914f36a9b53e587eef2369:1728133202", //**
        "TopicUID": "2yKRCE0y1728182840", //** GENERATE RANDOM?
        "TopicName": "Super Test Topic", //**
        "TopicDescription": "Hello ", //**
        "MinimumVoteRequirement": 1000, //**
        "BlockHeight": 7667, //**  use most recent block
        "TokenHolderCount": 2, //**
        "TopicCreateDate": 1728182840, //**
        "VotingEndDate": 1730774840, //** based on timestamp + length
        "VoteYes": 0,
        "VoteNo": 0,
        "TotalVotes": 0,
        "PercentVotesYes": 0,
        "PercentVotesNo": 0,
        "PercentInFavor": 0,
        "PercentAgainst": 0
      }
    };
    return null;
  }

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

  bool guardIsNotPaused(WebFungibleToken token) {
    if (token.isPaused) {
      Toast.error("Transactions on this token are currently paused.");
      return false;
    }
    return true;
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
