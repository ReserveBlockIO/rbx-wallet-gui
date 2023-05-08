import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadyProvider extends StateNotifier<bool> {
  ReadyProvider([value = false]) : super(value);

  setReady([val = true]) {
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      state = val;
    });
  }
}

final readyProvider = StateNotifierProvider<ReadyProvider, bool>(
  (ref) => ReadyProvider(),
);
