import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';

class CodeModal extends StatelessWidget {
  final String code;
  const CodeModal(this.code, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalContainer(
      children: [
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white70),
              )),
        ),
        TextFormField(
          readOnly: true,
          minLines: 24,
          maxLines: 64,
          initialValue: code,
          decoration: InputDecoration(),
          style: TextStyle(fontFamily: "RobotoMono"),
        )
      ],
    );
  }
}
