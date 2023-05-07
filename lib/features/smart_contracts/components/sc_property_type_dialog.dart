import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/buttons.dart';
import '../../sc_property/models/sc_property.dart';
import 'sc_creator/common/help_button.dart';
import '../../../core/base_component.dart';

class ScWizardPropertyTypeDialog extends BaseComponent {
  const ScWizardPropertyTypeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Text("Property Type"), const HelpButton(HelpType.propertyTyes)],
      ),
      actionsAlignment: MainAxisAlignment.start,
      content: SizedBox(
        width: 300,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            AppButton(
              label: "Text",
              onPressed: () {
                Navigator.of(context).pop(ScPropertyType.text);
              },
            ),
            AppButton(
              label: "Number",
              onPressed: () {
                Navigator.of(context).pop(ScPropertyType.number);
              },
            ),
            AppButton(
              label: "Color",
              onPressed: () {
                Navigator.of(context).pop(ScPropertyType.color);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
        )
      ],
    );
  }
}
