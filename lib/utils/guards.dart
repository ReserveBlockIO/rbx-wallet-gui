import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

bool guardWalletIsSynced(Reader read) {
  if (read(walletInfoProvider) == null ||
      !read(walletInfoProvider)!.isChainSynced) {
    Toast.error("Please wait until your wallet is synced with the network");
    return false;
  }

  return true;
}

bool guardWalletIsNotResyncing(Reader read, [bool showMessage = true]) {
  return true;
  // if (read(sessionProvider).blocksAreResyncing) {
  //   if (showMessage) {
  //     Toast.error("Please wait until your wallet is resynced with the network");
  //   }
  //   return false;
  // }

  // return true;
}
