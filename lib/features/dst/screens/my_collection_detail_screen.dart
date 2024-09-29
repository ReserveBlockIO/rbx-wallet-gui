
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../components/listing_list.dart';
import '../providers/collection_detail_provider.dart';
import '../providers/collection_form_provider.dart';
import '../../../utils/toast.dart';

import '../../../core/app_router.gr.dart';

class MyCollectionDetailScreen extends BaseScreen {
  final int collectionId;
  const MyCollectionDetailScreen({
    Key? key,
    @PathParam("collectionId") required this.collectionId,
  }) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeDetailProvider(collectionId));

    return data.when(
      loading: () => null,
      error: (_, __) => null,
      data: (store) {
        if (store == null) {
          return null;
        }
        return AppBar(
          title: Text(store.name),
          backgroundColor: Colors.black,
          actions: [
            TextButton(
              onPressed: () {
                AutoRouter.of(context).push(CreateListingContainerScreenRoute(collectionId: collectionId));
              },
              child: Text(
                "Create Listing",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeDetailProvider(collectionId));

    return data.when(
      loading: () => CenteredLoader(),
      error: (_, __) => Center(child: Text("An error occurred.")),
      data: (store) {
        if (store == null) {
          return Center(child: Text("An error occurred."));
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              store.name,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
            ),
            Text(
              store.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8,
            ),
            Divider(),
            Expanded(child: ListingList(collectionId)),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppButton(
                    label: 'Edit Collection',
                    icon: Icons.edit,
                    variant: AppColorVariant.Light,
                    onPressed: () {
                      ref.read(storeFormProvider.notifier).load(store);
                      AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
                    },
                  ),
                  AppButton(
                    label: 'Create Listing',
                    icon: Icons.add,
                    variant: AppColorVariant.Success,
                    onPressed: () {
                      AutoRouter.of(context).push(CreateListingContainerScreenRoute(collectionId: collectionId));
                    },
                  ),
                  AppButton(
                    label: 'Delete Collection',
                    variant: AppColorVariant.Danger,
                    icon: Icons.delete,
                    onPressed: () async {
                      final confirmed = await ConfirmDialog.show(
                        title: "Delete Collection",
                        body: "Are you sure you want to delete this store?",
                        destructive: true,
                        confirmText: "Delete",
                        cancelText: "Cancel",
                      );

                      if (confirmed == true) {
                        ref.read(storeFormProvider.notifier).delete(context, store);
                        Toast.message("Collection deleted.");
                      }
                    },
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
