import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../utils/formatting.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';

class NftDataModal extends StatelessWidget {
  final String data;
  const NftDataModal(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = getPrettyJSONString(jsonDecode(data));

    return ModalContainer(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            text,
            softWrap: false,
          ),
        )
      ],
    );
  }
}
