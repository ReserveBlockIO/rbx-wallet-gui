import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
// import 'package:rbx_wallet/features/wallet/models/wallet.dart';

class SendFormModel {
  final String amount;
  final String address;
  // final Wallet? wallet;
  final bool isProcessing;

  const SendFormModel({
    this.amount = "",
    this.address = "",
    // this.wallet,
    this.isProcessing = false,
  });

  SendFormModel copyWith({
    String? amount,
    String? address,
    // Wallet? wallet,
    bool? isProcessing,
  }) {
    return SendFormModel(
      amount: amount ?? this.amount,
      address: address ?? this.address,
      // wallet: wallet ?? this.wallet,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }
}

class SendFormProvider extends StateNotifier<SendFormModel> {
  final Reader read;

  static const _initial = SendFormModel();

  late final TextEditingController amountController;
  late final TextEditingController addressController;

  SendFormProvider(this.read, [SendFormModel model = _initial]) : super(model) {
    amountController = TextEditingController(text: model.amount);
    addressController = TextEditingController(text: model.address);

    amountController.addListener(_updateState);
    addressController.addListener(_updateState);
  }

  String get amount => amountController.value.text;
  String get address => addressController.value.text;

  String? amountValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Amount required";
    }

    double parsed = 0;
    try {
      parsed = double.parse(value);
    } catch (e) {
      return "Not a valid amount";
    }

    if (parsed < 1) {
      return "Minimum to send is 1 RBX";
    }

    final currentWallet = read(sessionProvider).currentWallet;
    if (currentWallet == null) {
      return "No wallet selected";
    }
    if (currentWallet.balance < parsed) {
      return "Not enough balance in wallet.";
    }

    return null;
  }

  String? addressValidator(String? value) =>
      formValidatorNotEmpty(value, "Address");

  void _updateState() {
    state = state.copyWith(
      amount: amountController.value.text,
      address: amountController.value.text,
    );
  }

  // void setWallet(Wallet wallet) {
  //   state = state.copyWith(wallet: wallet);
  // }

  void clear() {
    addressController.text = "";
    amountController.text = "";

    state = state.copyWith(
      amount: "",
      address: "",
      isProcessing: false,
    );
  }

  Future<void> submit() async {
    final currentWallet = read(sessionProvider).currentWallet;
    if (currentWallet == null) {
      Toast.error("No wallet selected");

      return;
    }

    final confirmed = await ConfirmDialog.show(
      title: "Please Confirm",
      body:
          "Sending:\n$amount RBX\n\nTo:\n$address\n\nFrom:\n${currentWallet.labelWithoutTruncation}",
      confirmText: "Send",
      cancelText: "Cancel",
    );

    if (!confirmed) {
      return;
    }

    state = state.copyWith(isProcessing: true);

    await Future.delayed(Duration(seconds: 3));

    Toast.message("$amount RBX has been sent to $address");
    clear();
  }
}

final sendFormProvider =
    StateNotifierProvider<SendFormProvider, SendFormModel>((ref) {
  return SendFormProvider(ref.read);
});
