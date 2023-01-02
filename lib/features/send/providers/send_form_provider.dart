import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/guards.dart';
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

  static const _initial = SendFormModel(
    address: "",
    amount: "",
  );

  final GlobalKey<FormState> formKey = GlobalKey();

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

    if (kIsWeb) {
      if (read(webSessionProvider).keypair == null) {
        return "No wallet selected";
      }
      final balance = read(webSessionProvider).balance;

      if (balance == null || balance < parsed) {
        return "Not enough balance in wallet.";
      }
    } else {
      final currentWallet = read(sessionProvider).currentWallet;
      if (currentWallet == null) {
        return "No wallet selected";
      }
      if (currentWallet.balance < parsed) {
        return "Not enough balance in wallet.";
      }
    }

    return null;
  }

  String? addressValidator(String? value) {
    if (value == null) {
      return "Address or RBX domain required";
    }

    return formValidatorRbxAddress(value, true);
  }

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
    String senderAddress = "";
    if (!kIsWeb) {
      final currentWallet = read(sessionProvider).currentWallet;
      if (currentWallet == null) {
        Toast.error("No wallet selected");

        return;
      }
      senderAddress = currentWallet.labelWithoutTruncation;

      if (!guardWalletIsSynced(read)) return;
      if (!guardWalletIsNotResyncing(read)) return;

      final addressIsValid = await BridgeService().validateSendToAddress(address.trim().replaceAll("\n", ""));

      if (!addressIsValid) {
        Toast.error("Invalid Address");
        return;
      }

      final amountDouble = double.tryParse(amount);
      if (amountDouble == null) {
        Toast.error("Invalid amount");
        return;
      }

      if (amountDouble > currentWallet.balance) {
        Toast.error("Insufficent balance to send");
        return;
      }

      if (currentWallet.isValidating) {
        if (amountDouble > currentWallet.balance - 1000) {
          Toast.error("Insufficent balance since you are validating.");
          return;
        }
      }
    } else {
      if (read(webSessionProvider).keypair == null) {
        Toast.error("No wallet selected");
        return;
      }

      senderAddress = read(webSessionProvider).keypair!.public;
    }

    final confirmed = await ConfirmDialog.show(
      title: "Please Confirm",
      body: "Sending:\n$amount RBX\n\nTo:\n$address\n\nFrom:\n$senderAddress",
      confirmText: "Send",
      cancelText: "Cancel",
    );

    if (!confirmed) {
      return;
    }

    state = state.copyWith(isProcessing: true);

    if (Env.isWeb) {
      final amountDouble = double.parse(amount);
      final txData = await RawTransaction.generate(
        keypair: read(webSessionProvider).keypair!,
        amount: amountDouble,
        toAddress: address,
      );

      state = state.copyWith(isProcessing: false);

      if (txData != null) {
        final txFee = txData['Fee'];

        final confirmed = await ConfirmDialog.show(
          title: "Valid Transaction",
          body:
              "This transaction is valid and is ready to send.\nAre you sure you want to proceed?\n\nTo:$address\n\nAmount:$amountDouble RBX${txFee != null ? '\nTX Fee: $txFee RBX\nTotal:${amountDouble + txFee} RBX' : ''}",
          confirmText: "Send",
          cancelText: "Cancel",
        );

        if (confirmed == true) {
          final tx = await TransactionService().sendTransaction(
            transactionData: txData,
            execute: true,
          );

          if (tx != null) {
            if (tx['data']['Result'] == "Success") {
              Toast.message("$amount RBX sent to $address");
              state = const SendFormModel(
                address: "",
                amount: "",
              );
              return;
            }
          }

          Toast.error();
        }
      }
    } else {
      try {
        final message = await BridgeService().sendFunds(
          amount: double.parse(amount),
          to: address.trim().replaceAll("\n", ""),
          from: read(sessionProvider).currentWallet!.address,
        );
        state = state.copyWith(isProcessing: false);

        if (message != null) {
          Toast.message("$amount RBX has been sent to $address. See dashboard for TX ID.");
          read(logProvider.notifier).append(
            LogEntry(message: message, textToCopy: message.replaceAll("Success! TxId: ", ""), variant: AppColorVariant.Success),
          );
          clear();
        }
      } catch (e) {
        print(e);
        Toast.error();
        state = state.copyWith(isProcessing: false);
      }
    }
  }
}

final sendFormProvider = StateNotifierProvider<SendFormProvider, SendFormModel>((ref) {
  return SendFormProvider(ref.read);
});
