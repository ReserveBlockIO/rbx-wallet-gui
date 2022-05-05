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

  EvolvePhaseFormProvider(
    this.read,
    this.index, [
    EvolvePhase model = const EvolvePhase(),
  ]) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
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
    );

    read(evolveFormProvider.notifier).updatePhase(index, state);
    return true;
  }

  clear() {
    nameController.text = "";
    descriptionController.text = "";
  }
}

final evolvePhaseFormProvider =
    StateNotifierProvider.family<EvolvePhaseFormProvider, EvolvePhase, int>(
  (ref, index) => EvolvePhaseFormProvider(ref.read, index),
);
