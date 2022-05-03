import 'package:flutter/material.dart';

class FormGroupHeader extends StatelessWidget {
  final String title;
  const FormGroupHeader(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
