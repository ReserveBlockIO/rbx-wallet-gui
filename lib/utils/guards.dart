import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_auth_token_provider.dart';

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

Future<bool> guardWebAuthorized(WidgetRef ref, String expectedAddress) async {
  final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;

  if (address != expectedAddress) {
    return false;
  }

  final token = ref.read(webAuthTokenProvider);

  if (token != null && !token.isExpired && token.address == address) {
    return true;
  }

  final newToken = await ref.read(webAuthTokenProvider.notifier).authorize();

  if (newToken != null) {
    return true;
  }

  return false;
}

Future<bool> guardWebAuthorizedFromProvider(Ref ref, String? expectedAddress, [bool withError = true]) async {
  if (expectedAddress == null) {
    print("Address was null");
    return false;
  }
  final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;

  if (address != expectedAddress) {
    if (withError) {
      Toast.error("Not authorized (incorrect address).");
    }
    return false;
  }

  final token = ref.read(webAuthTokenProvider);

  if (token != null && !token.isExpired && token.address == address) {
    return true;
  }

  final newToken = await ref.read(webAuthTokenProvider.notifier).authorize();

  if (newToken != null) {
    return true;
  }

  if (withError) {
    Toast.error("Not authorized (token invalid).");
  }

  return false;
}
