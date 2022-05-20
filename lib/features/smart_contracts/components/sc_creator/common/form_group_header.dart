import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';

class FormGroupHeader extends StatelessWidget {
  final String title;
  final HelpType? helpType;
  final bool withBg;
  const FormGroupHeader(
    this.title, {
    Key? key,
    this.helpType,
    this.withBg = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: withBg ? Colors.black54 : Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: withBg ? 8 : 0),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                  ),
            ),
            if (helpType != null) HelpButton(helpType!)
          ],
        ),
      ),
    );
  }
}
