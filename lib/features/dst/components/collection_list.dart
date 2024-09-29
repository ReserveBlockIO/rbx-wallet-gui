import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/collection_list_provider.dart';

import '../providers/collection_form_provider.dart';

class CollectionList extends BaseComponent {
  const CollectionList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(collectionListProvider.notifier);
    final collections = ref.watch(collectionListProvider);

    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final collection = collections[index];
        return Card(
          color: Colors.white.withOpacity(0.03),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(collection.name),
                Expanded(
                  child: SizedBox.shrink(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBadge(
                      label: collection.isLive ? 'Live' : 'Hidden',
                      variant: collection.isLive ? AppColorVariant.Success : AppColorVariant.Danger,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Switch(
                        value: collection.isLive,
                        activeColor: Theme.of(context).colorScheme.success,
                        inactiveThumbColor: Theme.of(context).colorScheme.danger,
                        onChanged: (val) {
                          ref.read(storeFormProvider.notifier).switchLiveState(collection, val);
                        }),
                  ],
                ),
              ],
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context).push(MyCollectionDetailScreenRoute(collectionId: collection.id));
            },
          ),
        );
      },
    );
  }
}
