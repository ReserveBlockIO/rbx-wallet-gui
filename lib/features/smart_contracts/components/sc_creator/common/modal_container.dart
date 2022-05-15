import 'package:flutter/material.dart';

class ModalContainer extends StatelessWidget {
  final List<Widget> children;
  final Color color;
  const ModalContainer(
      {Key? key, this.color = Colors.black, this.children = const []})
      : super(key: key);

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
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
