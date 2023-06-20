import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebRaPendingFundingProvider extends StateNotifier<List<String>> {
  WebRaPendingFundingProvider() : super([]);

  addAddress(String address) {
    state = [...state, address];
  }
}

final webRaPendingFundingProvider = StateNotifierProvider<WebRaPendingFundingProvider, List<String>>(
  (_) => WebRaPendingFundingProvider(),
);
