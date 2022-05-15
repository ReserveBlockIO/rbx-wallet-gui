import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/utils/validation.dart';

class EvolvePhaseFormProvider extends StateNotifier<EvolvePhase> {
  final Reader read;
  final int index;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  // late final TextEditingController valueController;
  late final TextEditingController dateController;
  late final TextEditingController timeController;

  EvolvePhaseFormProvider(
    this.read,
    this.index, [
    EvolvePhase model = const EvolvePhase(),
  ]) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);

    // valueController = TextEditingController(text: model.expectedValue);
    dateController = TextEditingController(text: model.dateLabel);
    timeController = TextEditingController(text: model.timeLabel);
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? descriptionValidator(String? val) =>
      formValidatorNotEmpty(val, "Description");

  void setPhase(EvolvePhase phase) {
    state = phase;
    nameController.text = phase.name;
    descriptionController.text = phase.description;
  }

  bool save() {
    state = state.copyWith(
      name: nameController.text,
      description: descriptionController.text,
      // expectedValue: valueController.text,
    );

    read(evolveFormProvider.notifier).updatePhase(index, state);
    return true;
  }

  updateDate(DateTime date) {
    final existing = state.dateTime;

    final d = existing == null
        ? date
        : DateTime(
            date.year, date.month, date.day, existing.hour, existing.minute);

    state = state.copyWith(dateTime: d);

    dateController.text = state.dateLabel;
  }

  updateTime(TimeOfDay time) {
    final existing = state.dateTime;
    final now = DateTime.now();

    final d = existing == null
        ? DateTime(now.year, now.month, now.day, time.hour, time.minute)
        : DateTime(existing.year, existing.month, existing.day, time.hour,
            time.minute);

    state = state.copyWith(dateTime: d);

    timeController.text = state.timeLabel;
  }

  clear() {
    nameController.text = "";
    descriptionController.text = "";
    // valueController.text = "";
  }
}

final evolvePhaseFormProvider =
    StateNotifierProvider.family<EvolvePhaseFormProvider, EvolvePhase, int>(
  (ref, index) => EvolvePhaseFormProvider(ref.read, index),
);
