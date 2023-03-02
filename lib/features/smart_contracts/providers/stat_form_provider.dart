import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/stat.dart';
import 'create_smart_contract_provider.dart';

class StatFormProvider extends StateNotifier<Stat> {
  final Ref ref;
  final int index;
  late final TextEditingController labelController;
  late final TextEditingController valueController;
  late final TextEditingController descriptionController;

  StatFormProvider(
    this.ref,
    this.index, [
    Stat model = const Stat(),
  ]) : super(model) {
    labelController = TextEditingController(text: model.label);
    valueController = TextEditingController(text: model.value);
    descriptionController = TextEditingController(text: model.description);
  }

  void setStat(Stat stat) {
    state = stat;

    labelController.text = stat.label;
    valueController.text = stat.value;
    descriptionController.text = stat.description;
  }

  void save() {
    state = state.copyWith(
      label: labelController.text,
      value: valueController.text,
      description: descriptionController.text,
    );

    if (index >= ref.read(createSmartContractProvider).stats.length) {
      ref.read(createSmartContractProvider.notifier).addStat(state);
    } else {
      final updatedStats = [...ref.read(createSmartContractProvider).stats];
      updatedStats.removeAt(index);
      updatedStats.insert(index, state);
      ref.read(createSmartContractProvider.notifier).setStats(updatedStats);
    }
  }
}

final statFormProvider = StateNotifierProvider.family<StatFormProvider, Stat, int>(
  (ref, index) => StatFormProvider(ref, index),
);
