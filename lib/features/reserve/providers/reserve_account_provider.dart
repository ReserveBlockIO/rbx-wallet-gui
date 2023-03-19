import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/reserve/models/new_reserve_account.dart';
import 'package:rbx_wallet/features/reserve/providers/pending_activation_provider.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import '../components/balance_indicator.dart';

class ReserveAccountProvider extends StateNotifier<List<Wallet>> {
  final Ref ref;
  Timer? timer;

  ReserveAccountProvider(this.ref, [List<Wallet> model = const []]) : super(model);

  set(List<Wallet> wallets) {
    state = wallets.reversed.toList();
  }

  Future<void> newAccount(BuildContext context) async {
    final password = await PromptModal.show(
      title: "Setup Reserve Account",
      body: "Create a password to continue. You must remember this password as it will be required for any transaction with this Reserve Account.",
      validator: (value) => formValidatorNotEmpty(value, "Password"),
      labelText: "Password",
      obscureText: true,
      lines: 1,
      revealObscure: true,
    );

    if (password == null || password.isEmpty) {
      return;
    }

    final passwordConfirmation = await PromptModal.show(
      title: "Confirm Password",
      body: "Please confirm your password.",
      validator: (value) => formValidatorNotEmpty(value, "Password"),
      labelText: "Password",
      obscureText: true,
      lines: 1,
      revealObscure: true,
    );

    if (passwordConfirmation == null) {
      Toast.error("You must confirm your password.");
      return;
    }

    if (password != passwordConfirmation) {
      Toast.error("Passwords do not match.");
      return;
    }

    final account = await ReserveAccountService().create(password);

    if (account == null) {
      return;
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ReserveAccountDetails(account: account);
      },
    );

    fundAccount(context, account);
  }

  Future<void> fundAccount(BuildContext context, NewReserveAccount wallet) async {
    final funders = ref.read(walletListProvider).where((w) => !w.isReserved && w.balance > (w.isValidating ? 1006 : 6)).toList();
    final fundingWallet = funders.isNotEmpty ? funders.first : null;

    if (fundingWallet != null) {
      final shouldSendFunds = await ConfirmDialog.show(
        title: "Fund Account",
        content: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("You must now fund your Reserve Account with a minimum of 5 RBX. 4 RBX will be burned upon activation."),
              Text(""),
              SelectableText("Please send funds to ${wallet.address}"),
              Text(""),
              Text(
                  "You have a wallet with a sufficient balance.\n\nWould you like to send 5 RBX from:\n${fundingWallet.address}\n[Balance: ${fundingWallet.balance} RBX]?"),
            ],
          ),
        ),
        confirmText: "Send",
        cancelText: "Cancel",
      );

      if (shouldSendFunds == true) {
        const amount = 5.0;

        final confirmed = await ConfirmDialog.show(
          title: "Please Confirm",
          body: "Sending:\n$amount RBX\n\nTo:\n${wallet.address}\n\nFrom:\n${fundingWallet.address}",
          confirmText: "Send",
          cancelText: "Cancel",
        );

        if (confirmed != true) {
          return;
        }

        final message = await BridgeService().sendFunds(
          amount: amount,
          to: wallet.address.trim().replaceAll("\n", ""),
          from: fundingWallet.address,
        );

        if (message != null) {
          ref.read(logProvider.notifier).append(
                LogEntry(message: message, textToCopy: message.replaceAll("Success! TxId: ", ""), variant: AppColorVariant.Success),
              );
          await InfoDialog.show(
            title: "Funds Sent",
            body: "$amount RBX has been sent to ${wallet.address}.\n\nPlease wait for transaction to reflect and then activate your Reserve Account.",
          );
          // Navigator.of(context).pop();
        } else {
          Toast.error();
        }
      }
    } else {
      InfoDialog.show(
          title: "Fund Account",
          content: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You must now fund your Reserve Account with a minimum of 5 RBX."),
                Text(""),
                Text("Please send funds to ${wallet.address}"),
                Divider(),
                AppButton(
                  label: "Copy Address",
                  icon: Icons.copy,
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: wallet.address));
                    Toast.message("Address copied to clipboard.");
                  },
                )
              ],
            ),
          ));
    }
  }

  Future<void> recoverAccount(BuildContext context) async {
    final restoreCode = await PromptModal.show(
        title: "Restore Code",
        body: "Paste in your RESTORE CODE to import your existing Reserve Account.",
        validator: (v) => null,
        labelText: "Restore Code");
    if (restoreCode == null) return;
    final password = await PromptModal.show(title: "Password", validator: (v) => null, lines: 1, obscureText: true, labelText: "Password");
    if (password == null) return;

    final account = await ReserveAccountService().recover(restoreCode: restoreCode, password: password);
    if (account != null) {
      await ref.read(sessionProvider.notifier).loadWallets();

      showDialog(
          context: context,
          builder: (context) {
            return ReserveAccountDetails(account: account);
          });
    }
  }

  void showBalanceInfo(Wallet wallet) {
    if (wallet.isReserved) {
      InfoDialog.show(
        title: "Reserve Account Balance",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BalanceIndicator(
              label: "Available",
              value: wallet.availableBalance,
              bgColor: Colors.deepPurple.shade400,
              fgColor: Colors.white,
            ),
            BalanceIndicator(
              label: "Locked",
              value: wallet.lockedBalance,
              bgColor: Colors.red.shade700,
              fgColor: Colors.white,
            ),
            BalanceIndicator(
              label: "Total",
              value: wallet.totalBalance,
              bgColor: Colors.green.shade700,
              fgColor: Colors.white,
            ),
          ],
        ),
      );
    } else {
      InfoDialog.show(
        title: "Account Balance",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BalanceIndicator(
              label: "Available",
              value: wallet.balance,
              bgColor: Colors.deepPurple.shade400,
              fgColor: Colors.white,
            ),
            BalanceIndicator(
              label: "Locked",
              value: wallet.lockedBalance,
              bgColor: Colors.red.shade700,
              fgColor: Colors.white,
            ),
            BalanceIndicator(
              label: "Total",
              value: wallet.balance + wallet.lockedBalance,
              bgColor: Colors.green.shade700,
              fgColor: Colors.white,
            ),
          ],
        ),
      );
    }
  }

  Future<void> activate(Wallet wallet) async {
    if (!wallet.isReserved) {
      Toast.error("Not a reserve account");
      return;
    }

    if (wallet.availableBalance == null) {
      return;
    }

    if (wallet.availableBalance! < 5) {
      Toast.error("A minimum balance of 5 RBX is required to activate.");
      return;
    }

    final confirmed = await ConfirmDialog.show(
      title: "Activate on Network?",
      body: "There is a cost of 4 RBX (which is burned) plus TX fee to activate this Reserve Account on the network.  Continue?",
      confirmText: "Activate Now",
      cancelText: "Cancel",
    );

    if (confirmed == true) {
      final password = await PromptModal.show(
        title: "Password",
        validator: (v) => null,
        lines: 1,
        obscureText: true,
        labelText: "Password",
      );
      if (password == null) {
        return;
      }
      final success = await ReserveAccountService().publish(
        address: wallet.address,
        password: password,
      );

      if (success) {
        OverlayToast.message(message: 'Reserve Account activation transaction sent.\n\nPlease wait for it to reflect as "Activated".');
        // Toast.message("Reserve Account publish transaction sent.");
        ref.read(pendingActivationProvider.notifier).addId(wallet.address);
      }
    }
  }
}

final reserveAccountProvider = StateNotifierProvider<ReserveAccountProvider, List<Wallet>>((ref) {
  return ReserveAccountProvider(ref);
});
