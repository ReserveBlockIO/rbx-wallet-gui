import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/singletons.dart';
import '../../../core/storage.dart';
import '../../../core/utils.dart';
import '../models/auth_token.dart';
import '../services/web_shop_service.dart';
import '../../../utils/toast.dart';

class WebAuthTokenProvider extends StateNotifier<AuthToken?> {
  final Ref ref;

  WebAuthTokenProvider(this.ref) : super(null);

  Future<AuthToken?> authorize() async {
    final message = generateRandomString(32);

    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      Toast.error("No address.");
      return null;
    }

    final privateKey = kIsWeb ? ref.read(webSessionProvider).keypair?.private : ref.read(sessionProvider).currentWallet?.privateKey;
    if (privateKey == null) {
      Toast.error("No private key.");
      return null;
    }

    final publicKey = kIsWeb ? ref.read(webSessionProvider).keypair?.public : ref.read(sessionProvider).currentWallet?.publicKey;
    if (publicKey == null) {
      Toast.error("No public key.");
      return null;
    }

    final newToken = await WebShopService().authorize(
      message: message,
      address: address,
      privateKey: privateKey,
      publicKey: publicKey,
    );

    if (newToken != null) {
      state = newToken;
      singleton<Storage>().setString(Storage.WEB_AUTH_TOKEN, newToken.token);
      return newToken;
    }

    return null;
  }

  void addEmail(String email) {
    state = state?.copyWith(email: email);
  }
}

final webAuthTokenProvider = StateNotifierProvider<WebAuthTokenProvider, AuthToken?>(
  (ref) => WebAuthTokenProvider(ref),
);
