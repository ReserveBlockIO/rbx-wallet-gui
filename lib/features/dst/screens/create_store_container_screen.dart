import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/components/create_store_form_group.dart';
import 'package:rbx_wallet/features/dst/providers/store_form_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';

class CreateStoreContainerScreen extends BaseScreen {
  const CreateStoreContainerScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(storeFormProvider.notifier);
    return AppBar(
      title: const Text("Store Creation"),
      leading: IconButton(
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
            title: "Are you sure you want to close the Store creation screen?",
            body: "All unsaved changes will be lost.",
            cancelText: "Cancel",
            confirmText: "Continue",
          );

          if (confirmed == true) {
            AutoRouter.of(context).pop();
            provider.clear();
            ref.invalidate(storeFormProvider);
          }
        },
        icon: const Icon(Icons.close),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(storeFormProvider.notifier);
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CreateStoreFormGroup(),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF040f26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  label: 'Create',
                  variant: AppColorVariant.Success,
                  onPressed: () async {
                    final success = await provider.complete(context);
                    if (success) {
                      AutoRouter.of(context).pop();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
