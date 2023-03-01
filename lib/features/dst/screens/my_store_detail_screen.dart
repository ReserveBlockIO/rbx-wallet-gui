import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/components/listing_list.dart';
import 'package:rbx_wallet/features/dst/providers/store_detail_provider.dart';
import 'package:rbx_wallet/features/dst/providers/store_form_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/app_router.gr.dart';

class MyStoreDetailScreen extends BaseScreen {
  final int storeId;
  const MyStoreDetailScreen({
    Key? key,
    @PathParam("storeId") required this.storeId,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeDetailProvider(storeId));

    return data.when(
      loading: () => null,
      error: (_, __) => null,
      data: (store) {
        if (store == null) {
          return null;
        }
        return AppBar(
          title: Text(store.name),
          actions: [
            TextButton(
              onPressed: () {
                AutoRouter.of(context).push(CreateListingContainerScreenRoute(storeId: storeId));
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
    final data = ref.watch(storeDetailProvider(storeId));

    return data.when(
      loading: () => CenteredLoader(),
      error: (_, __) => Center(child: Text("An error occurred.")),
      data: (store) {
        if (store == null) {
          return Center(child: Text("An error occurred."));
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                store.name,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
              ),
              Text(
                store.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              Divider(),
              Expanded(child: ListingList(storeId)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppButton(
                    label: 'Edit Store',
                    icon: Icons.edit,
                    onPressed: () {
                      ref.read(storeFormProvider.notifier).load(store);
                      AutoRouter.of(context).push(const CreateStoreContainerScreenRoute());
                    },
                  ),
                  AppButton(
                    label: 'Create Listing',
                    icon: Icons.add,
                    variant: AppColorVariant.Success,
                    onPressed: () {
                      AutoRouter.of(context).push(CreateListingContainerScreenRoute(storeId: storeId));
                    },
                  ),
                  AppButton(
                    label: 'Delete Store',
                    variant: AppColorVariant.Danger,
                    icon: Icons.fire_hydrant,
                    onPressed: () async {
                      final confirmed = await ConfirmDialog.show(
                        title: "Delete Store",
                        body: "Are you sure you want to delete this store?",
                        destructive: true,
                        confirmText: "Delete",
                        cancelText: "Cancel",
                      );

                      if (confirmed == true) {
                        ref.read(storeFormProvider.notifier).delete(context, store);
                        Toast.message("Store deleted.");
                      }
                    },
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
