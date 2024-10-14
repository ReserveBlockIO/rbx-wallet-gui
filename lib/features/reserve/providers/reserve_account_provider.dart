import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app.dart';
import 'ra_auto_activate_provider.dart';
import '../../nft/providers/transferred_provider.dart';
import '../../wallet/providers/wallet_detail_provider.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../bridge/models/log_entry.dart';
import '../../bridge/providers/log_provider.dart';
import '../../bridge/services/bridge_service.dart';
import 'pending_activation_provider.dart';
import '../services/reserve_account_service.dart';
import '../../wallet/components/wallet_selector.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../components/balance_indicator.dart';
import 'package:collection/collection.dart';

class ReserveAccountProvider extends StateNotifier<List<Wallet>> {
  final Ref ref;
  Timer? timer;

  ReserveAccountProvider(this.ref, [List<Wallet> model = const []]) : super(model);

  set(List<Wallet> wallets) {
    state = wallets.reversed.toList();
  }

  Future<void> newAccount(BuildContext context) async {
    final password = await PromptModal.show(
      contextOverride: context,
      title: "Setup Vault Account",
      body: "Create a password to continue. You must remember this password as it will be required for any transaction with this Vault Account.",
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
      contextOverride: context,
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

    fundAccount(rootNavigatorKey.currentContext!, account.address);
  }

  Future<void> fundAccount(BuildContext context, String walletAddress) async {
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
              Text("You must now fund your Vault Account with a minimum of 5 VFX. 4 VFX will be burned upon activation."),
              Text(""),
              SelectableText("Please send funds to $walletAddress"),
              Text(""),
              Text(
                  "You have an account with a sufficient balance.\n\nWould you like to send 5 VFX from:\n${fundingWallet.address}\n[Balance: ${fundingWallet.balance} VFX]?"),
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
          body: "Sending:\n$amount VFX\n\nTo:\n$walletAddress\n\nFrom:\n${fundingWallet.address}",
          confirmText: "Send",
          cancelText: "Cancel",
        );

        if (confirmed != true) {
          return;
        }

        final message = await BridgeService().sendFunds(
          amount: amount,
          to: walletAddress.replaceAll("\n", ""),
          from: fundingWallet.address,
        );

        if (message != null) {
          final txHash = message.replaceAll("Success! TxId: ", "");
          ref.read(logProvider.notifier).append(
                LogEntry(message: message, textToCopy: txHash, variant: AppColorVariant.Success),
              );
          await InfoDialog.show(
            contextOverride: context,
            title: "Funds Sent",
            body: "$amount VFX has been sent to $walletAddress.\n\nPlease wait for transaction to reflect and then activate your Vault Account.",
          );
          // Navigator.of(context).pop();

          final confirmed = await ConfirmDialog.show(
            title: "Auto Activate?",
            body: "Would you like to automatically activate this account once the funds are received?",
            confirmText: "Yes",
            cancelText: "No",
          );

          if (confirmed == true) {
            final password = await PromptModal.show(
              contextOverride: context,
              title: "Password",
              validator: (v) => null,
              lines: 1,
              obscureText: true,
              labelText: "Password",
              revealObscure: true,
            );

            if (password != null) {
              ref.read(reserveAccountAutoActivateProvider.notifier).add(txHash, walletAddress, password);
              ref.read(pendingActivationProvider.notifier).addId(walletAddress);
              Toast.message("Auto activate queued.");
            }
          }
        } else {
          Toast.error();
        }
      }
    } else {
      InfoDialog.show(
          contextOverride: context,
          title: "Fund Account",
          content: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You must now fund your Vault Account with a minimum of 5 VFX."),
                Text(""),
                Text("Please send funds to $walletAddress"),
                Divider(),
                AppButton(
                  label: "Copy Address",
                  icon: Icons.copy,
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: walletAddress));
                    Toast.message("Address copied to clipboard.");
                  },
                )
              ],
            ),
          ));
    }
  }

  Future<void> restoreAccount(BuildContext context) async {
    final restoreCode = await PromptModal.show(
      contextOverride: context,
      title: "Restore Code",
      body: "Paste in your RESTORE CODE to import your existing Vault Account.",
      validator: (v) => null,
      labelText: "Restore Code",
    );

    if (restoreCode == null) return;
    final password = await PromptModal.show(
      contextOverride: context,
      title: "Password",
      validator: (v) => null,
      lines: 1,
      obscureText: true,
      labelText: "Password",
      revealObscure: true,
    );
    if (password == null) return;

    final account = await ReserveAccountService().restore(restoreCode: restoreCode, password: password);

    if (account != null) {
      await ref.read(sessionProvider.notifier).loadWallets();

      showDialog(
        context: context,
        builder: (context) {
          return ReserveAccountDetails(account: account);
        },
      );
    }
  }

  Future<void> recoverAccount(BuildContext context, String address) async {
    final recoveryPhrase = await PromptModal.show(
      contextOverride: context,
      title: "Restore Code",
      body: "Paste in your RESTORE CODE to import the recovery account for this Vault Account.",
      validator: (v) => null,
      labelText: "Restore Code",
    );

    if (recoveryPhrase == null || recoveryPhrase.isEmpty) return;

    final password = await PromptModal.show(
      contextOverride: context,
      title: "Password",
      validator: (v) => null,
      lines: 1,
      obscureText: true,
      labelText: "Password",
      revealObscure: true,
    );
    if (password == null || password.isEmpty) return;

    final hash = await ReserveAccountService().recoverAccount(password: password, recoveryPhrase: recoveryPhrase, address: address);

    if (hash != null) {
      final w = ref.read(walletListProvider).firstWhereOrNull((e) => e.address == address);

      if (w != null) {
        ref.read(walletDetailProvider(w).notifier).delete();

        if (ref.read(sessionProvider).currentWallet?.address == address) {
          if (ref.read(walletListProvider).isNotEmpty) {
            ref.read(sessionProvider.notifier).setCurrentWallet(ref.read(walletListProvider).first);
          }
        }
      }

      await ref.read(sessionProvider.notifier).loadWallets();
      ref.read(transferredProvider.notifier).clear();

      RecoverDialog.show(hash: hash);
    }
  }

  void showBalanceInfo(BuildContext context, Wallet wallet) {
    if (wallet.isReserved) {
      InfoDialog.show(
        contextOverride: context,
        title: "Vault Account Balance",
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
        contextOverride: context,
        title: "Account Balance",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BalanceIndicator(
              label: "Available",
              value: wallet.balance,
              bgColor: Colors.white,
              fgColor: Colors.black,
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

  Future<void> activate(
    BuildContext context,
    Wallet wallet,
  ) async {
    if (!wallet.isReserved) {
      Toast.error("Not a Vault Account");
      return;
    }

    if (wallet.availableBalance < 5) {
      Toast.error("A minimum balance of 5 VFX is required to activate.");
      return;
    }

    final confirmed = await ConfirmDialog.show(
      context: context,
      title: "Activate on Network?",
      body: "There is a cost of 4 VFX (which is burned) plus TX fee to activate this Vault Account on the network.  Continue?",
      confirmText: "Activate Now",
      cancelText: "Cancel",
    );

    if (confirmed == true) {
      final password = await PromptModal.show(
        contextOverride: context,
        title: "Password",
        validator: (v) => null,
        lines: 1,
        obscureText: true,
        labelText: "Password",
        revealObscure: true,
      );
      if (password == null) {
        return;
      }
      final success = await ReserveAccountService().publish(
        address: wallet.address,
        password: password,
      );

      if (success) {
        OverlayToast.message(message: 'Vault Account activation transaction sent.\n\nPlease wait for it to reflect as "Activated".');
        // Toast.message("Vault Account publish transaction sent.");
        ref.read(pendingActivationProvider.notifier).addId(wallet.address);
      }
    }
  }
}

final reserveAccountProvider = StateNotifierProvider<ReserveAccountProvider, List<Wallet>>((ref) {
  return ReserveAccountProvider(ref);
});
