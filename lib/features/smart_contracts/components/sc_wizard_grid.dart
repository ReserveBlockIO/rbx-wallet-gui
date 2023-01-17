import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../providers/sc_wizard_provider.dart';
import 'sc_wizard_card_preview.dart';

class ScWizardGrid extends BaseComponent {
  const ScWizardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(scWizardProvider.notifier);
    final items = ref.watch(scWizardProvider);

    if (items.isEmpty) {
      return const Center(
        child: ScWizardCardPreview(index: 0),
      );
    }

    final List<List<Widget>> widgets = [[]];

    int y = 0;
    while (y < 3) {
      widgets.add([]);
      int x = 0;
      while (x < 3) {
        final item = provider.itemAtCoords(x, y);
        if (item == null) {
          widgets[y].add(const SizedBox(
            width: 198,
            height: 248,
          ));
        } else {
          widgets[y].add(ScWizardCardPreview(
            index: item.index,
          ));
        }

        x += 1;
      }
      y += 1;
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widgets
            .map((row) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: row
                      .map(
                        (widget) => widget,
                      )
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}
