import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/chat/components/new_chat_message.dart';
import 'package:rbx_wallet/features/chat/components/shop_chat_list.dart';
import 'package:rbx_wallet/features/chat/providers/shop_chat_list_provider.dart';
import 'package:rbx_wallet/features/chat/providers/web_shop_chat_list_provider.dart';
import 'package:rbx_wallet/features/remote_shop/providers/remote_shop_detail_provider.dart';

class ShopChatScreen extends BaseScreen {
  final String url;
  const ShopChatScreen({Key? key, @PathParam("url") required this.url}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(url));

    return data.when(
      data: (shop) => shop != null
          ? AppBar(
              title: Text("Chatting with ${shop.name}"),
              centerTitle: true,
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  onPressed: () {
                    if (shop.isThirdParty) {
                      ref.read(webShopChatListProvider(url).notifier).fetch();
                    } else {
                      ref.read(shopChatListProvider(url).notifier).fetch();
                    }
                  },
                  icon: Icon(Icons.refresh),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    final confirmed = await ConfirmDialog.show(
                      title: "Delete Chat Thread",
                      body: "Are you sure you want to delete this chat thread locally?",
                      destructive: true,
                      confirmText: "Delete",
                      cancelText: "Cancel",
                    );

                    if (confirmed == true) {
                      final success = await ref.read(shopChatListProvider(url).notifier).deleteThread();
                      if (success) {
                        Navigator.of(context).pop();
                        return;
                      }
                    }
                  },
                )
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
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(remoteShopDetailProvider(url));

    return data.when(
      data: (shop) => shop != null
          ? Column(
              children: [
                Expanded(
                  child: ShopChatList(
                    identifier: url,
                    isThirdParty: shop.isThirdParty,
                  ),
                ),
                NewChatMessage(
                  identifier: url,
                  isThirdParty: shop.isThirdParty,
                )
              ],
            )
          : const Center(child: Text("Error")),
      error: (_, __) => const Text("Error"),
      loading: () => const CenteredLoader(),
    );
  }
}
