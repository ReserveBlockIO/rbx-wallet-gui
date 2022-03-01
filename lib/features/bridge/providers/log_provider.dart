import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';

class LogProvider extends StateNotifier<List<LogEntry>> {
  final Reader read;

  LogProvider(this.read, [List<LogEntry> model = const []]) : super(model);

  void append(LogEntry entry) {
    state = [...state, entry];
  }

  void clear() {
    state = [];
  }
}

final logProvider = StateNotifierProvider<LogProvider, List<LogEntry>>((ref) {
  return LogProvider(ref.read);
});
