import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebMobileAccountInfoVisibleProvider extends StateNotifier<int?> {
  WebMobileAccountInfoVisibleProvider() : super(null);

  setVisible(int? index) {
    state = index;
  }

  clear() {
    state = null;
  }
}

final webMobileAccountInfoVisibleProvider = StateNotifierProvider<WebMobileAccountInfoVisibleProvider, int?>((ref) {
  return WebMobileAccountInfoVisibleProvider();
});
