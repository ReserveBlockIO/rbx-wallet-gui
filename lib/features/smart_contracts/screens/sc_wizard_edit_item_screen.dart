import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../components/sc_wizard_card.dart';
import '../providers/sc_wizard_provider.dart';

class ScWizardEditItemScreen extends BaseScreen {
  final String title;
  final int index;
  const ScWizardEditItemScreen({
    Key? key,
    required this.title,
    required this.index,
  }) : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      leading: const SizedBox.shrink(),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(child: Center(child: ScWizedCard(index))),
        Container(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  label: "Delete",
                  variant: AppColorVariant.Danger,
                  onPressed: () async {
                    final confirmed = await ConfirmDialog.show(
                      title: "Delete Instance?",
                      body: "Are you sure you want to delete this instance?",
                      confirmText: "Delete",
                      destructive: true,
                    );
                    if (confirmed == true) {
                      ref.read(scWizardProvider.notifier).removeAt(index, delay: 300);
                      Navigator.of(context).pop();
                    }
                  },
                ),
                AppButton(
                  label: "Save & Close",
                  onPressed: () async {
                    final item = ref.read(scWizardProvider.notifier).itemAtIndex(index);
                    if (item == null) {
                      Toast.error();
                      return;
                    }

                    final entry = item.entry;
                    final List<String> errors = [];

                    if (entry.name.isEmpty) {
                      errors.add("- Name is required");
                    }

                    if (entry.creatorName.isEmpty) {
                      errors.add("- Minter name is required");
                    }

                    if (entry.description.isEmpty) {
                      errors.add("- Description is required");
                    }

                    if (entry.primaryAsset == null) {
                      errors.add("- Primary Asset is required");
                    }

                    if (errors.isNotEmpty) {
                      InfoDialog.show(
                        title: "Invalid Smart Contract",
                        body: errors.join("\n"),
                        closeText: "Okay",
                      );

                      return;
                    }

                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
