import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadyProvider extends StateNotifier<bool> {
  ReadyProvider([value = false]) : super(value);

  setReady([val = true]) {
    state = val;
  }
}

final readyProvider = StateNotifierProvider<ReadyProvider, bool>(
  (ref) => ReadyProvider(),
);
