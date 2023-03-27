import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/features/chat/components/new_chat_message.dart';
import 'package:rbx_wallet/features/chat/components/shop_chat_list.dart';
import 'package:rbx_wallet/features/chat/providers/shop_chat_list_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/remote_shop_detail_provider.dart';

class ShopChatScreen extends BaseScreen {
  final String shopUrl;
  const ShopChatScreen({Key? key, @PathParam("url") required this.shopUrl}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(shopUrl));

    return data.when(
      data: (shop) => shop != null
          ? AppBar(
              title: Text("Chatting with ${shop.name}"),
              actions: [
                IconButton(
                  onPressed: () {
                    ref.read(shopChatListProvider(shopUrl).notifier).fetch();
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            )
          : AppBar(
              title: const Text("Error"),
            ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text(""),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(shopUrl));

    return data.when(
      data: (shop) => shop != null
          ? Column(
              children: [
                Expanded(
                  child: ShopChatList(
                    shopUrl: shopUrl,
                  ),
                ),
                NewChatMessage(
                  shopUrl: shopUrl,
                )
              ],
            )
          : const Center(child: Text("Error")),
      error: (_, __) => const Text("Error"),
      loading: () => const CenteredLoader(),
    );
  }
}
