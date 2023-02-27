import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/features/dst/providers/store_detail_provider.dart';

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
            ],
          ),
        );
      },
    );
  }
}
