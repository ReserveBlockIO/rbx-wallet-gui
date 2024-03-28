import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../block/block.dart';
import '../../metrics/models/network_metrics.dart';
import '../models/log_entry.dart';
import '../services/bridge_service.dart';
import 'log_provider.dart';

class WalletInfoModel {
  final int blockHeight;
  final int peerCount;
  final bool isSyncing;
  final bool isResyncing;
  final bool isChainSynced;
  final Block? lastestBlock;
  final bool duplicateValidatorIp;
  final bool duplicateValidatorAddress;
  final bool connectedToMother;
  final String? blockchainVersion;
  final NetworkMetrics? networkMetrics;

  const WalletInfoModel({
    required this.blockHeight,
    required this.peerCount,
    required this.isSyncing,
    required this.isResyncing,
    required this.isChainSynced,
    required this.duplicateValidatorIp,
    required this.duplicateValidatorAddress,
    this.connectedToMother = false,
    this.lastestBlock,
    this.blockchainVersion,
    this.networkMetrics,
  });
}

class WalletInfoProvider extends StateNotifier<WalletInfoModel?> {
  final Ref ref;
  Timer? timer;
  WalletInfoProvider(this.ref, [WalletInfoModel? model]) : super(model) {
    // fetch();
    // timer = Timer.periodic(
    //   const Duration(seconds: REFRESH_TIMEOUT_SECONDS),
    //   (Timer t) => fetch(),
    // );

    // fetch();
  }

  infoLoop([bool inLoop = true]) async {
    if (kIsWeb) return;
    if (!ref.read(sessionProvider).cliStarted) {
      if (inLoop) {
        await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
        infoLoop(true);
      }
      return;
    }

    Map<String, dynamic> data = {};
    try {
      data = await BridgeService().walletInfo();
    } catch (e) {
      print(e);
      print("fetch error");
      if (inLoop) {
        await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
        infoLoop(true);
      }
      return;
    }

    final networkMetrics = await BridgeService().networkMetrics();

    if (data.isNotEmpty) {
      final prevIsChainSynced = state == null ? false : state!.isChainSynced;

      final int blockHeight = int.parse(data['BlockHeight']);
      final int peerCount = int.parse(data['PeerCount']);
      final bool isSyncing = data['BlocksDownloading'].toString().toLowerCase() == "true";
      final bool isChainSynced = data['IsChainSynced'].toString().toLowerCase() == "true";
      final bool isResyncing = data['IsResyncing'].toString().toLowerCase() == "true";
      final bool duplicateValidatorIp = data['DuplicateValIP'].toString().toLowerCase() == "true";
      final bool duplicateValidatorAddress = data['DuplicateValAddress'].toString().toLowerCase() == "true";
      final bool connectedToMother = data['ConnectedToMother'].toString().toLowerCase() == 'true';
      final String blockchainVersion = data['BlockVersion'].toString();

      final latestBlock = blockHeight > 0 ? await BridgeService().blockInfo(blockHeight, state?.lastestBlock) : null;

      final prevBlockHeight = state?.blockHeight;
      final prevPeerCount = state?.peerCount;

      state = WalletInfoModel(
        blockHeight: blockHeight,
        peerCount: peerCount,
        isSyncing: isSyncing,
        lastestBlock: latestBlock,
        isResyncing: isResyncing,
        isChainSynced: isChainSynced,
        duplicateValidatorIp: duplicateValidatorIp,
        duplicateValidatorAddress: duplicateValidatorAddress,
        connectedToMother: connectedToMother,
        blockchainVersion: blockchainVersion,
        networkMetrics: networkMetrics,
      );

      ref.read(sessionProvider.notifier).setBlocksAreSyncing(isSyncing);
      ref.read(sessionProvider.notifier).setBlocksAreResyncing(isResyncing);

      if (blockHeight != prevBlockHeight) {
        ref.read(logProvider.notifier).append(
              LogEntry(message: "Current Block Height is $blockHeight."),
            );
      }

      if (peerCount != prevPeerCount) {
        ref.read(logProvider.notifier).append(
              LogEntry(message: "You are connected to $peerCount peers."),
            );
      }

      if (!prevIsChainSynced && isChainSynced) {
        ref.read(logProvider.notifier).append(
              LogEntry(
                message: "Your wallet is now synced. Thank you for waiting.",
                variant: AppColorVariant.Secondary,
              ),
            );
      }
    }

    if (inLoop) {
      await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
      infoLoop(true);
    }
  }
}

final walletInfoProvider = StateNotifierProvider<WalletInfoProvider, WalletInfoModel?>((ref) {
  return WalletInfoProvider(ref);
});
