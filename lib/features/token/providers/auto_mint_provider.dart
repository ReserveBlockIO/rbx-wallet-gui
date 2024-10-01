import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoMintProvider extends StateNotifier<Map<String, dynamic>> {
  AutoMintProvider() : super({});

  add(String smartContractId, String fromAddress, double amount) {
    final data = {
      'amount': amount,
      'fromAddress': fromAddress,
    };

    state = {...state, smartContractId: data};
  }

  remove(String smartContractId) {
    state = {...state}..remove(smartContractId);
  }
}

final autoMintProvider = StateNotifierProvider<AutoMintProvider, Map<String, dynamic>>((ref) {
  return AutoMintProvider();
});
