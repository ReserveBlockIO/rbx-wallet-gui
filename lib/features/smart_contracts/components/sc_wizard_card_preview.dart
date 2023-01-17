import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../models/bulk_smart_contract_entry.dart';
import '../providers/sc_wizard_provider.dart';
import '../screens/sc_wizard_edit_item_screen.dart';
import 'sc_wizard_asset_preview.dart';

class ScWizardCardPreview extends BaseComponent {
  final int index;

  const ScWizardCardPreview({
    Key? key,
    required this.index,
  }) : super(key: key);

  void createNew({
    required BuildContext context,
    required ScWizardProvider provider,
    required int index,
    required int x,
    required int y,
    required ScWizardItem item,
  }) {
    provider.insert(
      entry: item.entry.copyWith(),
      index: index,
      y: y,
      x: x,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScWizardEditItemScreen(
          title: "Create Instance",
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final provider = ref.read(scWizardProvider.notifier);

    final items = ref.watch(scWizardProvider);
    final item = items.length >= index + 1 ? items[index] : null;

    String title = "";
    if (item == null) {
      if (items.isEmpty) {
        title = "Create Blueprint";
      } else {
        title = "Create Instance";
      }
    } else {
      title = item.entry.name.isEmpty ? "Untitled" : item.entry.name;
    }

    final bool addButtonAbove = item != null && item.y > 0 && items.firstWhereOrNull((i) => i.x == item.x && i.y == item.y - 1) == null;
    final bool addButtonBelow = item != null && item.y < 2 && items.firstWhereOrNull((i) => i.x == item.x && i.y == item.y + 1) == null;
    final bool addButtonLeft = item != null && item.x > 0 && items.firstWhereOrNull((i) => i.x == item.x - 1 && i.y == item.y) == null;
    final bool addButtonRight = item != null && item.x < 2 && items.firstWhereOrNull((i) => i.x == item.x + 1 && i.y == item.y) == null;

    return SizedBox(
      width: 198,
      height: 248,
      child: Column(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: addButtonAbove
                ? InkWell(
                    onTap: () {
                      createNew(
                        context: context,
                        provider: provider,
                        index: items.length,
                        x: item.x,
                        y: item.y - 1,
                        item: item,
                      );
                    },
                    child: const Icon(Icons.add, size: 12),
                  )
                : const SizedBox.shrink(),
          ),
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: addButtonLeft
                    ? InkWell(
                        onTap: () {
                          createNew(
                            context: context,
                            provider: provider,
                            index: items.length,
                            x: item.x - 1,
                            y: item.y,
                            item: item,
                          );
                        },
                        child: const Icon(Icons.add, size: 12),
                      )
                    : const SizedBox.shrink(),
              ),
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(6.0)),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    if (item == null) {
                      provider.insert(
                        entry: BulkSmartContractEntry.empty(),
                        index: 0,
                        y: 1,
                        x: 1,
                      );

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ScWizardEditItemScreen(
                            title: "Create Collection Blueprint",
                            index: 0,
                          ),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScWizardEditItemScreen(
                            title: "Edit Instance",
                            index: item.index,
                          ),
                        ),
                      );
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (item != null) ScWizardAssetPreview(entry: item.entry),
                      Container(
                        color: Colors.black38,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "",
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              item == null ? Icons.add : Icons.edit,
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (item != null)
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "x${item.entry.quantity}",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: addButtonRight
                    ? InkWell(
                        onTap: () {
                          createNew(
                            context: context,
                            provider: provider,
                            index: items.length,
                            x: item.x + 1,
                            y: item.y,
                            item: item,
                          );
                        },
                        child: const Icon(Icons.add, size: 12),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: addButtonBelow
                ? InkWell(
                    onTap: () {
                      createNew(
                        context: context,
                        provider: provider,
                        index: items.length,
                        x: item.x,
                        y: item.y + 1,
                        item: item,
                      );
                    },
                    child: const Icon(Icons.add, size: 12),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
