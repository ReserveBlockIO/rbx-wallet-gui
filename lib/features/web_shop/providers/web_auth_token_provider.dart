import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/utils.dart';
import 'package:rbx_wallet/features/web_shop/models/auth_token.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebAuthTokenProvider extends StateNotifier<List<AuthToken>> {
  final Ref ref;

  WebAuthTokenProvider(this.ref) : super([]);

  Future<bool> authorize() async {
    final message = generateRandomString(32);

    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.public : ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      Toast.error("No address.");
      return false;
    }

    final privateKey = kIsWeb ? ref.read(webSessionProvider).keypair?.privateCorrected : ref.read(sessionProvider).currentWallet?.privateKey;
    if (privateKey == null) {
      Toast.error("No private key.");
      return false;
    }

    final publicKey = kIsWeb ? ref.read(webSessionProvider).keypair?.publicInflated : ref.read(sessionProvider).currentWallet?.publicKey;
    if (publicKey == null) {
      Toast.error("No public key.");
      return false;
    }

    final newToken = await WebShopService().authorize(
      message: message,
      address: address,
      privateKey: privateKey,
      publicKey: publicKey,
    );

    if (newToken != null) {
      state = [...state, newToken];
      return true;
    }

    return false;
  }
}

final webAuthTokenProvider = StateNotifierProvider<WebAuthTokenProvider, List<AuthToken>>(
  (ref) => WebAuthTokenProvider(ref),
);
