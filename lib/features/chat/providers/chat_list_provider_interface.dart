import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/chat/models/chat_message.dart';

abstract class ChatListProviderInterface extends StateNotifier<List<ChatMessage>> {
  final Ref ref;
  final String identifier;

  final newMessageController = TextEditingController();
  final newMessageFocusNode = FocusNode();

  ChatListProviderInterface(this.ref, this.identifier) : super([]);

  Future<void> fetch();

  Future<void> sendMessage();
}
