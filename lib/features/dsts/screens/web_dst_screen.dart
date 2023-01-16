import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/web_router.gr.dart';
import '../../web/components/web_no_wallet.dart';
import '../providers/my_stores_provider.dart';

class WebDstScreen extends BaseScreen {
  const WebDstScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("DST Auctions"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final address = ref.read(webSessionProvider).keypair?.public;
    final storeData = ref.watch(myStoresProvider);

    if (address == null) {
      return const WebNotWallet();
    }

    return storeData.when(
      error: (_, __) => const Text("Error."),
      loading: () => const CenteredLoader(),
      data: (stores) {
        if (stores.isEmpty) {
          return Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "No Store",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("You haven't created a store yet."),
                    ),
                    AppButton(
                      label: "Create Store",
                      onPressed: () {
                        AutoRouter.of(context).push(CreateStoreScreenRoute(accountId: ""));
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];

                  return ListTile(
                    title: Text(store.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      AutoRouter.of(context).push(StoreScreenRoute(slug: store.slug));
                    },
                  );
                }),
            const Divider(),
            AppButton(
              label: "Create New Store",
              onPressed: () {
                AutoRouter.of(context).push(CreateStoreScreenRoute(accountId: ""));
              },
            )
          ],
        );
      },
    );
  }
}
