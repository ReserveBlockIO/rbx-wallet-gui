import 'package:flutter/material.dart';

class SimpleExpandableText extends StatefulWidget {
  SimpleExpandableText(this.text);

  final String text;

  @override
  _SimpleExpandableTextState createState() => new _SimpleExpandableTextState();
}

class _SimpleExpandableTextState extends State<SimpleExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ConstrainedBox(
          constraints: isExpanded ? BoxConstraints() : BoxConstraints(maxHeight: 200.0),
          child: Text(
            widget.text,
            softWrap: true,
            // overflow: TextOverflow.fade,
            style: TextStyle(
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
                style: TextStyle(
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
