import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/beacon/models/beacon.dart';
import 'package:rbx_wallet/features/beacon/services/beacon_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class BeaconFormProvider extends StateNotifier<Beacon> {
  final Reader read;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController portController = TextEditingController();

  BeaconFormProvider(this.read, Beacon model) : super(model) {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });

    portController.addListener(() {
      state = state.copyWith(port: int.tryParse(portController.text) ?? 0);
    });
    load(state);
  }

  load(Beacon topic) {
    state = topic;
    nameController.text = topic.name;
    // portController.text = topic.port.toString();
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");

  clear() {
    load(Beacon.empty());
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    read(globalLoadingProvider.notifier).start();
    final error = await BeaconService().create(state.name, state.port);
    read(globalLoadingProvider.notifier).complete();

    if (error != null) {
      OverlayToast.error(error);
      return false;
    }

    clear();

    return true;
  }
}

final beaconFormProvider = StateNotifierProvider<BeaconFormProvider, Beacon>((ref) {
  return BeaconFormProvider(ref.read, Beacon.empty());
});
