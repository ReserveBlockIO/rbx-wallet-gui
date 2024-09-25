import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/core/utils.dart';

import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class FaucetFormstate {
  final String verificationUuid;
  final double amount;
  final String phone;

  FaucetFormstate({required this.verificationUuid, required this.amount, required this.phone});

  factory FaucetFormstate.empty() {
    return FaucetFormstate(
      verificationUuid: '',
      amount: 5,
      phone: '',
    );
  }

  FaucetFormstate requestCompleted(String uuid) {
    return FaucetFormstate(
      verificationUuid: uuid,
      amount: amount,
      phone: phone,
    );
  }
}

class FaucetFormProvider extends StateNotifier<FaucetFormstate> {
  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> verificationFormKey = GlobalKey();

  late final TextEditingController amountController;
  late final TextEditingController phoneController;
  late final TextEditingController verificationController;

  FaucetFormProvider(this.ref, FaucetFormstate model) : super(model) {
    amountController = TextEditingController(text: model.amount.toString());
    phoneController = TextEditingController(text: model.phone);
    verificationController = TextEditingController();
  }

  String? amountValidator(String? val) => formValidatorNumber(val, "Amount");
  String? phoneValidator(String? val) => formValidatorPhoneNumber(val);
  String? verificationValidator(String? val) => formValidatorNumber(val, "Verification Code");

  load(FaucetFormstate model) {
    state = model;
    amountController.text = model.amount.toString();
    phoneController.text = model.phone;
    verificationController.text = '';
  }

  clear() {
    load(FaucetFormstate.empty());
  }

  Future<bool?> submitRequest() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    final currentWallet = ref.read(sessionProvider).currentWallet;

    if (currentWallet == null) {
      Toast.error("No Account Selected");
      return null;
    }

    final cleanPhone = cleanPhoneNumber(phoneController.text);
    if (cleanPhone == null) {
      Toast.error("Invalid Phone Number");
      return false;
    }

    final parsedAmount = double.tryParse(amountController.text);

    if (parsedAmount == null) {
      Toast.error("Invalid Amount");
      return false;
    }

    try {
      final result = await ExplorerService().faucetRequest(cleanPhone, parsedAmount, currentWallet.address);

      state = state.requestCompleted(result);
      return true;
    } catch (e) {
      Toast.error(e.toString());
      return false;
    }
  }

  Future<bool?> submitVerification() async {
    if (!verificationFormKey.currentState!.validate()) {
      return null;
    }

    try {
      final result = await ExplorerService().faucetVerify(
        state.verificationUuid,
        verificationController.text.trim(),
      );
      clear();

      Toast.message("Success! Funds are on their way. TX Hash: $result");
      return true;
    } catch (e) {
      Toast.error(e.toString());
      return false;
    }
  }
}

final faucetFormProvider = StateNotifierProvider<FaucetFormProvider, FaucetFormstate>(
  (ref) => FaucetFormProvider(ref, FaucetFormstate.empty()),
);
