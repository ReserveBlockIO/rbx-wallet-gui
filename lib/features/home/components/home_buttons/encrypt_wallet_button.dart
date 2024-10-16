import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../utils/toast.dart';
import '../../../../utils/validation.dart';
import '../../../bridge/services/bridge_service.dart';
import '../../../global_loader/global_loading_provider.dart';
import '../../../validator/providers/current_validator_provider.dart';
import '../../../wallet/providers/wallet_list_provider.dart';
import '../../../encrypt/providers/password_required_provider.dart';
import '../../../encrypt/providers/wallet_is_encrypted_provider.dart';

class EncryptWalletButton extends BaseComponent {
  const EncryptWalletButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (ref.watch(walletListProvider).isEmpty) {
    //   return SizedBox.shrink();
    // }

    if (ref.watch(walletIsEncryptedProvider)) {
      if (ref.watch(passwordRequiredProvider)) {
        return AppButton(
          icon: Icons.lock_open_rounded,
          label: "Unlock Wallet",
          onPressed: !ref.watch(sessionProvider.select((v) => v.cliStarted))
              ? null
              : () async {
                  final password = await PromptModal.show(
                    title: "Unlock Wallet",
                    validator: (value) => formValidatorNotEmpty(value, "Password"),
                    labelText: "Password",
                    obscureText: true,
                    revealObscure: true,
                    lines: 1,
                  );

                  if (password != null && password.isNotEmpty) {
                    final success = await ref.read(passwordRequiredProvider.notifier).unlock(password);
                    await ref.read(sessionProvider.notifier).loadWallets();

                    if (success) {
                      if (ref.watch(currentValidatorProvider)?.isValidating == true) {
                        Toast.message("Wallet has been unlocked.");
                      } else {
                        Toast.message("Wallet has been unlocked for 10 minutes.");
                      }
                    } else {
                      Toast.error("Incorrect decryption password.");
                    }
                  }
                },
        );
      }

      return AppButton(
        label: "Lock Wallet",
        icon: Icons.lock,
        onPressed: !ref.watch(sessionProvider.select((v) => v.cliStarted))
            ? null
            : () async {
                if (ref.read(currentValidatorProvider)?.isValidating == true) {
                  Toast.error("You can not lock your wallet while validating.");
                  return;
                }
                final success = await ref.read(passwordRequiredProvider.notifier).lock();

                if (success) {
                  Toast.message("Your wallet is now locked.");
                } else {
                  Toast.error();
                }
              },
      );
    }

    return AppButton(
      label: "Encrypt Wallet",
      icon: Icons.lock,
      onPressed: !ref.watch(sessionProvider.select((v) => v.cliStarted))
          ? null
          : () async {
              if (ref.read(walletListProvider).isEmpty) {
                Toast.error("No keys to encrypt.");
                return;
              }

              final password = await PromptModal.show(
                title: "Encrypt Wallet",
                validator: (value) => formValidatorNotEmpty(value, "Password"),
                labelText: "Create Password",
                obscureText: true,
                revealObscure: true,
                lines: 1,
                body:
                    "This function will encrypt ALL private keys in this wallet. Please ensure you have ALL private keys in this wallet backed up before proceeding.\n\nThis is an irreversible action and the password that you create will be the only way to gain access to this wallet once you complete this encryption.\n\nIt is also recommended to backup your password in addition to your private keys.",
                confirmText: "Agree",
                cancelText: "Cancel",
              );

              if (password != null && password.isNotEmpty) {
                final confirmedPassword = await PromptModal.show(
                  title: "Confirm Password",
                  validator: (value) => formValidatorNotEmpty(value, "Password"),
                  labelText: "Password",
                  obscureText: true,
                  revealObscure: true,
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
                final error = await BridgeService().encryptWallet(password);
                ref.read(globalLoadingProvider.notifier).complete();

                if (error != null) {
                  Toast.error(error);
                } else {
                  Toast.message("Your wallet is now encrypted.");
                  ref.read(walletIsEncryptedProvider.notifier).set(true);
                }
              }
            },
    );
  }
}
