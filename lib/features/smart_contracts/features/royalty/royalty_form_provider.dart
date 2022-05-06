import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_sc_provider.dart';
import 'package:rbx_wallet/utils/generators.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class RoyaltyFormProvider extends StateNotifier<Royalty> {
  final Reader read;
  late final TextEditingController amountController;
  late final TextEditingController addressController;

  RoyaltyFormProvider(
    this.read, [
    Royalty model = const Royalty(),
  ]) : super(model) {
    amountController =
        TextEditingController(text: model.amount > 0 ? "${model.amount}" : "");
    addressController = TextEditingController(text: model.address);

    setRoyalty(model);
  }

  setRoyalty(Royalty royalty) {
    state = royalty;

    amountController.text = state.type == RoyaltyType.percent
        ? "${royalty.amount * 100}"
        : "${royalty.amount}";
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

  String? addressValidator(String? val) => formValidatorRbxAddress(val);

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

    read(createScProvider.notifier).saveRoyalty(state);

    clear();
  }

  clear() {
    final id = uniqueId();
    state = Royalty(id: id);
    amountController.text = "";
    addressController.text = "";
  }
}

final royaltyFormProvider = StateNotifierProvider<RoyaltyFormProvider, Royalty>(
  (ref) => RoyaltyFormProvider(ref.read),
);
