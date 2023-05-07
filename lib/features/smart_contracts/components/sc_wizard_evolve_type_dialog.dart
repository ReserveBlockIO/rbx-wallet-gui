import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/buttons.dart';
import 'sc_creator/common/help_button.dart';
import '../features/evolve/evolve.dart';
import '../../../core/base_component.dart';

class ScWizardEvolveTypeDialog extends BaseComponent {
  const ScWizardEvolveTypeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Text("Evolve Type"), const HelpButton(HelpType.evolveType)],
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
              label: "Date/Time",
              onPressed: () {
                Navigator.of(context).pop(EvolveType.time);
              },
            ),
            AppButton(
              label: "Block Height",
              onPressed: () {
                Navigator.of(context).pop(EvolveType.blockHeight);
              },
            ),
            AppButton(
              label: "Manual Only",
              onPressed: () {
                Navigator.of(context).pop(EvolveType.manualOnly);
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
