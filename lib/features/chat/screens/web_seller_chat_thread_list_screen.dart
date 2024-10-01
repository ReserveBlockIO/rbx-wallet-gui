import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/seller_chat_thread_list.dart';
import '../providers/web_seller_chat_thread_list_provider.dart';

import '../../../core/base_screen.dart';

class WebSellerChatThreadListScreen extends BaseScreen {
  final int shopId;
  const WebSellerChatThreadListScreen({
    Key? key,
    @PathParam("shopId") required this.shopId,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Chats"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {
            ref.read(webSellerChatThreadListProvider(shopId).notifier).fetch();
          },
          icon: Icon(Icons.refresh),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _ThreadPoller(
          pollFunction: () {
            ref.read(webSellerChatThreadListProvider(shopId).notifier).fetch();
          },
        ),
        Expanded(
            child: SellerChatThreadList(
          shopId: shopId,
        )),
      ],
    );
  }
}

class _ThreadPoller extends StatefulWidget {
  final Function pollFunction;
  const _ThreadPoller({required this.pollFunction});

  @override
  State<_ThreadPoller> createState() => __ThreadPollerState();
}

class __ThreadPollerState extends State<_ThreadPoller> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      widget.pollFunction();
    });
    super.initState();
    widget.pollFunction();
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
