import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/utils.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';
import 'package:rbx_wallet/features/chat/services/chat_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';
import 'package:rbx_wallet/features/transactions/models/transaction_notification.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_notification_provider.dart';

part 'chat_notification_provider.freezed.dart';

@freezed
abstract class ChatNotificationModel with _$ChatNotificationModel {
  const ChatNotificationModel._();

  factory ChatNotificationModel({
    required String identifer,
    required ChatMessage latestMessage,
    @Default(false) bool hasRead,
  }) = _ChatNotificationModel;
}

class ChatNotificationProvider extends StateNotifier<List<ChatNotificationModel>> {
  final Ref ref;
  final bool isSeller;
  final String address;

  bool get isBuyer {
    return !isSeller;
  }

  ChatNotificationProvider(this.ref, this.isSeller, this.address) : super([]) {
    fetch();
  }

  fetch() async {
    final threads = isSeller ? await ChatService().listSellerChatThreads() : await ChatService().listBuyerChatThreads();

    if (isBuyer) {
      if (ref.read(sessionProvider).currentWallet?.address != address) {
        return;
      }
    }

    for (final thread in threads) {
      final existing = state.firstWhereOrNull((item) => item.identifer == thread.user);
      if (existing == null) {
        final lastestIncomingMessage = isSeller
            ? thread.messages.firstWhereOrNull((m) => (m.fromAddress) != address)
            : thread.messages.lastWhereOrNull((m) => (m.fromAddress) != address);
        if (lastestIncomingMessage != null) {
          final entry = ChatNotificationModel(identifer: thread.user, latestMessage: lastestIncomingMessage);
          state = [...state, entry];

          _handleNotification(entry);
        }
      } else {
        if (existing.latestMessage.timestamp != thread.messages.first.timestamp) {
          final lastestIncomingMessage = isSeller
              ? thread.messages.firstWhereOrNull((m) => (m.fromAddress) != address)
              : thread.messages.lastWhereOrNull((m) => (m.fromAddress) != address);
          if (lastestIncomingMessage != null) {
            final entry = ChatNotificationModel(identifer: thread.user, latestMessage: lastestIncomingMessage);
            final index = state.indexWhere((item) => item.identifer == thread.user);
            state = [...state]
              ..removeAt(index)
              ..insert(index, entry);

            _handleNotification(entry);
          }
        }
      }
    }

    await Future.delayed(Duration(seconds: 5));
    fetch();

    // state = threads;
  }

  void _handleNotification(ChatNotificationModel entry) {
    final now = DateTime.now().millisecondsSinceEpoch / 1000;
    final d = entry.latestMessage.timestamp;

    if (now - d > 10) {
      return;
    }

    final notification = TransactionNotification(
        identifier: "message|${entry.latestMessage.fromAddress}|${entry.latestMessage.timestamp}",
        title: "Message from ${entry.latestMessage.fromLabel}",
        body: truncatedText(entry.latestMessage.message, 32),
        icon: Icons.chat_bubble_outline,
        color: AppColorVariant.Secondary,
        onPressed: () {
          final context = rootNavigatorKey.currentContext!;
          if (isSeller) {
            AutoRouter.of(context).push(SellerChatScreenRoute(address: entry.identifer));
          } else {
            AutoRouter.of(context).push(ShopChatScreenRoute(shopUrl: entry.identifer));
          }
        });

    ref.read(transactionNotificationProvider.notifier).add(notification);
  }

  // void markAsRead(String identifier) {
  //   Future.delayed(Duration(milliseconds: 300)).then((_) {
  //     print(identifier);
  //     ChatNotificationModel? entry = state.firstWhereOrNull((item) => item.identifer == identifier);

  //     if (entry != null) {
  //       entry = entry.copyWith(hasRead: true);
  //       final index = state.indexWhere((item) => item.identifer == identifier);

  //       state = [...state]
  //         ..removeAt(index)
  //         ..insert(index, entry);
  //     }
  //   });
  // }
}

final chatNotificationProvider = StateNotifierProvider.family<ChatNotificationProvider, List<ChatNotificationModel>, String>(
  (ref, address) {
    final isSeller = address.contains("|seller");
    address = address.replaceAll("|seller", "").replaceAll("|buyer", "");
    return ChatNotificationProvider(ref, isSeller, address);
  },
);
