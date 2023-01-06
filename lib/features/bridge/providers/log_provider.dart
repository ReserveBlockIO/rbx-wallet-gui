import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';

class LogProvider extends StateNotifier<List<LogEntry>> {
  final Reader read;
  final ScrollController scrollController = ScrollController();

  LogProvider(this.read, [List<LogEntry> model = const []]) : super(model);

  void append(LogEntry entry) async {
    state = [...state, entry];
    if (scrollController.hasClients) {
      await Future.delayed(Duration(milliseconds: 300));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent - 24,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void clear() {
    state = [];
  }
}

final logProvider = StateNotifierProvider<LogProvider, List<LogEntry>>((ref) {
  return LogProvider(ref.read);
});
