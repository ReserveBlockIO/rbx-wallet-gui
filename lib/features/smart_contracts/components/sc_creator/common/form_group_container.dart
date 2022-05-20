import 'package:flutter/material.dart';

class FormGroupContainer extends StatelessWidget {
  final Widget child;
  const FormGroupContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
