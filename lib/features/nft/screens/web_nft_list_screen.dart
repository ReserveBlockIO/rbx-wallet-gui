import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/nft/providers/web_nft_list_provider.dart';
import 'package:rbx_wallet/features/web/components/web_no_wallet.dart';

class WebNftListScreen extends BaseScreen {
  const WebNftListScreen({Key? key})
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
      title: const Text("NFTs"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final keypair = ref.read(webSessionProvider).keypair;

    if (keypair == null) {
      return const WebNotWallet();
    }

    final nfts = ref.watch(webnftListProvider);

    return ListView.builder(
        itemCount: nfts.length,
        itemBuilder: (context, index) {
          final nft = nfts[index];
          return ListTile(
            title: Text(nft.name),
            subtitle: Text(
              nft.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context).push(WebNftDetailScreenRoute(identifier: nft.id));
            },
          );
        });
  }
}
