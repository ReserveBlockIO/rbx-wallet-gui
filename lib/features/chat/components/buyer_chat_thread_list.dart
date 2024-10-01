import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/buyer_chat_thread_list_provider.dart';
import '../../remote_shop/providers/connected_shop_provider.dart';

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

        return Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: glowingBox,
            ),
            child: Card(
              color: Colors.black,
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
                onTap: () async {
                  final currentUrl = ref.read(connectedShopProvider).url;
                  if (currentUrl != thread.user) {
                    await ref.read(connectedShopProvider.notifier).loadShop(context, ref, thread.user);
                  }
                  AutoRouter.of(context).push(ShopChatScreenRoute(url: thread.user));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
