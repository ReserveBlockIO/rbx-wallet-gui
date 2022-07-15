import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/dsts/providers/my_stores_provider.dart';
import 'package:rbx_wallet/features/web/components/web_no_wallet.dart';

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
      error: (_, __) => Text("Error."),
      loading: () => CenteredLoader(),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
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
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      AutoRouter.of(context).push(StoreScreenRoute(slug: store.slug));
                    },
                  );
                }),
            Divider(),
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
