import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/keygen/services/keygen_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class KeygenCta extends BaseComponent {
  const KeygenCta({Key? key}) : super(key: key);

  Future<void> handleImport(BuildContext context, WidgetRef ref) async {
    PromptModal.show(
      title: "Import Wallet",
      validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
      labelText: "Private Key",
      onValidSubmission: (value) async {
        final keypair = await KeygenService.importPrivateKey(value, "todo@test.com"); //TODO email

        showKeys(context, keypair);
      },
    );
  }

  Future<void> handleCreate(BuildContext context, WidgetRef ref) async {
    ref.read(globalLoadingProvider.notifier).start();

    final email = await PromptModal.show(
      contextOverride: context,
      title: "Email Address",
      labelText: "Email",
      validator: formValidatorEmail,
    );

    if (email == null || email.isEmpty) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    final keypair = await KeygenService.generate(email);
    if (keypair == null) {
      ref.read(globalLoadingProvider.notifier).complete();
      Toast.error();

      return;
    }
    ref.read(globalLoadingProvider.notifier).complete();

    showKeys(context, keypair);
  }

  Future<void> handleRecover(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final email = await PromptModal.show(
      contextOverride: context,
      title: "Email Address",
      labelText: "Email",
      validator: formValidatorEmail,
    );

    if (email == null || email.isEmpty) {
      return;
    }

    await PromptModal.show(
      title: "Input Recovery Mnemonic",
      validator: (value) => formValidatorNotEmpty(value, "Recovery Mnemonic"),
      labelText: "Recovery Mnemonic",
      lines: 3,
      onValidSubmission: (value) async {
        ref.read(globalLoadingProvider.notifier).start();

        await Future.delayed(const Duration(milliseconds: 300));

        final keypair = await KeygenService.recover(value.trim(), email);

        if (keypair == null) {
          Toast.error();
          ref.read(globalLoadingProvider.notifier).complete();

          return;
        }
        ref.read(globalLoadingProvider.notifier).complete();

        showKeys(context, keypair);
      },
    );
  }

  Future<void> showKeys(
    BuildContext context,
    Keypair keypair,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Key Generated"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Here is your wallet details. Please ensure to back up your private key in a safe place."),
              ),
              if (keypair.mneumonic != null)
                ListTile(
                  leading: const Icon(FontAwesomeIcons.paragraph),
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
                leading: const Icon(Icons.account_balance_wallet),
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
                leading: const Icon(Icons.security),
                title: TextFormField(
                  initialValue: keypair.private,
                  decoration: const InputDecoration(
                    label: Text("Private Key"),
                  ),
                  style: const TextStyle(fontSize: 13),
                  readOnly: true,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: keypair.private));
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        AppButton(
          label: "Import Private Key",
          onPressed: () {
            handleImport(context, ref);
          },
        ),
        const SizedBox(
          width: 8,
        ),
        AppButton(
          label: "Generate Keypair",
          onPressed: () {
            handleCreate(
              context,
              ref,
            );
          },
        ),
        const SizedBox(
          width: 8,
        ),
        AppButton(
          label: "Recover Account",
          onPressed: () {
            handleRecover(context, ref);
          },
        )
      ],
    );
  }
}
