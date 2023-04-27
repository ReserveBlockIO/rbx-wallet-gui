import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../global_loader/global_loading_provider.dart';
import '../models/beacon.dart';
import '../services/beacon_service.dart';

class BeaconFormProvider extends StateNotifier<Beacon> {
  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController periodController = TextEditingController();

  BeaconFormProvider(this.ref, Beacon model) : super(model) {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });

    portController.addListener(() {
      state = state.copyWith(port: int.tryParse(portController.text) ?? 0);
    });
    periodController.addListener(() {
      state = state.copyWith(fileCachePeriodDays: int.tryParse(periodController.text) ?? 0);
    });
    load(state);
  }

  load(Beacon beacon) {
    state = beacon;
    nameController.text = beacon.name;
    // portController.text = topic.port.toString();
    periodController.text = beacon.fileCachePeriodDays.toString();
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");

  clear() {
    load(Beacon.empty());
  }

  void setIsPrivate(bool? val) {
    if (val == null) return;
    state = state.copyWith(isBeaconPrivate: val);
  }

  void setAutoDelete(bool? val) {
    if (val == null) return;

    state = state.copyWith(autoDeleteAfterDownload: val);
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();
    final error = await BeaconService().create(
      name: state.name,
      port: state.port,
      autoDelete: state.autoDeleteAfterDownload,
      isPrivate: state.isBeaconPrivate,
      fileCacheDays: state.fileCachePeriodDays,
    );

    ref.read(globalLoadingProvider.notifier).complete();

    if (error != null) {
      OverlayToast.error(error);
      return false;
    }

    clear();

    return true;
  }
}

final beaconFormProvider = StateNotifierProvider<BeaconFormProvider, Beacon>((ref) {
  return BeaconFormProvider(ref, Beacon.empty());
});
