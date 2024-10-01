import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../models/chat_message.dart';
import '../providers/chat_list_provider_interface.dart';
import '../providers/shop_chat_list_provider.dart';
import '../providers/seller_chat_list_provider.dart';
import '../providers/web_seller_chat_list_provider.dart';
import '../providers/web_shop_chat_list_provider.dart';
import '../../../utils/dates.dart';
import 'package:context_menus/context_menus.dart';
import '../../../utils/toast.dart';

class ShopChatList extends BaseComponent {
  final String identifier;
  final bool isSeller;
  final bool isThirdParty;
  const ShopChatList({
    super.key,
    required this.identifier,
    required this.isThirdParty,
    this.isSeller = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = isThirdParty
        ? isSeller
            ? ref.watch(webSellerChatListProvider(identifier))
            : ref.watch(webShopChatListProvider(identifier))
        : isSeller
            ? ref.watch(sellerChatListProvider(identifier))
            : ref.watch(shopChatListProvider(identifier));

    final provider = isThirdParty
        ? isSeller
            ? ref.read(webSellerChatListProvider(identifier).notifier)
            : ref.read(webShopChatListProvider(identifier).notifier)
        : isSeller
            ? ref.read(sellerChatListProvider(identifier).notifier)
            : ref.read(shopChatListProvider(identifier).notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ChatPoller(
          pollFunction: () {
            provider.fetch();
          },
          // markAsReadFunction: () {
          //   if (isSeller) {
          //   } else {
          //     final address = ref.watch(sessionProvider).currentWallet?.address;

          //     if (address != null) {
          //       ref.read(chatNotificationProvider(address).notifier).markAsRead(identifier);
          //     }
          //   }
          // },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            controller: provider.scrollController,
            itemBuilder: (context, index) {
              final m = messages[index];
              final isLast = index + 1 == messages.length;

              Widget? leading;

              bool continued = false;

              if (index == 0) {
                leading = _DateHeader(message: m);
              } else {
                final previousMessage = messages[index - 1];
                if (m.createdAt.day != previousMessage.createdAt.day) {
                  leading = _DateHeader(message: m);
                }

                if (previousMessage.fromAddress == m.fromAddress && isWithinThirtySeconds(m.createdAt, previousMessage.createdAt)) {
                  continued = true;
                }
              }

              return Column(
                children: [
                  if (leading != null) leading,
                  _ChatMessageCard(
                    message: m,
                    provider: provider,
                    continued: continued,
                    isLast: isLast,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ChatMessageCard extends StatelessWidget {
  final ChatMessage message;
  final bool continued;
  final bool isLast;
  final ChatListProviderInterface provider;

  const _ChatMessageCard({
    required this.message,
    required this.provider,
    this.continued = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: continued ? 0 : 10, bottom: isLast ? 32 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1, right: 4),
            child: Icon(
              Icons.error,
              size: 16,
              color: message.received ? Colors.transparent : Colors.white60,
            ),
          ),
          SizedBox(
            width: 60,
            child: continued
                ? SizedBox.shrink()
                : Text(
                    message.timeLabel,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.4),
                  ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContextMenuRegion(
                  contextMenu: GenericContextMenu(
                    buttonConfigs: [
                      ContextMenuButtonConfig(
                        "Copy Message",
                        icon: Icon(
                          Icons.messenger_outline,
                          size: 16,
                        ),
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: message.message));
                          Toast.message("Message copied to clipboard.");
                        },
                      ),
                      ContextMenuButtonConfig(
                        "Copy Address",
                        icon: Icon(
                          Icons.wallet,
                          size: 16,
                        ),
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: message.fromAddress));
                          Toast.message("Address copied to clipboard.");
                        },
                      ),
                      if (!message.received)
                        ContextMenuButtonConfig(
                          "Resend Message",
                          icon: Icon(
                            Icons.refresh,
                            size: 16,
                          ),
                          onPressed: () async {
                            provider.resendMessage(message.id);
                          },
                        ),
                    ],
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        height: 1.3,
                        color: Colors.white,
                        // fontFamily: kIsWeb ? 'NotoColorEmoji' : null,
                      ),
                      children: [
                        if (!continued)
                          TextSpan(
                            text: "${message.fromLabel} ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        TextSpan(text: message.message, style: TextStyle(color: Colors.white.withOpacity(0.8)))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  final ChatMessage message;

  const _DateHeader({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(bottom: 16),
        child: Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                message.dateLabel,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white60,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
      ),
    );
  }
}

class _ChatPoller extends StatefulWidget {
  final Function pollFunction;
  // final Function markAsReadFunction;
  const _ChatPoller({
    required this.pollFunction,
    // required this.markAsReadFunction,
  });

  @override
  State<_ChatPoller> createState() => __ChatPollerState();
}

class __ChatPollerState extends State<_ChatPoller> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      widget.pollFunction();
      // widget.markAsReadFunction();
    });
    super.initState();
    widget.pollFunction();
    // widget.markAsReadFunction();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
