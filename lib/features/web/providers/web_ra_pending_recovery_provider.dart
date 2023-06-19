import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebRaPendingRecoveryProvider extends StateNotifier<List<String>> {
  WebRaPendingRecoveryProvider() : super([]);

  addAddress(String address) {
    state = [...state, address];
  }
}

final webRaPendingRecoveryProvider = StateNotifierProvider<WebRaPendingRecoveryProvider, List<String>>(
  (_) => WebRaPendingRecoveryProvider(),
);
