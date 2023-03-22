import 'package:flutter_riverpod/flutter_riverpod.dart';

class DstTxPendingProvider extends StateNotifier<bool> {
  DstTxPendingProvider() : super(false);

  set(bool val) {
    state = val;
  }
}

final dstTxPendingProvider = StateNotifierProvider<DstTxPendingProvider, bool>(
  (_) => DstTxPendingProvider(),
);
