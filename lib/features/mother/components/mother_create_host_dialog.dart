import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/toast.dart';
import '../services/mother_service.dart';

class MotherCreateHostDialog extends BaseComponent {
  final bool forUpdate;
  MotherCreateHostDialog({
    Key? key,
    required this.forUpdate,
  }) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    return AlertDialog(
      title: Text(forUpdate ? "Update Host Info" : "Set Wallet as Host"),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(label: Text("Host Name")),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Name Required";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(label: Text("Create Password")),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Password Required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 6),
              Text(
                "You must have port '${Env.validatorPort}' open on the HOST machine.",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white54),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }

            final success = await MotherService().createHost(
              nameController.text,
              passwordController.text,
            );

            if (success != true) {
              Toast.error();
              return;
            }

            Toast.message("Host Created");

            final restart = await ConfirmDialog.show(
              title: "CLI Restart Required",
              body: "Would you like to restart now?",
              confirmText: "Restart",
              cancelText: "Later",
            );

            if (restart == true) {
              ref.read(sessionProvider.notifier).restartCli();
            }

            Navigator.of(context).pop(true);
          },
          child: const Text(
            "Create",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
