import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/providers/collection_list_provider.dart';

class CollectionList extends BaseComponent {
  const CollectionList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(storeListProvider.notifier);
    final stores = ref.watch(storeListProvider);

    return ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final store = stores[index];
        return Card(
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(store.name),
                AppBadge(
                  label: store.isLive ? 'Live' : 'Not Live',
                  variant: store.isLive ? AppColorVariant.Success : AppColorVariant.Danger,
                ),
              ],
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context).push(MyCollectionDetailScreenRoute(collectionId: store.id));
            },
          ),
        );
      },
    );
  }
}
