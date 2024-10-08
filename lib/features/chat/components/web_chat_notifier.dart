import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils.dart';
import '../models/latest_chat_message.dart';
import '../services/web_chat_service.dart';
import '../../transactions/models/transaction_notification.dart';
import '../../transactions/providers/transaction_notification_provider.dart';

class WebChatNotifier extends StatefulWidget {
  final String? address;
  final WidgetRef ref;
  const WebChatNotifier({
    super.key,
    required this.ref,
    required this.address,
  });

  @override
  State<WebChatNotifier> createState() => _WebChatNotifierState();
}

class _WebChatNotifierState extends State<WebChatNotifier> {
  late final Timer timer;

  List<LatestChatMessage> messages = [];

  Future<void> fetch() async {
    if (!kIsWeb) {
      return;
    }

    if (widget.address == null) {
      return;
    }

    final results = await WebChatService().listNewMessages(widget.address!);

    if (results != null) {
      for (final m in results) {
        final isNew = messages.indexWhere((mess) => mess.uuid == m.uuid) < 0;
        if (isNew) {
          handleNewMessage(m);
        }
      }

      messages = [...messages, ...results];
    }
  }

  void handleNewMessage(LatestChatMessage message) {
    final notification = TransactionNotification(
      identifier: "message|${message.uuid}",
      title: message.fromAddress,
      body: truncatedText(message.body, 64),
      icon: Icons.chat_bubble_outline,
      color: AppColorVariant.Secondary,
      // onPressed: () {
      //   if (kIsWeb) {
      //   } else {
      //     AutoRouter.of(context).push(SellerChatScreenRoute(address: entry.identifer));
      //   }

      // }
    );
    widget.ref.read(transactionNotificationProvider.notifier).add(notification);
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 30), (timer) {
      fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
