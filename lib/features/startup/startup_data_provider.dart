import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/startup/startup_data.dart';

class StartupDataProvider extends StateNotifier<StartupData?> {
  StartupDataProvider() : super(null);

  void set(StartupData? value) {
    state = value;
  }
}

final startupDataProvider = StateNotifierProvider<StartupDataProvider, StartupData?>((ref) {
  return StartupDataProvider();
});
