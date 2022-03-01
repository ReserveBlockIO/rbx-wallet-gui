import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

enum BridgeStatus {
  Loading,
  Online,
  Offline,
}

class StatusProvider extends StateNotifier<BridgeStatus> {
  final Reader read;

  StatusProvider(this.read, [BridgeStatus model = BridgeStatus.Loading])
      : super(model) {
    _init();
  }

  Future<void> _init() async {
    read(logProvider.notifier).append(LogEntry(message: "Connecting..."));
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    final status = await BridgeService().status();

    final prevState = state;

    if (status == 'Online') {
      state = BridgeStatus.Online;

      if (state != prevState) {
        read(logProvider.notifier)
            .append(LogEntry(message: "You are connected"));

        read(walletInfoProvider.notifier).fetch();
      }
    } else {
      print("Got unexpected status");
      state = BridgeStatus.Offline;
      read(logProvider.notifier).append(
        LogEntry(message: "You are disconnected"),
      );
    }

    await Future.delayed(Duration(seconds: 10));
    _checkStatus();
  }
}

final statusProvider =
    StateNotifierProvider<StatusProvider, BridgeStatus>((ref) {
  return StatusProvider(ref.read);
});
