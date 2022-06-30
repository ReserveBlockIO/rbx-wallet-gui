import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/nft/providers/web_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/screens/web_nft_detail_screen.dart';

class WebNftListScreen extends BaseScreen {
  const WebNftListScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("NFTs"),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
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
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context)
                  .push(WebNftDetailScreenRoute(identifier: nft.id));
            },
          );
        });
  }
}
