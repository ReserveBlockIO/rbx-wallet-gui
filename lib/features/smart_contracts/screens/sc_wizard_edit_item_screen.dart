import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../components/sc_wizard_item_editable_card.dart';
import '../providers/sc_wizard_provider.dart';

class ScWizardEditItemScreen extends BaseScreen {
  final String title;
  final int index;
  const ScWizardEditItemScreen({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
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
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(child: ScWizardItemEditableCard(index));
  }
}
