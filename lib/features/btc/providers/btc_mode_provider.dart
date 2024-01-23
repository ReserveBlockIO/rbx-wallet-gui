import 'package:flutter_riverpod/flutter_riverpod.dart';

class BtcModeProvider extends StateNotifier<bool> {
  BtcModeProvider(bool initialState) : super(initialState);

  void set(bool value) {
    state = value;
  }

  void toggle() {
    set(!state);
  }
}

final btcModeProvider = StateNotifierProvider<BtcModeProvider, bool>((ref) {
  const initialState = false;
  return BtcModeProvider(initialState);
});
