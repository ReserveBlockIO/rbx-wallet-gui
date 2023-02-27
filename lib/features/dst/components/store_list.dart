import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/dst/providers/store_list_provider.dart';
import 'package:rbx_wallet/features/dst/screens/my_store_detail_screen.dart';

class StoreList extends BaseComponent {
  const StoreList({Key? key}) : super(key: key);

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
            title: Text(store.name),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context).push(MyStoreDetailScreenRoute(storeId: store.id));
            },
          ),
        );
      },
    );
  }
}
