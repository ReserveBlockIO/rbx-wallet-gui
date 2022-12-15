import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/encrypt/providers/password_required_provider.dart';
import 'package:rbx_wallet/features/encrypt/providers/wallet_is_encrypted_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class EncryptWalletButton extends BaseComponent {
  const EncryptWalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(walletIsEncryptedProvider)) {
      if (ref.watch(passwordRequiredProvider)) {
        return AppButton(
          label: "Unlock Wallet",
          onPressed: () async {
            final password = await PromptModal.show(
              title: "Unlock Wallet",
              validator: (value) => formValidatorNotEmpty(value, "Password"),
              labelText: "Password",
              obscureText: true,
              lines: 1,
            );

            if (password != null && password.isNotEmpty) {
              final success = await ref.read(passwordRequiredProvider.notifier).unlock(password);
              if (success) {
                Toast.message("Wallet unlocked for 10 minutes.");
              }
            }
          },
        );
      }

      return AppButton(
        label: "Lock Wallet",
        onPressed: () {},
      );
    }

    return AppButton(
      label: "Encrypt Wallet",
      onPressed: () async {
        final password = await PromptModal.show(
          title: "Encrypt Wallet",
          validator: (value) => formValidatorNotEmpty(value, "Password"),
          labelText: "Password",
          obscureText: true,
          lines: 1,
          body:
              "This function will encrypt your private keys.\nPlease ensure your they are backed up before proceeding.\n\nThis is an irreversable action and your password will be required to interact with the wallet moving forward.",
        );

        if (password != null && password.isNotEmpty) {
          final confirmedPassword = await PromptModal.show(
            title: "Confirm Password",
            validator: (value) => formValidatorNotEmpty(value, "Password"),
            labelText: "Password",
            obscureText: true,
            lines: 1,
            body: "Please confirm your encryption password.",
          );

          if (confirmedPassword != null && confirmedPassword.isNotEmpty) {
            if (password != confirmedPassword) {
              Toast.error("Your passwords do not match. Please try again.");
              return;
            }
          }

          ref.read(globalLoadingProvider.notifier).start();
          final success = await BridgeService().encryptWallet(password);
          ref.read(globalLoadingProvider.notifier).complete();

          if (success) {
            Toast.message("Wallet is now encrypted");
          } else {
            Toast.error();
          }
        }
      },
    );
  }
}
