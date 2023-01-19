// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SimpleExpandableText extends StatefulWidget {
  const SimpleExpandableText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  _SimpleExpandableTextState createState() => _SimpleExpandableTextState();
}

class _SimpleExpandableTextState extends State<SimpleExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ConstrainedBox(
          constraints: isExpanded ? const BoxConstraints() : const BoxConstraints(maxHeight: 200.0),
          child: Text(
            widget.text,
            softWrap: true,
            // overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.4,
            ),
          )),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: InkWell(
              child: Text(
                isExpanded ? "Read Less" : 'Read More',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
              onTap: () => setState(() => isExpanded = !isExpanded)),
        ),
      )
    ]);
  }
}
