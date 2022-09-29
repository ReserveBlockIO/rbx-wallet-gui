import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/utils/generators.dart';

class EvolveFormProvider extends StateNotifier<Evolve> {
  final Reader read;

  EvolveFormProvider(this.read, [Evolve model = const Evolve()]) : super(model);

  setEvolve(Evolve evolve) {
    state = evolve;

    for (var i = 0; i < evolve.phases.length; i++) {
      read(evolvePhaseFormProvider(i).notifier).setPhase(evolve.phases[i]);
    }
  }

  updateType(EvolveType type) {
    state = state.copyWith(type: type);
  }

  updateMode(bool value) {
    state = state.copyWith(isDynamic: value);

    if (value == false) {
      updateType(EvolveType.manualOnly);
    } else {
      if (state.type == EvolveType.manualOnly) {
        updateType(EvolveType.time);
      }
    }
  }

  addPhase() {
    const phase = EvolvePhase();
    state = state.copyWith(phases: [...state.phases, phase]);
  }

  removePhase(int index) {
    state = state.copyWith(phases: [...state.phases]..removeAt(index));
  }

  setAsset(Asset? asset) {
    state = state.copyWith(asset: asset);
  }

  updatePhase(int index, EvolvePhase phase) {
    final updatedPhases = [...state.phases];
    updatedPhases.removeAt(index);
    updatedPhases.insert(index, phase);
    state = state.copyWith(phases: updatedPhases);
  }

  complete() {
    read(createSmartContractProvider.notifier).saveEvolve(state);
  }

  clear() {
    for (int i = 0; i < state.phases.length; i++) {
      read(evolvePhaseFormProvider(i).notifier).clear();
    }

    final id = uniqueId();
    state = Evolve(id: id, phases: [const EvolvePhase()]);
  }
}

final evolveFormProvider = StateNotifierProvider<EvolveFormProvider, Evolve>(
  (ref) => EvolveFormProvider(ref.read),
);
