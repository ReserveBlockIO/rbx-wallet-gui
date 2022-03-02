import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

class WalletInfoModel {
  final int blockHeight;
  final int peerCount;

  const WalletInfoModel({required this.blockHeight, required this.peerCount});
}

class WalletInfoProvider extends StateNotifier<WalletInfoModel?> {
  final Reader read;
  Timer? timer;
  WalletInfoProvider(this.read, [WalletInfoModel? model]) : super(model) {
    timer = Timer.periodic(
        Duration(seconds: REFRESH_TIMEOUT_SECONDS), (Timer t) => fetch());
  }

  fetch() async {
    String data = "";
    try {
      data = await BridgeService().walletInfo();
    } catch (e) {
      print(e);
      print("fetch error");
      return;
    }

    if (data.isEmpty) {
      return;
    }

    final info = data.split(':');
    final blockHeight = int.parse(info.first);
    final peerCount = int.parse(info.last);

    state = WalletInfoModel(blockHeight: blockHeight, peerCount: peerCount);
    read(logProvider.notifier).append(
      LogEntry(message: "Current Block Height is $blockHeight."),
    );

    read(logProvider.notifier).append(
      LogEntry(message: "You are connected to $peerCount peers."),
    );
  }
}

final walletInfoProvider =
    StateNotifierProvider<WalletInfoProvider, WalletInfoModel?>((ref) {
  return WalletInfoProvider(ref.read);
});
