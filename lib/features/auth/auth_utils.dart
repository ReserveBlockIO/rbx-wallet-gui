import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/keygen/services/keygen_service.dart'
    if (dart.library.io) 'package:rbx_wallet/features/keygen/services/keygen_service_mock.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

import '../../core/breakpoints.dart';
import '../../core/components/buttons.dart';
import '../../core/dialogs.dart';
import '../../core/providers/web_session_provider.dart';
import '../../core/web_router.gr.dart';
import '../global_loader/global_loading_provider.dart';
import '../keygen/models/keypair.dart';

Future<void> login(
  BuildContext context,
  WidgetRef ref,
  Keypair keypair,
) async {
  ref.read(webSessionProvider.notifier).login(keypair);
}

Future<void> handleImportWithPrivateKey(
  BuildContext context,
  WidgetRef ref,
) async {
  await PromptModal.show(
    contextOverride: context,
    tightPadding: true,
    title: "Import Wallet",
    validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
    labelText: "Private Key",
    onValidSubmission: (submission) async {
      await handleRememberMe(context, ref);
      final keypair = await KeygenService.importPrivateKey(submission);
      // await TransactionService().createWallet(null, keypair.public);
      login(context, ref, keypair);
      if (ref.read(webSessionProvider).isAuthenticated) {
        AutoRouter.of(context).push(WebDashboardContainerRoute());
      }
    },
  );
}

Future<void> handleCreateWithEmail(
  BuildContext context,
  WidgetRef ref,
  String emailValue,
  String passwordValue, [
  bool forCreate = true,
]) async {
  String email = emailValue.toLowerCase();
  String password = passwordValue;

  String seed = "$email|$password|";
  seed = "$seed${seed.length}|!@${((password.length * 7) + email.length) * 7}";

  final regChars = RegExp(r'/[a-z]+/g');
  final regUpperChars = RegExp(r'/[A-Z]+/g');
  final regNumbers = RegExp(r'/[0-9]+/g');

  final chars = regChars.hasMatch(password) ? regChars.allMatches(password).length : 1;
  final upperChars = regUpperChars.hasMatch(password) ? regUpperChars.allMatches(password).length : 1;
  final upperNumbers = regNumbers.hasMatch(password) ? regNumbers.allMatches(password).length : 1;

  seed = "$seed${(chars + upperChars + upperNumbers) * password.length}3571";
  seed = "$seed$seed";

  for (int i = 0; i <= 50; i++) {
    seed = sha256.convert(utf8.encode(seed)).toString();
  }

  final keypair = await KeygenService.seedToKeypair(seed, 0, email);
  if (keypair == null) {
    ref.read(globalLoadingProvider.notifier).complete();
    Toast.error();
    return;
  }
  if (forCreate) {
    await showKeys(context, keypair);
  }

  // await TransactionService().createWallet(email, keypair.public);
  await handleRememberMe(context, ref);
  login(context, ref, keypair.copyWith(email: email));
}

Future<void> handleCreateWithMnemonic(
  BuildContext context,
  WidgetRef ref,
) async {
  ref.read(globalLoadingProvider.notifier).start();

  await Future.delayed(const Duration(milliseconds: 300));

  final keypair = await KeygenService.generate();
  if (keypair == null) {
    ref.read(globalLoadingProvider.notifier).complete();
    Toast.error();
    return;
  }
  ref.read(globalLoadingProvider.notifier).complete();

  // await TransactionService().createWallet(null, keypair.public);

  login(context, ref, keypair);
  await showKeys(context, keypair);
}

Future<dynamic> handleRememberMe(BuildContext context, WidgetRef ref) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Store Private Key?'),
          content: const Text('Would you like the web wallet to store and remember your private key? Choose "No" if this is a shared computer.'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.darkButtonBg,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                ref.read(webSessionProvider.notifier).setRememberMe(false);
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.info,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                ref.read(webSessionProvider.notifier).setRememberMe(true);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      });
}

Future<dynamic> handleRecoverFromMnemonic(BuildContext context, WidgetRef ref) async {
  return await PromptModal.show(
    contextOverride: context,
    title: "Input Recovery Mnemonic",
    validator: (value) => formValidatorNotEmpty(value, "Recovery Mnemonic"),
    labelText: "Recovery Mnemonic",
    lines: 3,
    tightPadding: true,
    onValidSubmission: (value) async {
      await handleRememberMe(context, ref);
      ref.read(globalLoadingProvider.notifier).start();

      await Future.delayed(const Duration(milliseconds: 300));

      final keypair = await KeygenService.recover(value.trim());

      if (keypair == null) {
        Toast.error();
        ref.read(globalLoadingProvider.notifier).complete();

        return;
      }
      ref.read(globalLoadingProvider.notifier).complete();

      // showKeys(context, keypair);
      // await TransactionService().createWallet(null, keypair.public);
      login(context, ref, keypair);
      if (ref.read(webSessionProvider).isAuthenticated) {
        AutoRouter.of(context).push(WebDashboardContainerRoute());
      }
    },
  );
}

Future<void> showKeys(
  BuildContext context,
  Keypair keypair, [
  bool forReveal = false,
]) async {
  final isMobile = BreakPoints.useMobileLayout(context);

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(forReveal ? "Keys" : "Key Generated"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Here are your wallet details. Please ensure to back up your private key in a safe place."),
            ),
            if (keypair.mneumonic != null)
              ListTile(
                leading: isMobile ? null : const Icon(FontAwesomeIcons.paragraph),
                title: TextFormField(
                  initialValue: keypair.mneumonic!,
                  decoration: const InputDecoration(
                    label: Text("Recovery Mneumonic"),
                  ),
                  style: const TextStyle(fontSize: 16),
                  readOnly: true,
                  minLines: 3,
                  maxLines: 3,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: keypair.mneumonic));
                    Toast.message("Mneumonic copied to clipboard");
                  },
                ),
              ),
            ListTile(
              leading: isMobile ? null : const Icon(Icons.account_balance_wallet),
              title: TextFormField(
                initialValue: keypair.public,
                decoration: const InputDecoration(label: Text("Address")),
                readOnly: true,
                style: const TextStyle(fontSize: 13),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: keypair.public));
                  Toast.message("Public key copied to clipboard");
                },
              ),
            ),
            ListTile(
              leading: isMobile ? null : const Icon(Icons.security),
              title: TextFormField(
                initialValue: keypair.privateCorrected,
                decoration: const InputDecoration(
                  label: Text("Private Key"),
                ),
                style: const TextStyle(fontSize: 13),
                readOnly: true,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: keypair.privateCorrected));
                  Toast.message("Private key copied to clipboard");
                },
              ),
            ),
            // if (keypair.mneumonic != null) Text(keypair.mneumonic!),

            const Divider(),
            AppButton(
              label: "Done",
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    },
  );
}

Future<void> logout(BuildContext context, WidgetRef ref) async {
  await ref.read(webSessionProvider.notifier).logout();

  AutoRouter.of(context).replace(const WebAuthRouter());
}
