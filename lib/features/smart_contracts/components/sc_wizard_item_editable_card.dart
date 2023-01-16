import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../providers/sc_wizard_provider.dart';
import '../../../utils/validation.dart';

class ScWizardItemEditableCard extends BaseComponent {
  final int index;
  const ScWizardItemEditableCard(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(scWizardProvider.notifier);
    final item = ref.watch(scWizardProvider)[index];

    final entry = item.entry;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 300, maxWidth: 300, minHeight: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.name.isEmpty ? "Name" : entry.name,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: entry.name.isEmpty ? Colors.white54 : Colors.white,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final value = await PromptModal.show(
                        title: entry.name.isEmpty ? "Add Name" : "Edit Name",
                        validator: (value) => formValidatorNotEmpty(value, "Name"),
                        labelText: "Name",
                        initialValue: entry.name,
                      );
                      if (value != null && value.isNotEmpty) {
                        provider.updateName(item.index, value);
                      }
                    },
                    child: Icon(
                      Icons.edit,
                      size: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
