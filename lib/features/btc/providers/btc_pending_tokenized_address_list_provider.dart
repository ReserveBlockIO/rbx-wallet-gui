import 'package:flutter_riverpod/flutter_riverpod.dart';

class BtcPendingTokenizedAddressListProvider extends StateNotifier<List<String>> {
  BtcPendingTokenizedAddressListProvider() : super([]);

  addScId(String id) {
    state = [...state, id];
  }
}

final btcPendingTokenizedAddressListProvider = StateNotifierProvider<BtcPendingTokenizedAddressListProvider, List<String>>((ref) {
  return BtcPendingTokenizedAddressListProvider();
});
