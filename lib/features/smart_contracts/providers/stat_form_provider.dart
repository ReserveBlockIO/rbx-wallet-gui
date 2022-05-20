import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';

class StatFormProvider extends StateNotifier<Stat> {
  final Reader read;
  final int index;
  late final TextEditingController labelController;
  late final TextEditingController valueController;
  late final TextEditingController descriptionController;

  StatFormProvider(
    this.read,
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

    if (index >= read(createSmartContractProvider).stats.length) {
      read(createSmartContractProvider.notifier).addStat(state);
    } else {
      final updatedStats = [...read(createSmartContractProvider).stats];
      updatedStats.removeAt(index);
      updatedStats.insert(index, state);
      read(createSmartContractProvider.notifier).setStats(updatedStats);
    }
  }
}

final statFormProvider =
    StateNotifierProvider.family<StatFormProvider, Stat, int>(
  (ref, index) => StatFormProvider(ref.read, index),
);
