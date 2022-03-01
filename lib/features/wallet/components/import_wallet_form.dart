import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/buttons.dart';

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
            decoration: InputDecoration(label: Text("Private Key")),
          ),
          AppButton(label: "Import")
        ],
      ),
    );
  }
}
