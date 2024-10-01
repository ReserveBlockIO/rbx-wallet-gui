import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/sc_wizard_provider.dart';

import '../../../core/base_component.dart';
import '../../../generated/assets.gen.dart';
import '../providers/sc_wizard_minting_progress_provider.dart';

class ScWizardMintingProgressDialog extends BaseComponent {
  final BuildContext? contextOverride;
  const ScWizardMintingProgressDialog({Key? key, this.contextOverride}) : super(key: key);

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
              color: Theme.of(context).colorScheme.secondary,
              backgroundColor: Colors.white24,
              minHeight: 16,
            ),
            const SizedBox(height: 4),
            Text(
              "${(model.percent * 100).round()}%",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: model.percent >= 1
                ? () {
                    ref.read(scWizardProvider.notifier).clear();
                    if (kIsWeb) {
                      // Navigator.of(context).pop();
                      AutoRouter.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }
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
