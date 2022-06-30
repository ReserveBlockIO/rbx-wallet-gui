import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/web/models/web_block.dart';

class WebLatestBlockProvider extends StateNotifier<WebBlock?> {
  final Reader read;

  WebLatestBlockProvider(this.read) : super(null) {
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

    await Future.delayed(Duration(seconds: 30));
    _update();
  }
}

final webLatestBlockProvider =
    StateNotifierProvider<WebLatestBlockProvider, WebBlock?>(
  (ref) => WebLatestBlockProvider(ref.read),
);
