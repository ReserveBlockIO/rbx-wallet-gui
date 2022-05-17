import 'package:flutter/material.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';

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
        color: Colors.black54,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
