import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../env.dart';
import '../../features/btc_web/models/btc_web_account.dart';
import '../../features/btc_web/services/btc_web_service.dart';
import '../../features/keygen/models/ra_keypair.dart';
import '../../features/nft/providers/minted_nft_list_provider.dart';
import 'package:collection/collection.dart';
import '../models/web_session_model.dart';
import '../../features/transactions/providers/web_transaction_list_provider.dart';
import '../../features/web_shop/providers/web_listed_nfts_provider.dart';
import '../../utils/html_helpers.dart';

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
    if (!kIsWeb) {
      return;
    }
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

        final savedRaKeypair = singleton<Storage>().getMap(Storage.WEB_RA_KEYPAIR);
        final raKeypair = savedRaKeypair != null ? RaKeypair.fromJson(savedRaKeypair) : null;

        final savedBtcKeypair = singleton<Storage>().getMap(Storage.WEB_BTC_KEYPAIR);
        final btcKeyPair = savedBtcKeypair != null ? BtcWebAccount.fromJson(savedBtcKeypair) : null;

        login(keypair, raKeypair, btcKeyPair, andSave: false);
        ref.read(webTransactionListProvider(keypair.address).notifier);

        final savedSelectedWalletType = singleton<Storage>().getString(Storage.WEB_SELECTED_WALLET_TYPE);
        if (savedSelectedWalletType != null) {
          final walletType = WalletType.values.firstWhereOrNull((t) => t.storageName == savedSelectedWalletType);
          if (walletType != null) {
            setSelectedWalletType(walletType, false);
          }
        }
      }
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        final context = rootNavigatorKey.currentContext;

        //TODO set whitelisted routes
        // if (context != null) AutoRouter.of(context).replace(const WebAuthRouter());
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

  void login(Keypair keypair, RaKeypair? raKeypair, BtcWebAccount? btcKeyPair, {bool andSave = true}) {
    final rememberMe = singleton<Storage>().getBool(Storage.REMEMBER_ME) ?? false;
    if (rememberMe) {
      singleton<Storage>().setMap(Storage.WEB_KEYPAIR, keypair.toJson());
      if (raKeypair != null) {
        singleton<Storage>().setMap(Storage.WEB_RA_KEYPAIR, raKeypair.toJson());
      }
      if (btcKeyPair != null) {
        singleton<Storage>().setMap(Storage.WEB_BTC_KEYPAIR, btcKeyPair.toJson());
      }
    }

    state = state.copyWith(
      keypair: keypair,
      raKeypair: raKeypair,
      btcKeypair: btcKeyPair,
      isAuthenticated: true,
    );

    refreshBtcBalanceInfo();

    loop();

    // ref.read(webTransactionListProvider(keypair.address).notifier).init();
  }

  // void setUsingRa(bool value) {
  //   state = state.copyWith(selectedWalletType: value ?  );
  //   ref.read(mintedNftListProvider.notifier).load(1);
  //   ref.read(nftListProvider.notifier).load(1);
  // }

  void setSelectedWalletType(WalletType type, [bool save = true]) {
    state = state.copyWith(selectedWalletType: type);

    if (type != WalletType.btc) {
      ref.read(mintedNftListProvider.notifier).load(1);
      ref.read(nftListProvider.notifier).load(1);
    }

    if (save) {
      singleton<Storage>().setString(Storage.WEB_SELECTED_WALLET_TYPE, type.storageName);
    }
  }

  void setRaKeypair(RaKeypair keypair) {
    state = state.copyWith(raKeypair: keypair);
  }

  void loop() async {
    if (Env.rbxNetworkDown) return;
    getAddress();
    getRaAddress();
    getNfts();
  }

  Future<void> getAddress() async {
    if (Env.rbxNetworkDown) return;

    if (state.keypair == null) {
      return;
    }
    final webAddress = await ExplorerService().getWebAddress(state.keypair!.address);

    state = state.copyWith(
      balance: webAddress.balance,
      balanceLocked: webAddress.balanceLocked,
      balanceTotal: webAddress.balanceTotal,
      adnr: webAddress.adnr,
    );
  }

  Future<void> getRaAddress() async {
    if (Env.rbxNetworkDown) return;

    if (state.raKeypair == null) {
      return;
    }
    final webAddress = await ExplorerService().getWebAddress(state.raKeypair!.address);

    state = state.copyWith(
      raBalance: webAddress.balance,
      raBalanceLocked: webAddress.balanceLocked,
      raBalanceTotal: webAddress.balanceTotal,
      raActivated: webAddress.activated,
    );
  }

  // Future<void> getBalance() async {
  //   if (state.keypair == null) {
  //     return;
  //   }
  //   final balance = await ExplorerService().getBalance(state.keypair!.address);

  //   state = state.copyWith(balance: balance);
  // }

  Future<void> getNfts() async {
    if (Env.rbxNetworkDown) return;

    if (state.keypair == null) {
      return;
    }
    ref.read(nftListProvider.notifier).reloadCurrentPage(address: state.keypair!.address);
    ref.read(webListedNftsProvider.notifier).refresh();
  }

  void updateBtcKeypair(BtcWebAccount? account, bool andSave) {
    state = state.copyWith(
      btcKeypair: account,
      selectedWalletType: WalletType.btc,
    );

    refreshBtcBalanceInfo();

    if (andSave) {
      if (account != null) {
        singleton<Storage>().setMap(Storage.WEB_BTC_KEYPAIR, account.toJson());
      } else {
        singleton<Storage>().remove(Storage.WEB_BTC_KEYPAIR);
      }
    }
  }

  void refreshBtcBalanceInfo() async {
    if (state.btcKeypair != null) {
      final btcBalanceInfo = await BtcWebService().addressInfo(state.btcKeypair!.address);
      state = state.copyWith(
        btcBalanceInfo: btcBalanceInfo,
      );
    }
  }

  Future<void> logout() async {
    singleton<Storage>().remove(Storage.WEB_KEYPAIR);
    singleton<Storage>().remove(Storage.WEB_RA_KEYPAIR);
    singleton<Storage>().remove(Storage.WEB_BTC_KEYPAIR);
    // state = WebSessionModel();

    await Future.delayed(const Duration(milliseconds: 150));

    HtmlHelpers().redirect("/");
    await Future.delayed(const Duration(milliseconds: 150));

    HtmlHelpers().reload();
  }
}

final webSessionProvider = StateNotifierProvider<WebSessionProvider, WebSessionModel>(
  (ref) => WebSessionProvider(ref, WebSessionModel()),
);
