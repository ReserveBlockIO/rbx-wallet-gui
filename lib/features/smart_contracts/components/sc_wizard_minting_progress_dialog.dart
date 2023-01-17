import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/theme/app_theme.dart';
import '../../../generated/assets.gen.dart';
import '../providers/sc_wizard_minting_progress_provider.dart';

class ScWizardMintingProgressDialog extends BaseComponent {
  const ScWizardMintingProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(scWizardMintingProgress);

    return AlertDialog(
      backgroundColor: Colors.black,
      title: const Text(
        "Compiling & Minting",
        style: TextStyle(color: Colors.white),
      ),
      content: Container(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              child: Center(
                child: Container(
                  color: Colors.black,
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    Assets.images.animatedCube.path,
                    scale: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(model.label),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: model.percent,
              color: Theme.of(context).colorScheme.success,
              backgroundColor: Colors.black38,
              minHeight: 16,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: model.percent >= 1
                ? () {
                    Navigator.of(context).pop();
                  }
                : null,
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
