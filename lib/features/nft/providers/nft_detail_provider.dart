import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/burned_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
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

      // if (wallet == null && mustBeOwner) {
      //   Toast.error("You are not the owner of this NFT.");

      //   return false;
      // }

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

  Future<bool> setEvolve(int stage, String toAddress) async {
    if (!canTransact()) return false;

    final success = await SmartContractService().evolve(id, toAddress, stage);

    return success;
  }

  Future<bool> evolve() async {
    final stage = state!.currentEvolvePhaseIndex + 2;
    final address = read(sessionProvider).currentWallet?.address ?? state?.minterAddress ?? "";
    return await setEvolve(stage, address);
  }

  Future<bool> devolve() async {
    final stage = state!.currentEvolvePhaseIndex;
    final address = read(sessionProvider).currentWallet?.address ?? state?.minterAddress ?? "";

    return await setEvolve(stage, address);
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
