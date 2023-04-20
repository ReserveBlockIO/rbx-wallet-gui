import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/bridge/providers/wallet_info_provider.dart';
import 'toast.dart';

bool guardWalletIsSynced(Ref ref) {
  if (ref.read(walletInfoProvider) == null || !ref.read(walletInfoProvider)!.isChainSynced) {
    Toast.error("Please wait until your wallet is synced with the network");
    return false;
  }

  return true;
}

bool widgetGuardWalletIsSynced(WidgetRef ref) {
  if (ref.read(walletInfoProvider) == null || !ref.read(walletInfoProvider)!.isChainSynced) {
    Toast.error("Please wait until your wallet is synced with the network");
    return false;
  }

  return true;
}

bool widgetGuardWalletIsNotResyncing(WidgetRef ref, [bool showMessage = true]) {
  return true;
  // if (ref.read(sessionProvider).blocksAreResyncing) {
  //   if (showMessage) {
  //     Toast.error("Please wait until your wallet is resynced with the network");
  //   }
  //   return false;
  // }

  // return true;
}

bool guardWalletIsNotResyncing(Ref ref, [bool showMessage = true]) {
  return true;
  // if (ref.read(sessionProvider).blocksAreResyncing) {
  //   if (showMessage) {
  //     Toast.error("Please wait until your wallet is resynced with the network");
  //   }
  //   return false;
  // }

  // return true;
}
