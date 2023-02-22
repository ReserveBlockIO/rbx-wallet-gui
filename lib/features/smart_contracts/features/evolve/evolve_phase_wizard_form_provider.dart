import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/toast.dart';
import '../../../../utils/validation.dart';
import '../../../asset/asset.dart';
import '../../../bridge/providers/wallet_info_provider.dart';
import 'evolve.dart';
import 'evolve_phase.dart';

class EvolvePhaseWizardFormProvider extends StateNotifier<EvolvePhase> {
  final Reader read;
  final int index;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController blockHeightController;
  late final TextEditingController dateController;
  late final TextEditingController timeController;

  EvolvePhaseWizardFormProvider(
    this.read,
    this.index, [
    EvolvePhase model = const EvolvePhase(),
  ]) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);

    blockHeightController = TextEditingController(text: "${model.blockHeight ?? '0'}");
    dateController = TextEditingController(text: model.dateLabel);
    timeController = TextEditingController(text: model.timeLabel);
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? descriptionValidator(String? val) => formValidatorNotEmpty(val, "Description");

  String? dateTimeValidator(String? val, EvolveType type) {
    if (type != EvolveType.time) {
      return null;
    }

    if (val == null || val.isEmpty) {
      return "Required for Date/Time evolution.";
    }

    return null;
  }

  String? blockHeightValidator(String? val, EvolveType type) {
    if (type != EvolveType.blockHeight) {
      return null;
    }

    if (val == null || val.isEmpty) {
      return "Required for Block Height evolution.";
    }

    final parsed = int.tryParse(val);
    if (parsed == null) {
      return "Invalid value";
    }

    if (read(walletInfoProvider) == null) {
      return "Error";
    }

    final currentBh = read(walletInfoProvider)!.blockHeight;

    if (parsed <= currentBh) {
      return "Block height must be greater than $currentBh.";
    }

    return null;
  }

  void setPhase(EvolvePhase phase) {
    state = phase;
    nameController.text = phase.name;
    descriptionController.text = phase.description;
    blockHeightController.text = phase.blockHeight == null ? '' : phase.blockHeight.toString();
  }

  setAsset(Asset? asset) {
    state = state.copyWith(asset: asset);
  }

  updateDate(DateTime date) {
    final existing = state.dateTime;

    final d = existing == null ? date : DateTime(date.year, date.month, date.day, existing.hour, existing.minute);

    if (d.isBefore(DateTime.now())) {
      OverlayToast.error("Date must be in the future.");

      return;
    }

    state = state.copyWith(dateTime: d);

    dateController.text = state.dateLabel;
  }

  updateTime(TimeOfDay time) {
    final existing = state.dateTime;
    final now = DateTime.now();

    final d = existing == null
        ? DateTime(now.year, now.month, now.day, time.hour, time.minute)
        : DateTime(existing.year, existing.month, existing.day, time.hour, time.minute);

    if (d.isBefore(DateTime.now())) {
      OverlayToast.error("Time must be in the future.");
      return;
    }

    state = state.copyWith(dateTime: d);

    timeController.text = state.timeLabel;
  }

  clear() {
    nameController.text = "";
    descriptionController.text = "";
    blockHeightController.text = "";
    dateController.text = "";
    timeController.text = "";
    blockHeightController.text = "";
    setAsset(null);
  }

  generateEvolvePhase() {
    if (state.asset == null) {
      OverlayToast.error("Asset is required");
      return;
    }

    return EvolvePhase(
      name: nameController.text,
      description: descriptionController.text,
      asset: state.asset,
    );
  }
}

final evolvePhaseWizardFormProvider = StateNotifierProvider.family<EvolvePhaseWizardFormProvider, EvolvePhase, int>(
  (ref, index) => EvolvePhaseWizardFormProvider(ref.read, index),
);
