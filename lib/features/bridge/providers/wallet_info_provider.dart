import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/is_active_provider.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/block/block.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

class WalletInfoModel {
  final int blockHeight;
  final int peerCount;
  final bool isSyncing;
  final bool isResyncing;
  final bool isChainSynced;
  final Block? lastestBlock;

  const WalletInfoModel({
    required this.blockHeight,
    required this.peerCount,
    required this.isSyncing,
    required this.isResyncing,
    required this.isChainSynced,
    this.lastestBlock,
  });
}

class WalletInfoProvider extends StateNotifier<WalletInfoModel?> {
  final Reader read;
  Timer? timer;
  WalletInfoProvider(this.read, [WalletInfoModel? model]) : super(model) {
    // fetch();
    // timer = Timer.periodic(
    //   const Duration(seconds: REFRESH_TIMEOUT_SECONDS),
    //   (Timer t) => fetch(),
    // );

    // fetch();
  }

  fetch([bool shouldLoop = true]) async {
    Map<String, dynamic> data = {};
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

    final prevIsSyncing = state == null ? true : state!.isSyncing;

    final int blockHeight = int.parse(data['BlockHeight']);
    final int peerCount = int.parse(data['PeerCount']);
    final bool isSyncing = data['BlocksDownloading'].toString().toLowerCase() == "true";
    final bool isChainSynced = data['IsChainSynced'].toString().toLowerCase() == "true";
    final bool isResyncing = data['IsResyncing'].toString().toLowerCase() == "true";

    final latestBlock = blockHeight > 0 ? await BridgeService().blockInfo(blockHeight) : null;

    final prevBlockHeight = state?.blockHeight;
    final prevPeerCount = state?.peerCount;

    state = WalletInfoModel(
      blockHeight: blockHeight,
      peerCount: peerCount,
      isSyncing: isSyncing,
      lastestBlock: latestBlock,
      isResyncing: isResyncing,
      isChainSynced: isChainSynced,
    );

    read(sessionProvider.notifier).setBlocksAreSyncing(isSyncing);
    read(sessionProvider.notifier).setBlocksAreResyncing(isResyncing);

    if (blockHeight != prevBlockHeight) {
      read(logProvider.notifier).append(
        LogEntry(message: "Current Block Height is $blockHeight."),
      );
    }

    if (peerCount != prevPeerCount) {
      read(logProvider.notifier).append(
        LogEntry(message: "You are connected to $peerCount peers."),
      );
    }

    if (prevIsSyncing && !isSyncing) {
      read(logProvider.notifier).append(
        LogEntry(
          message: "Your wallet is now synced. Thank you for waiting.",
          variant: AppColorVariant.Secondary,
        ),
      );
    }

    read(sessionProvider.notifier).load();

    if (shouldLoop) {
      await Future.delayed(Duration(seconds: REFRESH_TIMEOUT_SECONDS));
      fetch();

      // final isActive = read(isActiveProvider).isActive;
      // await Future.delayed(
      //   Duration(
      //     seconds: isActive ? REFRESH_TIMEOUT_SECONDS : REFRESH_TIMEOUT_SECONDS_INACTIVE,
      //   ),
      // );

      // fetch();
    }
  }
}

final walletInfoProvider = StateNotifierProvider<WalletInfoProvider, WalletInfoModel?>((ref) {
  return WalletInfoProvider(ref.read);
});
