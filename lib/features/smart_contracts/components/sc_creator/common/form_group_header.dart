import 'package:flutter/material.dart';

import 'help_button.dart';

class FormGroupHeader extends StatelessWidget {
  final String title;
  final HelpType? helpType;
  const FormGroupHeader(
    this.title, {
    Key? key,
    this.helpType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // boxShadow: glowingBox,
          ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),
          ),
          if (helpType != null) HelpButton(helpType!)
        ],
      ),
    );
  }
}
