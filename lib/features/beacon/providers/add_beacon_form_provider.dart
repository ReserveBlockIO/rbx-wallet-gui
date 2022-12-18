import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/beacon/models/beacon.dart';
import 'package:rbx_wallet/features/beacon/services/beacon_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class AddBeaconFormProvider extends StateNotifier<Beacon> {
  final Reader read;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();

  AddBeaconFormProvider(this.read, Beacon model) : super(model) {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });

    ipController.addListener(() {
      state = state.copyWith(ipAddress: ipController.text);
    });

    portController.addListener(() {
      state = state.copyWith(port: int.tryParse(portController.text) ?? 0);
    });

    load(state);
  }

  load(Beacon beacon) {
    state = beacon;
    nameController.text = beacon.name;
    ipController.text = beacon.ipAddress;
    // portController.text = beacon.port.toString();
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? ipAddressValidator(String? val) => formValidatorNotEmpty(val, "IP Address");

  clear() {
    load(Beacon.empty());
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    read(globalLoadingProvider.notifier).start();

    final error = await BeaconService().add(state.name, state.ipAddress, state.port);
    read(globalLoadingProvider.notifier).complete();

    if (error != null) {
      OverlayToast.error(error);
      return false;
    }

    clear();

    return true;
  }
}

final addBeaconFormProvider = StateNotifierProvider<AddBeaconFormProvider, Beacon>((ref) {
  return AddBeaconFormProvider(ref.read, Beacon.empty());
});
