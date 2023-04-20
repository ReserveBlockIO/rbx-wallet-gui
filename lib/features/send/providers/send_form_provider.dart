import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/transaction_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/guards.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../bridge/models/log_entry.dart';
import '../../bridge/providers/log_provider.dart';
import '../../bridge/services/bridge_service.dart';
import '../../web/utils/raw_transaction.dart';
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
  final Ref ref;

  static const _initial = SendFormModel(
    address: "",
    amount: "",
  );

  final GlobalKey<FormState> formKey = GlobalKey();

  late final TextEditingController amountController;
  late final TextEditingController addressController;

  SendFormProvider(this.ref, [SendFormModel model = _initial]) : super(model) {
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

    if (parsed <= 0) {
      return "The amount has to be a positive value";
    }

    if (kIsWeb) {
      if (ref.read(webSessionProvider).keypair == null) {
        return "No wallet selected";
      }
      final balance = ref.read(webSessionProvider).balance;

      if (balance == null || balance < parsed) {
        return "Not enough balance in wallet.";
      }
    } else {
      final currentWallet = ref.read(sessionProvider).currentWallet;
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
    Wallet? currentWallet;
    if (!kIsWeb) {
      currentWallet = ref.read(sessionProvider).currentWallet;
      if (currentWallet == null) {
        Toast.error("No wallet selected");

        return;
      }

      if (currentWallet.isReserved && currentWallet.isNetworkProtected == false) {
        Toast.error("You must activate your Reserve Account before proceeding.");
        return;
      }

      senderAddress = currentWallet.labelWithoutTruncation;

      if (!guardWalletIsSynced(ref)) return;
      if (!guardWalletIsNotResyncing(ref)) return;

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
        if (amountDouble > currentWallet.balance - ASSURED_AMOUNT_TO_VALIDATE) {
          Toast.error("Insufficent balance since you are validating.");
          return;
        }
      }
    } else {
      if (ref.read(webSessionProvider).keypair == null) {
        Toast.error("No wallet selected");
        return;
      }

      senderAddress = ref.read(webSessionProvider).keypair!.public;
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

    if (!kIsWeb && currentWallet != null) {
      if (currentWallet.isReserved) {
        final password = await PromptModal.show(
          title: "Reserve Account Password",
          validator: (_) => null,
          labelText: "Password",
          lines: 1,
          obscureText: true,
        );
        if (password == null) {
          return;
        }

        final hoursString = await PromptModal.show(
          title: "Timelock Duration",
          validator: (_) => null,
          labelText: "Hours (24 Minimum)",
          initialValue: "24",
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );

        int hours = (hoursString != null ? int.tryParse(hoursString) : 24) ?? 24;
        if (hours < 24) {
          hours = 24;
        }

        state = state.copyWith(isProcessing: true);

        final message = await ReserveAccountService().sendTx(
          fromAddress: currentWallet.address,
          toAddress: address.trim().replaceAll("\n", ""),
          amount: double.parse(amount),
          password: password,
          unlockDelayHours: hours - 24,
        );

        if (message != null) {
          Toast.message("$amount RBX has been sent to $address. See dashboard for TX ID.");
          ref.read(logProvider.notifier).append(
                LogEntry(
                  message: message,
                  textToCopy: message.replaceAll("Success! TX ID: ", ""),
                  variant: AppColorVariant.Success,
                ),
              );
          clear();
        } else {
          state = state.copyWith(isProcessing: false);
        }

        return;
      }
    }

    state = state.copyWith(isProcessing: true);

    if (Env.isWeb) {
      final amountDouble = double.parse(amount);
      final txData = await RawTransaction.generate(
        keypair: ref.read(webSessionProvider).keypair!,
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
          ref.read(globalLoadingProvider.notifier).start();
          final tx = await TransactionService().sendTransaction(
            transactionData: txData,
            execute: true,
          );
          ref.read(globalLoadingProvider.notifier).complete();

          if (tx != null) {
            if (tx['data']['Result'] == "Success") {
              Toast.message("$amount RBX sent to $address");
              clear();
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
          from: ref.read(sessionProvider).currentWallet!.address,
        );
        state = state.copyWith(isProcessing: false);

        if (message != null) {
          Toast.message("$amount RBX has been sent to $address. See dashboard for TX ID.");
          ref.read(logProvider.notifier).append(
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
  return SendFormProvider(ref);
});
