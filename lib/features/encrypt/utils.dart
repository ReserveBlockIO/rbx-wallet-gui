import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/encrypt/providers/password_required_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

Future<bool> passwordRequiredGuard(
  BuildContext context,
  WidgetRef ref, [
  bool prompt = true,
  bool forValidating = false,
]) async {
  if (kIsWeb) {
    return true;
  }
  if (!ref.read(passwordRequiredProvider)) {
    return true;
  }

  final required = await ref.read(passwordRequiredProvider.notifier).check();
  if (!required) {
    return true;
  }

  if (prompt) {
    final success = await promptForPassword(context, ref, forValidating);
    if (success == null) {
      return false;
    }

    if (forValidating) {
      //TODO: Might have to do something here differently.
    }

    await ref.read(sessionProvider.notifier).loadWallets();

    if (success == false) {
      Toast.error("Incorrect decryption password.");
      return false;
    }
    return true;
  }
  return false;
}

Future<bool?> promptForPassword(BuildContext context, WidgetRef ref, [bool forValidating = false]) async {
  final password = await PromptModal.show(
    title: "Unlock Wallet",
    contextOverride: context,
    validator: (value) => formValidatorNotEmpty(value, "Password"),
    labelText: "Password",
    obscureText: true,
    lines: 1,
    tightPadding: true,
  );
  if (password == null) {
    return null;
  }

  if (password.isNotEmpty) {
    final success = await ref.read(passwordRequiredProvider.notifier).unlock(password);
    if (success) {
      if (forValidating) {
        Toast.message("Wallet unlocked.");
      } else {
        Toast.message("Wallet unlocked for 10 minutes.");
      }
      return true;
    }
  }

  return false;
}
