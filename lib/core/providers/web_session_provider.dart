import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/models/web_session_model.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/transactions/providers/web_transaction_list_provider.dart';

import '../../app.dart';
import '../../features/keygen/models/keypair.dart';
import '../../features/nft/providers/nft_list_provider.dart';
import '../app_constants.dart';
import '../services/explorer_service.dart';
import '../singletons.dart';
import '../storage.dart';
import 'ready_provider.dart';

class WebSessionProvider extends StateNotifier<WebSessionModel> {
  final Ref ref;

  late final Timer loopTimer;

  WebSessionProvider(this.ref, WebSessionModel model) : super(model) {
    loopTimer = Timer.periodic(const Duration(seconds: REFRESH_TIMEOUT_SECONDS), (_) => loop());
    init();
  }

  void init() {
    state = WebSessionModel();
    final rememberMe = singleton<Storage>().getBool(Storage.REMEMBER_ME) ?? false;
    if (rememberMe) {
      final savedKeypair = singleton<Storage>().getMap(Storage.WEB_KEYPAIR);
      if (savedKeypair != null) {
        final keypair = Keypair.fromJson(savedKeypair);
        login(keypair, false);
      }
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        final context = rootNavigatorKey.currentContext;

        //TODO set whitelisted routes
        if (context != null) AutoRouter.of(context).replace(const WebAuthRouter());
      });
      state = state.copyWith(isAuthenticated: false);
    }
    ref.read(readyProvider.notifier).setReady(true);

    final timezoneName = DateTime.now().timeZoneName.toString();
    state = state.copyWith(timezoneName: timezoneName);
  }

  void setRememberMe(bool val) {
    singleton<Storage>().setBool(Storage.REMEMBER_ME, val);
  }

  void login(Keypair keypair, [bool andSave = true]) {
    final rememberMe = singleton<Storage>().getBool(Storage.REMEMBER_ME) ?? false;
    if (rememberMe) {
      singleton<Storage>().setMap(Storage.WEB_KEYPAIR, keypair.toJson());
    }

    state = state.copyWith(keypair: keypair, isAuthenticated: true);
    loop();

    ref.read(webTransactionListProvider.notifier).load(keypair.public, true);
  }

  void loop() async {
    getAddress();
    getNfts();
  }

  Future<void> getAddress() async {
    if (state.keypair == null) {
      return;
    }
    final webAddress = await ExplorerService().getWebAddress(state.keypair!.public);

    state = state.copyWith(
      balance: webAddress.balance,
      adnr: webAddress.adnr,
    );
  }

  // Future<void> getBalance() async {
  //   if (state.keypair == null) {
  //     return;
  //   }
  //   final balance = await ExplorerService().getBalance(state.keypair!.public);

  //   state = state.copyWith(balance: balance);
  // }

  Future<void> getNfts() async {
    if (state.keypair == null) {
      return;
    }
    ref.read(nftListProvider.notifier).load(1, state.keypair!.email, state.keypair!.public);
  }

  Future<void> logout() async {
    singleton<Storage>().remove(Storage.WEB_KEYPAIR);
    state = WebSessionModel();

    await Future.delayed(const Duration(milliseconds: 150));
  }
}

final webSessionProvider = StateNotifierProvider<WebSessionProvider, WebSessionModel>(
  (ref) => WebSessionProvider(ref, WebSessionModel()),
);
