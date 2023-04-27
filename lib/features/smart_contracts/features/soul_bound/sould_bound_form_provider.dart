import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/generators.dart';
import '../../../../utils/validation.dart';
import '../../providers/create_smart_contract_provider.dart';
import 'soul_bound.dart';

class SoulBoundFormProvider extends StateNotifier<SoulBound> {
  final Ref ref;
  late final TextEditingController ownerAddressController;
  late final TextEditingController beneficiaryAddressController;

  SoulBoundFormProvider(
    this.ref, [
    SoulBound model = const SoulBound(),
  ]) : super(model) {
    ownerAddressController = TextEditingController(text: model.ownerAddress);
    beneficiaryAddressController = TextEditingController(text: model.beneficiaryAddress ?? "");

    setSoulBound(model);
  }

  String? ownerAddressValidator(value) => formValidatorRbxAddress(value, false);
  String? beneficiaryAddressValidator(value) => formValidatorRbxAddressOrEmpty(value);

  setSoulBound(SoulBound sb) {
    state = sb;

    ownerAddressController.text = sb.ownerAddress;
    beneficiaryAddressController.text = sb.beneficiaryAddress ?? "";
  }

  complete() {
    final ownerAddress = ownerAddressController.text.trim();
    final beneficaryAddress = beneficiaryAddressController.text.trim();

    state = state.copyWith(ownerAddress: ownerAddress, beneficiaryAddress: beneficaryAddress == "" ? null : beneficaryAddress);
    ref.read(createSmartContractProvider.notifier).saveSoulBound(state);

    clear();
  }

  clear() {
    final id = uniqueId();
    state = SoulBound(id: id);
    ownerAddressController.text = "";
    beneficiaryAddressController.text = "";
  }
}

final soulBoundFormProvider = StateNotifierProvider<SoulBoundFormProvider, SoulBound>(
  (ref) => SoulBoundFormProvider(ref),
);
