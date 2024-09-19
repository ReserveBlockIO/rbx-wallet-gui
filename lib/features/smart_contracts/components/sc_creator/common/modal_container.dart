import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.gen.dart';

class ModalContainer extends StatelessWidget {
  final List<Widget> children;
  final Color color;
  final bool withClose;
  final bool withDecor;
  final double padding;
  const ModalContainer({
    Key? key,
    this.color = const Color(0xFF0b0d0f),
    this.children = const [],
    this.withClose = false,
    this.withDecor = true,
    this.padding = 32.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (withClose)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ...children
              ],
            ),
          ),
        ),
      ),
    );
  }
}
