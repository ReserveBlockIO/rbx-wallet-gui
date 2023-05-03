import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class ReadyProvider extends StateNotifier<bool> {
  ReadyProvider([value = false]) : super(value);

  setReady([val = true]) {
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      state = val;
      if (kIsWeb) {
        FlutterNativeSplash.remove();
      }
    });
  }
}

final readyProvider = StateNotifierProvider<ReadyProvider, bool>(
  (ref) => ReadyProvider(),
);
