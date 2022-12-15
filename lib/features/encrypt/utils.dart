import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/encrypt/providers/password_required_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

Future<bool> passwordRequiredGuard(BuildContext context, WidgetRef ref, [bool prompt = true]) async {
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
    final success = await promptForPassword(context, ref);
    return success;
  }
  return false;
}

Future<bool> promptForPassword(BuildContext context, WidgetRef ref) async {
  final password = await PromptModal.show(
    title: "Unlock Wallet",
    contextOverride: context,
    validator: (value) => formValidatorNotEmpty(value, "Password"),
    labelText: "Password",
    obscureText: true,
    lines: 1,
  );

  if (password != null && password.isNotEmpty) {
    final success = await ref.read(passwordRequiredProvider.notifier).unlock(password);
    if (success) {
      Toast.message("Wallet unlocked for 10 minutes.");
      return true;
    }
  }

  return false;
}
