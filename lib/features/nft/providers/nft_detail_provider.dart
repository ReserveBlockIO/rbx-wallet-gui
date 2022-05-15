import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

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
}

final nftDetailProvider =
    StateNotifierProvider.family<NftDetailProvider, Nft?, String>(
  (ref, id) => NftDetailProvider(ref.read, id),
);
