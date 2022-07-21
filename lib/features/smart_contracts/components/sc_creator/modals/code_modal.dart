import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';

class CodeModal extends StatelessWidget {
  final String code;
  const CodeModal(this.code, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              )),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: code
                    .split("\n")
                    .asMap()
                    .entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Text(
                            "${e.key + 1}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontFamily: "RobotoMono",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: false,
                          ),
                        ))
                    .toList(),
              ),
            ),
            // Expanded(
            //   child: TextFormField(
            //     readOnly: true,
            //     minLines: 24,
            //     maxLines: 64,
            //     initialValue: code,
            //     decoration: InputDecoration(),
            //     style: TextStyle(fontFamily: "RobotoMono", fontSize: 16),
            //   ),
            // ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                code,
                style: const TextStyle(
                  fontFamily: kIsWeb ? null : "RobotoMono",
                  fontSize: 16,
                ),
                softWrap: false,
              ),
            )
          ],
        )
      ],
    );
  }
}
