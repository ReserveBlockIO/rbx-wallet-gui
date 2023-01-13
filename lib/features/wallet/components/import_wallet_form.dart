import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/components/buttons.dart';

class ImportWalletForm extends StatelessWidget {
  const ImportWalletForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

    return Form(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _controller,
            obscureText: true,
            decoration: const InputDecoration(label: Text("Private Key")),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
            ],
          ),
          const AppButton(label: "Import")
        ],
      ),
    );
  }
}
