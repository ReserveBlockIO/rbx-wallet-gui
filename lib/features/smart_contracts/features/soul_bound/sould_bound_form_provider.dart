import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/soul_bound/soul_bound.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/utils/generators.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class SoulBoundFormProvider extends StateNotifier<SoulBound> {
  final Reader read;
  late final TextEditingController ownerAddressController;
  late final TextEditingController beneficiaryAddressController;

  SoulBoundFormProvider(
    this.read, [
    SoulBound model = const SoulBound(),
  ]) : super(model) {
    ownerAddressController = TextEditingController(text: model.ownerAddress);
    beneficiaryAddressController = TextEditingController(text: model.beneficiaryAddress ?? "");

    setSoulBound(model);
  }

  String? ownerAddressValidator(value) => formValidatorRbxAddress(value);
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
    read(createSmartContractProvider.notifier).saveSoulBound(state);

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
  (ref) => SoulBoundFormProvider(ref.read),
);
