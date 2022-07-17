import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/burned_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/formatting.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

class NftDetailProvider extends StateNotifier<Nft?> {
  final Reader read;
  final String id;

  NftDetailProvider(this.read, this.id) : super(null) {
    init();
  }

  Future<Nft?> _retrieve() async {
    return kIsWeb ? await TransactionService().retrieveNft(id) : await NftService().retrieve(id);
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

  Future<bool> transfer(String address) async {
    if (!canTransact()) return false;
    final success = await SmartContractService().transfer(id, address);
    return success;
  }

  Future<dynamic> transferWebOut(String toAddress) async {
    if (!canTransact()) return false;

    final keypair = read(webSessionProvider).keypair;
    if (keypair == null) {
      return false;
    }

    // get timestamp
    // get nonce

    // beacon upload request (message is uid)
    // get nft transfer data
    // get tx fee
    // get hash
    // create signature
    // validate
    // send raw transaction (data)

    // TX type NftTx
  }

  Future<bool> transferWebIn(String toAddress) async {
    if (!canTransact()) return false;

    final keypair = read(webSessionProvider).keypair;
    if (keypair == null) {
      return false;
    }

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

    if (beaconAssets == null) {
      Toast.error("Assets Request failed.");
      return false;
    }

    // final beaconUpload = await TransactionService().beaconUpload(id, toAddress, signature);
    // if (beaconUpload == null) {
    //   Toast.error("Beacon Upload request failed.");
    //   return false;
    // }

    // final nftTransferData = await TransactionService().nftTransferData(
    //   id,
    //   toAddress,
    //   beaconUpload,
    //   beaconUpload,
    // );

    // if (nftTransferData == null) {
    //   Toast.error("Nft Transfer Data request failed.");
    //   return false;
    // }

    return true;
  }

  Future<bool> setEvolve(int stage, String toAddress) async {
    if (!canTransact()) return false;

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
