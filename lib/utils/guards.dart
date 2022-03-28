import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

bool guardWalletIsSynced(Reader read) {
  if (read(sessionProvider).blocksAreSyncing) {
    Toast.error("Please wait until your wallet is synced with the network");
    return false;
  }

  return true;
}

bool guardWalletIsNotResyncing(Reader read, [bool showMessage = true]) {
  if (read(sessionProvider).blocksAreResyncing) {
    if (showMessage) {
      Toast.error("Please wait until your wallet is resynced with the network");
    }
    return false;
  }

  return true;
}
