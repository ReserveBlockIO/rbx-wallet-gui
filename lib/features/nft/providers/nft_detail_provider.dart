import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/explorer_service.dart';
import '../../raw/raw_service.dart';
import '../../reserve/services/reserve_account_service.dart';

import '../../../core/app_constants.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../utils/toast.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../smart_contracts/services/smart_contract_service.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../../web/utils/raw_transaction.dart';
import '../models/nft.dart';
import '../services/nft_service.dart';
import 'burned_provider.dart';
import 'transferred_provider.dart';

class NftDetailProvider extends StateNotifier<Nft?> {
  final Ref ref;
  final String id;

  NftDetailProvider(this.ref, this.id) : super(null) {
    init();
  }

  Future<Nft?> _retrieve() async {
    final nft = kIsWeb ? await ExplorerService().retrieveNft(id) : await NftService().retrieve(id);

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
      Wallet? wallet = ref.read(walletListProvider).firstWhereOrNull((w) => w.address == state!.currentOwner);

      if (wallet == null && mustBeOwner) {
        Toast.error("You are not the owner of this NFT.");

        return false;
      }

      wallet ??= ref.read(walletListProvider).firstWhereOrNull((w) => w.address == state!.minterAddress);

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

  Future<bool> transfer(String address, String? url) async {
    // if (!canTransact()) return false;
    ref.read(globalLoadingProvider.notifier).start();
    final success = await SmartContractService().transfer(id, address, url);
    ref.read(globalLoadingProvider.notifier).complete();
    if (success) {
      ref.read(transferredProvider.notifier).addId(id);
      return true;
    }
    return false;
  }

  Future<bool> transferFromReserveAccount({
    required String toAddress,
    required String fromAddress,
    required String password,
    required int delayHours,
    String? backupUrl,
  }) async {
    // if (!canTransact()) return false;
    ref.read(globalLoadingProvider.notifier).start();
    final success = await ReserveAccountService().transferFromReserveAccount(
      id: id,
      fromAddress: fromAddress,
      toAddress: toAddress,
      password: password,
      delayHours: delayHours,
      backupUrl: backupUrl,
    );
    ref.read(globalLoadingProvider.notifier).complete();

    if (success) {
      ref.read(transferredProvider.notifier).addId(id);
      return true;
    }
    return false;
  }

  Future<bool?> transferWebOut(String toAddress, int? unlockHours) async {
    final keyPair = ref.read(webSessionProvider).keypair;
    final raKeypair = ref.read(webSessionProvider).raKeypair;
    final usingRa = ref.read(webSessionProvider).usingRa;
    final address = !usingRa ? keyPair?.address : raKeypair?.address;
    final private = !usingRa ? keyPair?.private : raKeypair?.private;
    final public = !usingRa ? keyPair?.public : raKeypair?.public;

    if (address == null || private == null || public == null) {
      Toast.error("No wallet");
      return null;
    }

    final message = id;

    final beaconSignature = await RawTransaction.getSignature(
      message: message,
      privateKey: private,
      publicKey: public,
    );

    if (beaconSignature == null) {
      Toast.error("Couldn't produce beacon upload signature");
      return false;
    }

    final locator = await RawService().beaconUpload(id, toAddress, beaconSignature);

    if (locator == null) {
      Toast.error("Could not create beacon upload request.");
      return false;
    }

    final txService = RawService();

    final timestamp = await txService.getTimestamp();

    if (timestamp == null) {
      Toast.error("Failed to retrieve timestamp");
      return false;
    }

    final nonce = await txService.getNonce(address);
    if (nonce == null) {
      Toast.error("Failed to retrieve nonce");
      return false;
    }

    final nftTransferData = await txService.nftTransferData(id, toAddress, locator);
    print("NFT Transfer data: $nftTransferData");

    final unlockTimestamp = unlockHours != null ? (DateTime.now().add(Duration(hours: unlockHours)).millisecondsSinceEpoch / 1000).round() : null;

    var txData = RawTransaction.buildTransaction(
        amount: 0.0,
        type: TxType.nftTx,
        toAddress: toAddress,
        fromAddress: address,
        timestamp: timestamp,
        nonce: nonce,
        data: nftTransferData,
        unlockTimestamp: unlockTimestamp);

    final fee = await txService.getFee(txData);

    if (fee == null) {
      Toast.error("Failed to retreive fee");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftTx,
      toAddress: toAddress,
      fromAddress: address,
      timestamp: timestamp,
      nonce: nonce,
      data: nftTransferData,
      fee: fee,
      unlockTimestamp: unlockTimestamp,
    );

    final hash = await txService.getHash(txData);

    if (hash == null) {
      Toast.error("Failed to parse hash");
      return null;
    }

    final signature = await RawTransaction.getSignature(message: hash, privateKey: private, publicKey: public);
    if (signature == null) {
      Toast.error("Signature generation failed.");
      return false;
    }

    final isValid = await txService.validateSignature(
      hash,
      address,
      signature,
    );

    if (!isValid) {
      Toast.error("Signature not valid");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftTx,
      toAddress: toAddress,
      fromAddress: address,
      timestamp: timestamp,
      nonce: nonce,
      data: nftTransferData,
      fee: fee,
      hash: hash,
      signature: signature,
      unlockTimestamp: unlockTimestamp,
    );

    final verifyTransactionData = await txService.sendTransaction(
      transactionData: txData,
      execute: false,
    );

    if (verifyTransactionData == null) {
      Toast.error("Transaction not valid");
      return false;
    }

    final tx = await RawService().sendTransaction(
      transactionData: txData,
      execute: true,
      ref: ref,
    );

    if (tx != null) {
      if (tx['Result'] == "Success") {
        return true;
      }
    }

    Toast.error();
    return false;
  }

  Future<bool> transferWebIn() async {
    final keypair = ref.read(webSessionProvider).keypair;
    if (keypair == null) {
      return false;
    }

    final locators = await RawService().getLocators(id);
    print("locators: $locators");
    if (locators == null) {
      Toast.error("Locators request failed.");
      return false;
    }

    final message = id;

    final signature = await RawTransaction.getSignature(message: message, privateKey: keypair.private, publicKey: keypair.public);
    if (signature == null) {
      Toast.error("Signature generation failed.");
      return false;
    }

    final isValid = await RawService().validateSignature(message, keypair.address, signature);

    if (!isValid) {
      Toast.error("Signature not valid");
      return false;
    }

    final beaconAssets = await RawService().beaconAssets(id, locators, keypair.address, signature);

    if (beaconAssets != true) {
      Toast.error("Assets Request failed.");
      return false;
    }

    state = await _retrieve();

    return true;
  }

  Future<bool> setEvolve(int stage, String toAddress) async {
    // if (!canTransact()) return false;

    if (kIsWeb) {
      final keypair = ref.read(webSessionProvider).keypair;
      if (keypair == null) {
        return false;
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

      final evolveData = await txService.nftEvolveData(id, toAddress, stage);

      var txData = RawTransaction.buildTransaction(
        amount: 0.0,
        type: TxType.nftTx,
        toAddress: toAddress,
        fromAddress: keypair.address,
        timestamp: timestamp,
        nonce: nonce,
        data: evolveData,
      );
      final fee = await txService.getFee(txData);

      if (fee == null) {
        Toast.error("Failed to parse fee");
        return false;
      }

      txData = RawTransaction.buildTransaction(
        amount: 0.0,
        type: TxType.nftTx,
        toAddress: toAddress,
        fromAddress: keypair.address,
        timestamp: timestamp,
        nonce: nonce,
        data: evolveData,
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
        amount: 0.0,
        type: TxType.nftTx,
        toAddress: toAddress,
        fromAddress: keypair.address,
        timestamp: timestamp,
        nonce: nonce,
        data: evolveData,
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
        ref: ref,
      );

      if (tx != null) {
        if (tx['Result'] == "Success") {
          return true;
        }
      }

      Toast.error();
      return false;
    } else {
      final success = await SmartContractService().evolve(id, toAddress, stage);

      return success;
    }
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
    final keypair = ref.read(webSessionProvider).keypair;
    if (keypair == null) {
      return false;
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

    final nftBurnDataRaw = await RawService().nftBurnData(id, keypair.address);

    final nftBurnData = jsonDecode(nftBurnDataRaw);

    var txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftBurn,
      toAddress: keypair.address,
      fromAddress: keypair.address,
      timestamp: timestamp,
      nonce: nonce,
      data: nftBurnData,
    );

    final fee = await txService.getFee(txData);

    if (fee == null) {
      Toast.error("Failed to parse fee");
      return false;
    }

    txData = RawTransaction.buildTransaction(
      amount: 0.0,
      type: TxType.nftBurn,
      toAddress: keypair.address,
      fromAddress: keypair.address,
      timestamp: timestamp,
      nonce: nonce,
      data: nftBurnData,
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
      amount: 0.0,
      type: TxType.nftBurn,
      toAddress: keypair.address,
      fromAddress: keypair.address,
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
    ));

    if (verifyTransactionData == null) {
      Toast.error("Transaction not valid");
      return false;
    }

    final tx = await RawService().sendTransaction(
      transactionData: txData,
      execute: true,
      ref: ref,
    );

    if (tx != null) {
      if (tx['Result'] == "Success") {
        ref.read(burnedProvider.notifier).addId(id);

        return true;
      }
    }

    Toast.error();

    return false;
  }

  Future<bool> burn() async {
    if (!canTransact()) return false;

    final success = await SmartContractService().burn(id);

    ref.read(burnedProvider.notifier).addId(id);
    return success;
  }
}

final nftDetailProvider = StateNotifierProvider.family<NftDetailProvider, Nft?, String>(
  (ref, id) => NftDetailProvider(ref, id),
);
