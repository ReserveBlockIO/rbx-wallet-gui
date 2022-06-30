import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';

import 'package:rbx_wallet/features/keygen/services/keygen_service.dart'
    if (dart.library.io) 'package:rbx_wallet/features/keygen/services/keygen_service_mock.dart';

import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:crypto/crypto.dart';

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
    onValidSubmission: (value) async {
      final keypair = await KeygenService.importPrivateKey(value);
      login(context, ref, keypair);
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

  final chars =
      regChars.hasMatch(password) ? regChars.allMatches(password).length : 1;
  final upperChars = regUpperChars.hasMatch(password)
      ? regUpperChars.allMatches(password).length
      : 1;
  final upperNumbers = regNumbers.hasMatch(password)
      ? regNumbers.allMatches(password).length
      : 1;

  seed = "$seed${(chars + upperChars + upperNumbers) * password.length}3571";
  seed = "$seed$seed";

  for (int i = 0; i <= 50; i++) {
    seed = sha256.convert(utf8.encode(seed)).toString();
  }

  final keypair = await KeygenService.seedToKeypair(seed, 0);
  if (keypair == null) {
    ref.read(globalLoadingProvider.notifier).complete();
    Toast.error();
    return;
  }
  if (forCreate) {
    await showKeys(context, keypair);
  }
  login(context, ref, keypair);
}

Future<void> handleCreateWithMnemonic(
    BuildContext context, WidgetRef ref) async {
  ref.read(globalLoadingProvider.notifier).start();

  await Future.delayed(Duration(milliseconds: 300));

  final keypair = await KeygenService.generate();
  if (keypair == null) {
    ref.read(globalLoadingProvider.notifier).complete();
    Toast.error();
    return;
  }
  ref.read(globalLoadingProvider.notifier).complete();

  login(context, ref, keypair);
  await showKeys(context, keypair);
}

Future<dynamic> handleRecoverFromMnemonic(
    BuildContext context, WidgetRef ref) async {
  return await PromptModal.show(
    contextOverride: context,
    title: "Input Recovery Mnemonic",
    validator: (value) => formValidatorNotEmpty(value, "Recovery Mnemonic"),
    labelText: "Recovery Mnemonic",
    lines: 3,
    tightPadding: true,
    onValidSubmission: (value) async {
      ref.read(globalLoadingProvider.notifier).start();

      await Future.delayed(Duration(milliseconds: 300));

      final keypair = await KeygenService.recover(value.trim());

      if (keypair == null) {
        Toast.error();
        ref.read(globalLoadingProvider.notifier).complete();

        return;
      }
      ref.read(globalLoadingProvider.notifier).complete();

      // showKeys(context, keypair);
      login(context, ref, keypair);
      if (ref.read(webSessionProvider).isAuthenticated) {
        AutoRouter.of(context).push(WebDashboardContainerRoute());
      }
    },
  );
}

Future<void> showKeys(
  BuildContext context,
  Keypair keypair,
) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text("Key Genrated"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Here is your wallet details. Please ensure to back up your private key in a safe place."),
            ),
            if (keypair.mneumonic != null)
              ListTile(
                leading: Icon(FontAwesomeIcons.paragraph),
                title: TextFormField(
                  initialValue: keypair.mneumonic!,
                  decoration: InputDecoration(
                    label: Text("Recovery Mneumonic"),
                  ),
                  style: TextStyle(fontSize: 16),
                  readOnly: true,
                  minLines: 3,
                  maxLines: 3,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: keypair.mneumonic));
                    Toast.message("Mneumonic copied to clipboard");
                  },
                ),
              ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: TextFormField(
                initialValue: keypair.public,
                decoration: InputDecoration(label: Text("Address")),
                readOnly: true,
                style: TextStyle(fontSize: 13),
              ),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: keypair.public));
                  Toast.message("Public key copied to clipboard");
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: TextFormField(
                initialValue: keypair.private,
                decoration: InputDecoration(
                  label: Text("Private Key"),
                ),
                style: TextStyle(fontSize: 13),
                readOnly: true,
              ),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: keypair.private));
                  Toast.message("Private key copied to clipboard");
                },
              ),
            ),
            // if (keypair.mneumonic != null) Text(keypair.mneumonic!),

            Divider(),
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

  AutoRouter.of(context).replace(WebAuthRouter());
}
