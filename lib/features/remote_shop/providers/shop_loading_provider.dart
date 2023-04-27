import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopLoadingProvider extends StateNotifier<String?> {
  ShopLoadingProvider() : super(null);

  void set(String value) {
    state = value;
  }

  void start([String? message]) {
    state = message ?? "Loading...";
  }

  void complete() {
    state = null;
  }
}

final shopLoadingProvider = StateNotifierProvider<ShopLoadingProvider, String?>((ref) {
  return ShopLoadingProvider();
});
