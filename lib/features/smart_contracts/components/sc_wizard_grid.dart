import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_wizard_card_preview.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/sc_wizard_provider.dart';

class ScWizardGrid extends BaseComponent {
  const ScWizardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(scWizardProvider.notifier);
    final items = ref.watch(scWizardProvider);

    if (items.isEmpty) {
      return Center(
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
          widgets[y].add(SizedBox(
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

    return Column(
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
    );
  }
}
