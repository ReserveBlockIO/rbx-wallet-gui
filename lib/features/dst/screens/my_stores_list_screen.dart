import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/components/store_list.dart';
import 'package:rbx_wallet/features/dst/providers/store_list_provider.dart';
import 'package:rbx_wallet/features/dsts_legacy/providers/my_store_listings_provider.dart';

class MyStoresListScreen extends BaseScreen {
  const MyStoresListScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("My Stores"),
      actions: [
        TextButton(
          onPressed: () {
            AutoRouter.of(context).push(const CreateStoreContainerScreenRoute());
          },
          child: Text(
            "Create Store",
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
          label: "Create Store",
          variant: AppColorVariant.Success,
          onPressed: () {
            AutoRouter.of(context).push(const CreateStoreContainerScreenRoute());
          },
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StoreList(),
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
                  label: 'Create Store',
                  variant: AppColorVariant.Success,
                  onPressed: () async {
                    AutoRouter.of(context).push(const CreateStoreContainerScreenRoute());
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
