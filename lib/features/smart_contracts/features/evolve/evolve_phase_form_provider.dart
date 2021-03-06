import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/utils/validation.dart';

class EvolvePhaseFormProvider extends StateNotifier<EvolvePhase> {
  final Reader read;
  final int index;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController blockHeightController;
  late final TextEditingController dateController;
  late final TextEditingController timeController;

  EvolvePhaseFormProvider(
    this.read,
    this.index, [
    EvolvePhase model = const EvolvePhase(),
  ]) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);

    blockHeightController =
        TextEditingController(text: "${model.blockHeight ?? '0'}");
    dateController = TextEditingController(text: model.dateLabel);
    timeController = TextEditingController(text: model.timeLabel);
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? descriptionValidator(String? val) =>
      formValidatorNotEmpty(val, "Description");

  String? dateTimeValidator(String? val) {
    if (read(evolveFormProvider).type != EvolveType.time) {
      return null;
    }

    if (val == null || val.isEmpty) {
      return "Required for Date/Time evolution.";
    }

    return null;
  }

  String? blockHeightValidator(String? val) {
    if (read(evolveFormProvider).type != EvolveType.blockHeight) {
      return null;
    }

    if (val == null || val.isEmpty) {
      return "Required for Block Height evolution.";
    }

    final parsed = int.tryParse(val);
    if (parsed == null) {
      return "Invalid value";
    }

    return null;
  }

  void setPhase(EvolvePhase phase) {
    state = phase;
    nameController.text = phase.name;
    descriptionController.text = phase.description;
    blockHeightController.text =
        phase.blockHeight == null ? '' : phase.blockHeight.toString();
  }

  bool save() {
    state = state.copyWith(
      name: nameController.text,
      description: descriptionController.text,
      // expectedValue: valueController.text,
      blockHeight: int.tryParse(blockHeightController.text),
    );

    read(evolveFormProvider.notifier).updatePhase(index, state);
    return true;
  }

  setAsset(Asset? asset) {
    state = state.copyWith(asset: asset);
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
    print('CLEAR');
    nameController.text = "";
    descriptionController.text = "";
    blockHeightController.text = "";
    setAsset(null);
  }
}

final evolvePhaseFormProvider =
    StateNotifierProvider.family<EvolvePhaseFormProvider, EvolvePhase, int>(
  (ref, index) => EvolvePhaseFormProvider(ref.read, index),
);
