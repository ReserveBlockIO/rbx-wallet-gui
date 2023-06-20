import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebRaPendingActivationProvider extends StateNotifier<List<String>> {
  WebRaPendingActivationProvider() : super([]);

  addAddress(String address) {
    state = [...state, address];
  }
}

final webRaPendingActivationProvider = StateNotifierProvider<WebRaPendingActivationProvider, List<String>>(
  (_) => WebRaPendingActivationProvider(),
);
