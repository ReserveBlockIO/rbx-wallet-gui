import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/dialogs.dart';
import '../../core/providers/session_provider.dart';
import '../../utils/toast.dart';
import '../../utils/validation.dart';
import 'providers/password_required_provider.dart';

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
