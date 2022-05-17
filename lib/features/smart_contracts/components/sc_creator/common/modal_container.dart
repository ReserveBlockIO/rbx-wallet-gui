import 'package:flutter/material.dart';

class ModalContainer extends StatelessWidget {
  final List<Widget> children;
  final Color color;
  final bool withClose;
  const ModalContainer({
    Key? key,
    this.color = Colors.black,
    this.children = const [],
    this.withClose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
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
                        child: Text(
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
