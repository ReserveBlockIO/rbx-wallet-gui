import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/mother/services/mother_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class MotherAddHostDialog extends BaseComponent {
  MotherAddHostDialog({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ipAddressController = TextEditingController();
    final passwordController = TextEditingController();
    return AlertDialog(
      title: Text("Add Host"),
      content: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500, minWidth: 300),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Set the IP address and password set of your MOTHER HOST."),
              TextFormField(
                controller: ipAddressController,
                decoration: InputDecoration(label: Text("IP Address of HOST")),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                ],
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "IP Address Required";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(label: Text("Password set on HOST")),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Password Required";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white54),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }

            final success = await MotherService().joinHost(ipAddressController.text.trim(), passwordController.text);

            if (success != true) {
              Toast.error();
              return;
            }

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
          child: Text(
            "Add",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
