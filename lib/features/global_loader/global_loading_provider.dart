import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalLoadingProvider extends StateNotifier<bool> {
  GlobalLoadingProvider() : super(false);

  void _set(bool value) {
    state = value;
  }

  void start() {
    _set(true);
  }

  void complete() {
    _set(false);
  }
}

final globalLoadingProvider = StateNotifierProvider<GlobalLoadingProvider, bool>((ref) {
  return GlobalLoadingProvider();
});
