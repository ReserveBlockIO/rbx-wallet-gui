import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/components/create_listing_form_group.dart';
import 'package:rbx_wallet/features/dst/providers/collection_form_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/listing_form_provider.dart';

class CreateListingContainerScreen extends BaseScreen {
  final int collectionId;
  const CreateListingContainerScreen(@PathParam("collectionId") this.collectionId, {Key? key})
      : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider);

    return AppBar(
      title: Text(model.id == 0 ? "Create Listing" : "Edit Listing"),
      leading: IconButton(
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
            title: "Are you sure you want to close the listing ${model.id != 0 ? 'editing' : 'creation'} screen?",
            body: "All unsaved changes will be lost.",
            cancelText: "Cancel",
            confirmText: "Continue",
          );

          if (confirmed == true) {
            AutoRouter.of(context).pop();
            provider.clear();
            ref.invalidate(listingFormProvider);
          }
        },
        icon: const Icon(Icons.close),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider);
    bool isCreating = model.id == 0;

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
                const CreateListingFormGroup(),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: isCreating ? "Discard Changes" : "Delete Listing",
                  variant: AppColorVariant.Danger,
                  icon: isCreating ? null : Icons.delete,
                  onPressed: () async {
                    if (isCreating) {
                      final confirmed = await ConfirmDialog.show(
                        title: "Are you sure you want to discard the listing?",
                        body: "All unsaved changes will be lost.",
                        cancelText: "Cancel",
                        confirmText: "Continue",
                      );

                      if (confirmed == true) {
                        AutoRouter.of(context).pop();
                        provider.clear();
                        ref.invalidate(storeFormProvider);
                      }
                    } else {
                      provider.delete(context, collectionId, model);
                    }
                  },
                ),
                AppButton(
                  label: isCreating ? 'Create' : 'Update',
                  variant: AppColorVariant.Success,
                  onPressed: () async {
                    await provider.complete(context, collectionId);
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
