import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/env.dart';

import '../../../core/services/explorer_service.dart';
import '../models/web_block.dart';

class WebLatestBlockProvider extends StateNotifier<WebBlock?> {
  final Ref ref;

  WebLatestBlockProvider(this.ref) : super(null) {
    _init();
  }

  void _init() {
    _update();
  }

  Future<void> _update() async {
    final block = await ExplorerService().getLatestBlock();

    if (block != null) {
      state = block;
    }

    await Future.delayed(const Duration(seconds: 30));
    _update();
  }
}

final webLatestBlockProvider = StateNotifierProvider<WebLatestBlockProvider, WebBlock?>(
  (ref) => WebLatestBlockProvider(ref),
);
