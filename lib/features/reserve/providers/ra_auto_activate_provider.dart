import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReserveAccountAutoActivateProvider extends StateNotifier<Map<String, dynamic>> {
  ReserveAccountAutoActivateProvider() : super({});

  add(String txHash, String address, String password) {
    final data = {
      'address': address,
      'password': password,
    };

    state = {...state, txHash: data};
  }

  remove(String txHash) {
    state = {...state}..remove(txHash);
  }
}

final reserveAccountAutoActivateProvider = StateNotifierProvider<ReserveAccountAutoActivateProvider, Map<String, dynamic>>((ref) {
  return ReserveAccountAutoActivateProvider();
});
