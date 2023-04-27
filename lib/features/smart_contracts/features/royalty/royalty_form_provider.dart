import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/generators.dart';
import '../../../../utils/toast.dart';
import '../../../../utils/validation.dart';
import '../../providers/create_smart_contract_provider.dart';
import 'royalty.dart';

class RoyaltyFormProvider extends StateNotifier<Royalty> {
  final Ref ref;
  late final TextEditingController amountController;
  late final TextEditingController addressController;

  RoyaltyFormProvider(
    this.ref, [
    Royalty model = const Royalty(),
  ]) : super(model) {
    amountController = TextEditingController(text: model.amount > 0 ? "${model.amount}" : "");
    addressController = TextEditingController(text: model.address);

    setRoyalty(model);
  }

  setRoyalty(Royalty royalty) {
    state = royalty;

    amountController.text = state.type == RoyaltyType.percent ? "${royalty.amount * 100}" : "${royalty.amount}";
    addressController.text = royalty.address;
  }

  updateType(RoyaltyType type) {
    state = state.copyWith(type: type);
  }

  updateAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  updateAddress(String address) {
    state = state.copyWith(address: address);
  }

  String? amountValidator(String? val) {
    if (state.type == RoyaltyType.percent) {
      return formPercentValidator(val);
    }
    return formValidatorNotEmpty(val, "Amount");
  }

  String? addressValidator(String? val) => formValidatorRbxAddress(val, false);

  complete() {
    double? amount = double.tryParse(amountController.text);
    if (amount == null) {
      Toast.error();
      return;
    }

    if (state.type == RoyaltyType.percent) {
      amount = amount / 100;
    }

    final address = addressController.text.trim();

    state = state.copyWith(amount: amount, address: address);

    ref.read(createSmartContractProvider.notifier).saveRoyalty(state);

    clear();
  }

  clear() {
    final id = uniqueId();
    Future.delayed(Duration(milliseconds: 300), () {
      state = Royalty(id: id);
    });
    amountController.text = "";
    addressController.text = "";
  }
}

final royaltyFormProvider = StateNotifierProvider<RoyaltyFormProvider, Royalty>(
  (ref) => RoyaltyFormProvider(ref),
);
