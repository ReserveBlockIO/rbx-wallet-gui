import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rbx_wallet/utils/toast.dart';

class MotherAddHostDialog extends StatelessWidget {
  MotherAddHostDialog({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
              TextFormField(
                controller: ipAddressController,
                decoration: InputDecoration(label: Text("IP Address")),
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
                decoration: InputDecoration(label: Text("Password")),
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

            Toast.message("Your wallet is now a MOTHER follower.");
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
