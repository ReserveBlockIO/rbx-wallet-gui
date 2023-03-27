import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/chat/providers/seller_chat_thread_list_provider.dart';

class SellerChatThreadList extends BaseComponent {
  const SellerChatThreadList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = ref.watch(sellerChatThreadListProvider);

    if (threads.isEmpty) {
      return Center(
        child: Text("No Chats"),
      );
    }

    return ListView.builder(
      itemCount: threads.length,
      itemBuilder: (context, index) {
        final thread = threads[index];

        final message = thread.messages.first; // latest??

        return Card(
          child: ListTile(
            title: Text(thread.user),
            subtitle: Text(
              message.message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context).push(SellerChatScreenRoute(address: thread.user));
            },
          ),
        );
      },
    );
  }
}
