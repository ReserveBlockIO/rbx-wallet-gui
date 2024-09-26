import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/log_entry.dart';

const LOG_HISTORY_LENGTH = 1000;

class LogProvider extends StateNotifier<List<LogEntry>> {
  final Ref ref;
  final ScrollController scrollController = ScrollController();

  LogProvider(this.ref, [List<LogEntry> model = const []]) : super(model);

  void append(LogEntry entry) async {
    // Future.delayed(Duration(milliseconds: 100)).then((_) async {
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      final items = [...state, entry];
      if (items.length > LOG_HISTORY_LENGTH) {
        state = items.getRange(items.length - LOG_HISTORY_LENGTH, items.length).toList();
      } else {
        state = items;
      }
    });
    if (scrollController.hasClients) {
      await Future.delayed(const Duration(milliseconds: 300));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
    // });
  }

  void clear() {
    state = [];
  }
}

final logProvider = StateNotifierProvider<LogProvider, List<LogEntry>>((ref) {
  return LogProvider(ref);
});
