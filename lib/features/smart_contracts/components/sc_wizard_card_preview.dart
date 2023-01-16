import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/models/bulk_smart_contract_entry.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/sc_wizard_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/sc_wizard_edit_item_screen.dart';
import 'package:collection/collection.dart';

class ScWizardCardPreview extends BaseComponent {
  final int index;

  const ScWizardCardPreview({
    Key? key,
    required this.index,
  }) : super(key: key);

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
                      provider.insert(
                        entry: BulkSmartContractEntry.empty(),
                        index: items.length,
                        y: item.y - 1,
                        x: item.x,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScWizardEditItemScreen(
                            title: "Create Instance",
                            index: items.length,
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.add, size: 12))
                : SizedBox(),
          ),
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
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
                          builder: (context) => ScWizardEditItemScreen(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "",
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(
                          item == null ? Icons.add : Icons.edit,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 24,
                height: 24,
              ),
            ],
          ),
          SizedBox(
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
