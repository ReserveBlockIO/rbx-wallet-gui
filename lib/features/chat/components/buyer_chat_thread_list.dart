import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/chat/providers/buyer_chat_thread_list_provider.dart';
import 'package:rbx_wallet/features/chat/providers/chat_notification_provider.dart';
import 'package:collection/collection.dart';

class BuyerChatThreadList extends BaseComponent {
  const BuyerChatThreadList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final threads = ref.watch(buyerChatThreadListProvider);

    if (threads.isEmpty) {
      return Center(
        child: Text("No Chats"),
      );
    }

    return ListView.builder(
      itemCount: threads.length,
      itemBuilder: (context, index) {
        final thread = threads[index];

        final message = thread.messages.last;

        // final address = ref.watch(sessionProvider).currentWallet?.address;
        // bool hasRead = false;
        // if (address != null) {
        //   final b = ref.watch(chatNotificationProvider(address)).firstWhereOrNull((t) => t.identifer == thread.user);
        //   print(b);
        //   print("****");
        //   if (b != null) {
        //     hasRead = b.hasRead;
        //   }
        // }

        return Card(
          child: ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // if (!hasRead)
                //   Padding(
                //     padding: const EdgeInsets.only(right: 6.0),
                //     child: Container(
                //       width: 12,
                //       height: 12,
                //       decoration: BoxDecoration(
                //         color: Theme.of(context).colorScheme.secondary,
                //         borderRadius: BorderRadius.circular(6.0),
                //       ),
                //     ),
                //   ),
                Text(thread.user),
              ],
            ),
            subtitle: Text(
              message.message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              AutoRouter.of(context).push(ShopChatScreenRoute(shopUrl: thread.user));
            },
          ),
        );
      },
    );
  }
}
