import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/components/store_list.dart';
import 'package:rbx_wallet/features/dst/providers/collection_form_provider.dart';
import 'package:rbx_wallet/features/dst/providers/collection_list_provider.dart';
import 'package:rbx_wallet/features/dsts_legacy/providers/my_store_listings_provider.dart';

class MyCollectionsListScreen extends BaseScreen {
  const MyCollectionsListScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("My Collections"),
      actions: [
        TextButton(
          onPressed: () {
            AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
          },
          child: Text(
            "Create Collection",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final stores = ref.watch(storeListProvider);
    if (stores.isEmpty) {
      return Center(
        child: AppButton(
          label: "Create Collection",
          variant: AppColorVariant.Success,
          onPressed: () {
            ref.read(storeFormProvider.notifier).clear();
            AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
          },
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CollectionList(),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  label: 'Create Collection',
                  variant: AppColorVariant.Success,
                  onPressed: () async {
                    ref.read(storeFormProvider.notifier).clear();
                    AutoRouter.of(context).push(const CreateCollectionContainerScreenRoute());
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
