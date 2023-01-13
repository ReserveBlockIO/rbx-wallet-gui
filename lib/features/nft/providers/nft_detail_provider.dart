import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/burned_provider.dart';
import 'package:rbx_wallet/features/nft/providers/transferred_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

class NftDetailProvider extends StateNotifier<Nft?> {
  final Reader read;
  final String id;

  NftDetailProvider(this.read, this.id) : super(null) {
    init();
  }

  Future<Nft?> _retrieve() async {
    final nft = kIsWeb ? await TransactionService().retrieveNft(id) : await NftService().retrieve(id);

    return nft;
  }

  Future<void> init() async {
    state = await _retrieve();

    pollForUpdate();
    pollForGeneralUpdate();
  }

  Future<void> pollForUpdate() async {
    if (state == null) return;

    if (!state!.isPublished) {
      await Future.delayed(const Duration(seconds: 10));
      final updated = await _retrieve();
      if (updated != null && updated.isPublished) {
        state = updated;
        return;
      }

      pollForUpdate();
    }
  }

  Future<void> pollForEvolutionUpdate(int stage) async {
    if (state == null) return;
    await Future.delayed(const Duration(seconds: 10));

    final updated = await _retrieve();
    if (updated != null && updated.currentEvolvePhaseIndex + 1 == stage) {
      state = updated;
      return;
    }

    pollForEvolutionUpdate(stage);
  }

  Future<void> pollForGeneralUpdate() async {
    if (state == null) return;
    await Future.delayed(const Duration(seconds: 30));

    final updated = await _retrieve();
    if (updated != null) {
      state = updated;
    }

    pollForGeneralUpdate();
  }

  Future<void> togglePrivate() async {
    if (state == null) return;
    final success = await NftService().togglePrivate(id);
    if (success) {
      state = state!.copyWith(isPublic: !state!.isPublic);
    } else {
      Toast.error();
    }
  }

  bool canTransact([bool mustBeOwner = true]) {
    if (state == null) {
      Toast.error();
      return false;
    }

    if (mustBeOwner) {
      Wallet? wallet = read(walletListProvider).firstWhereOrNull((w) => w.address == state!.currentOwner);

      if (wallet == null && mustBeOwner) {
        Toast.error("You are not the owner of this NFT.");

        return false;
      }

      wallet ??= read(walletListProvider).firstWhereOrNull((w) => w.address == state!.minterAddress);

      if (wallet == null) {
        Toast.error("You are not the owner or minter of this NFT.");
        return false;
      }

      if (wallet.balance < MIN_RBX_FOR_SC_ACTION) {
        Toast.error("Not enough RBX do this action");
        return false;
      }
    }

    return true;
  }

  Future<String?> transfer(String address, String? url) async {
    // if (!canTransact()) return false;
    read(globalLoadingProvider.notifier).start();
    final error = await SmartContractService().transfer(id, address, url);
    read(globalLoadingProvider.notifier).complete();
    if (error == null) {
      read(transferredProvider.notifier).addId(id);
    }
    return error;
  }

  static bool _txResponseIsValid(Map<String, dynamic>? data) {
    if (data == null || data['Result'] != "Success") {
      return false;
    }

    return true;
  }

  Future<bool?> transferWebOut(String toAddress) async {
    final keypair = read(webSessionProvider).keypair;
    if (keypair == null) {
      return false;
    }
    final txService = TransactionService();

    final timestampData = await txService.getTimestamp();

    if (!_txResponseIsValid(timestampData)) {
      Toast.error("Failed to retrieve timestamp");
      return false;
    }

    final int? timestamp = timestampData!['Timestamp'];
    if (timestamp == null) {
      Toast.error("Failed to parse timestamp");
      return false;
    }

    final nonceData = await txService.getNonce(keypair.public);
    if (!_txResponseIsValid(nonceData)) {
      Toast.error("Failed to retrieve nonce");
      return false;
    }

    final int? nonce = nonceData!['Nonce'];
    if (nonce == null) {
      Toast.error("Failed to parse nonce");
      return false;
    }

    // TODO: check if receiving wallet is a web wallet and if so skip the beacon request and just put "NA" in the nft transfer data

    // final locators = await TransactionService().getLocators(id);
    // if (locators == null) {
    //   Toast.error("Locators request failed.");
    //   return false;
    // }

    final nftTransferData = await txService.nftTransferData(id, toAddress, "NA");

    var txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftTx,
      toAddress: toAddress,
      fromAddress: keypair.public,
      timestamp: timestamp,
      nonce: nonce,
      data: nftTransferData,
    );

    final feeData = (await txService.getFee(txData))!['data'];

    if (!_txResponseIsValid(feeData)) {
      Toast.error("Failed to retreive fee");
      return false;
    }

    final double? fee = feeData!['Fee'];
    if (fee == null) {
      Toast.error("Failed to parse fee");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftTx,
      toAddress: toAddress,
      fromAddress: keypair.public,
      timestamp: timestamp,
      nonce: nonce,
      data: nftTransferData,
      fee: fee,
    );

    final hashData = (await txService.getHash(txData))!['data'];

    if (!_txResponseIsValid(hashData)) {
      Toast.error("Failed to retreive hash");
      return null;
    }

    final String? hash = hashData!['Hash'];

    if (hash == null) {
      Toast.error("Failed to parse hash");
      return null;
    }

    final signature = await RawTransaction.getSignature(message: hash, privateKey: keypair.private, publicKey: keypair.publicInflated);
    if (signature == null) {
      Toast.error("Signature generation failed.");
      return false;
    }

    final validateData = await txService.validateSignature(
      hash,
      keypair.public,
      signature,
    );

    if (!_txResponseIsValid(validateData)) {
      Toast.error("Signature not valid");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftTx,
      toAddress: toAddress,
      fromAddress: keypair.public,
      timestamp: timestamp,
      nonce: nonce,
      data: nftTransferData,
      fee: fee,
      hash: hash,
      signature: signature,
    );

    final verifyTransactionData = (await txService.sendTransaction(
      transactionData: txData,
      execute: false,
    ))!['data'];

    if (!_txResponseIsValid(verifyTransactionData)) {
      Toast.error("Transaction not valid");
      return false;
    }

    final tx = await TransactionService().sendTransaction(
      transactionData: txData,
      execute: true,
    );

    if (tx != null) {
      if (tx['data']['Result'] == "Success") {
        return true;
      }
    }

    Toast.error("The fact something went wrong here but not until this point is odd.");
  }

  Future<bool> transferWebIn() async {
    final keypair = read(webSessionProvider).keypair;
    if (keypair == null) {
      return false;
    }

    print("SID: $id");

    final locators = await TransactionService().getLocators(id);
    if (locators == null) {
      Toast.error("Locators request failed.");
      return false;
    }

    final signature = await RawTransaction.getSignature(message: id, privateKey: keypair.private, publicKey: keypair.publicInflated);
    if (signature == null) {
      Toast.error("Signature generation failed.");
      return false;
    }

    final beaconAssets = await TransactionService().beaconAssets(id, locators, signature);

    if (beaconAssets != true) {
      Toast.error("Assets Request failed.");
      return false;
    }

    state = await _retrieve();

    return true;
  }

  Future<bool> setEvolve(int stage, String toAddress) async {
    // if (!canTransact()) return false;

    final success = await SmartContractService().evolve(id, toAddress, stage);

    return success;
  }

  Future<bool> evolve() async {
    final stage = state!.currentEvolvePhaseIndex + 2;
    return await setEvolve(stage, state!.currentOwner);
  }

  Future<bool> devolve() async {
    final stage = state!.currentEvolvePhaseIndex;
    return await setEvolve(stage, state!.currentOwner);
  }

  Future<bool> burnWeb() async {
    final keypair = read(webSessionProvider).keypair;
    if (keypair == null) {
      return false;
    }
    final txService = TransactionService();

    final timestampData = await txService.getTimestamp();

    if (!_txResponseIsValid(timestampData)) {
      Toast.error("Failed to retrieve timestamp");
      return false;
    }

    final int? timestamp = timestampData!['Timestamp'];
    if (timestamp == null) {
      Toast.error("Failed to parse timestamp");
      return false;
    }

    final nonceData = await txService.getNonce(keypair.public);
    if (!_txResponseIsValid(nonceData)) {
      Toast.error("Failed to retrieve nonce");
      return false;
    }

    final int? nonce = nonceData!['Nonce'];
    if (nonce == null) {
      Toast.error("Failed to parse nonce");
      return false;
    }

    final nftBurnDataRaw = await TransactionService().nftBurnData(id, keypair.public);

    final nftBurnData = jsonDecode(nftBurnDataRaw);

    var txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftBurn,
      toAddress: keypair.public,
      fromAddress: keypair.public,
      timestamp: timestamp,
      nonce: nonce,
      data: nftBurnData,
    );

    final feeData = (await txService.getFee(txData))!['data'];

    if (!_txResponseIsValid(feeData)) {
      Toast.error("Failed to retreive fee");
      return false;
    }

    final double? fee = feeData!['Fee'];
    if (fee == null) {
      Toast.error("Failed to parse fee");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftBurn,
      toAddress: keypair.public,
      fromAddress: keypair.public,
      timestamp: timestamp,
      nonce: nonce,
      data: nftBurnData,
      fee: fee,
    );

    final hashData = (await txService.getHash(txData))!['data'];

    if (!_txResponseIsValid(hashData)) {
      Toast.error("Failed to retreive hash");
      return false;
    }

    final String? hash = hashData!['Hash'];

    if (hash == null) {
      Toast.error("Failed to parse hash");
      return false;
    }

    final signature = await RawTransaction.getSignature(message: hash, privateKey: keypair.private, publicKey: keypair.publicInflated);
    if (signature == null) {
      Toast.error("Signature generation failed.");
      return false;
    }

    final validateData = await txService.validateSignature(
      hash,
      keypair.public,
      signature,
    );

    if (!_txResponseIsValid(validateData)) {
      Toast.error("Signature not valid");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftBurn,
      toAddress: keypair.public,
      fromAddress: keypair.public,
      timestamp: timestamp,
      nonce: nonce,
      data: nftBurnData,
      fee: fee,
      hash: hash,
      signature: signature,
    );

    final verifyTransactionData = (await txService.sendTransaction(
      transactionData: txData,
      execute: false,
    ))!['data'];

    if (!_txResponseIsValid(verifyTransactionData)) {
      Toast.error("Transaction not valid");
      return false;
    }

    final tx = await TransactionService().sendTransaction(
      transactionData: txData,
      execute: true,
    );

    if (tx != null) {
      if (tx['data']['Result'] == "Success") {
        read(burnedProvider.notifier).addId(id);

        return true;
      }
    }

    Toast.error("The fact something went wrong here but not until this point is odd.");

    return false;
  }

  Future<bool> burn() async {
    if (!canTransact()) return false;

    final success = await SmartContractService().burn(id);

    read(burnedProvider.notifier).addId(id);
    return success;
  }
}

final nftDetailProvider = StateNotifierProvider.family<NftDetailProvider, Nft?, String>(
  (ref, id) => NftDetailProvider(ref.read, id),
);
