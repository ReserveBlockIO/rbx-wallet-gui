import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart' as web_router;
import 'package:rbx_wallet/features/chat/providers/seller_chat_thread_list_provider.dart';
import 'package:rbx_wallet/features/chat/providers/web_seller_chat_thread_list_provider.dart';
import 'package:rbx_wallet/features/chat/screens/web_seller_chat_screen.dart';

class SellerChatThreadList extends BaseComponent {
  final int shopId;
  const SellerChatThreadList({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = kIsWeb ? ref.watch(webSellerChatThreadListProvider(shopId)) : ref.watch(sellerChatThreadListProvider);

    if (threads.isEmpty) {
      return Center(
        child: Text("No Chats"),
      );
    }
    return ListView.builder(
      itemCount: threads.length,
      itemBuilder: (context, index) {
        final thread = threads[index];

        final message = thread.messages.isEmpty ? null : thread.messages.first;

        return Container(
          key: Key("chat_thread_${thread.user}${message?.message}"),
          decoration: BoxDecoration(
            boxShadow: glowingBox,
          ),
          child: Card(
            color: Colors.black,
            child: ListTile(
              title: Text(thread.user),
              subtitle: Text(
                message?.message ?? "No messages yet",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                if (kIsWeb) {
                  AutoRouter.of(context).push(web_router.WebSellerChatScreenRoute(address: thread.user, shopId: shopId));
                } else {
                  if (thread.isThirdParty) {
                    AutoRouter.of(context).push(WebSellerChatScreenRoute(address: thread.user, shopId: 0));
                  } else {
                    AutoRouter.of(context).push(SellerChatScreenRoute(address: thread.user));
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
