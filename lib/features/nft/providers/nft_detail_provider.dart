import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
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

  Future<void> init() async {
    state = await NftService().retrieve(id);
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

  Future<void> incrementEvolve() async {
    // if (state == null) return;

    // final i = state!.currentEvolvePhase.evolutionState;

    // final phases = [...state!.evolutionPhases];
    // final _phases = [];
    // for (final p in phases) {
    //   _phases.add(p.copyWith(isCurrentState: false));
    // }

    // _phases.removeAt(i);
    // _phases.insert(i, phases[i].copyWith(isCurrentState: true));

    // state = state.copyWith(phases: _phases);

    // state.evolutionPhases

    // state = state.copyWith()
  }

  bool canTransact([bool mustBeOwner = true]) {
    if (state == null) {
      Toast.error();
      return false;
    }

    if (mustBeOwner) {
      Wallet? wallet = read(walletListProvider)
          .firstWhereOrNull((w) => w.address == state!.address);

      if (wallet == null && mustBeOwner) {
        Toast.error("You are not the owner of this NFT.");

        return false;
      }

      wallet ??= read(walletListProvider)
          .firstWhereOrNull((w) => w.address == state!.minterAddress);

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
    final stage = state!.currentEvolvePhaseIndex + 1;
    return await setEvolve(stage, state!.address);
  }

  Future<bool> devolve() async {
    final stage = state!.currentEvolvePhaseIndex - 1;
    return await setEvolve(stage, state!.address);
  }

  Future<bool> burn() async {
    if (!canTransact()) return false;

    final success = await SmartContractService().burn(id);

    read(burnedProvider.notifier).addId(id);
    return success;
  }
}

final nftDetailProvider =
    StateNotifierProvider.family<NftDetailProvider, Nft?, String>(
  (ref, id) => NftDetailProvider(ref.read, id),
);
