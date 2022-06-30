import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/ready_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';

class WebSessionModel {
  final Keypair? keypair;
  final double? balance;

  const WebSessionModel({
    this.keypair,
    this.balance,
  });

  bool get isAuthenticated {
    return keypair != null;
  }

  WebSessionModel copyWith({
    Keypair? keypair,
    double? balance,
  }) {
    return WebSessionModel(
      keypair: keypair ?? this.keypair,
      balance: balance ?? this.balance,
    );
  }
}

class WebSessionProvider extends StateNotifier<WebSessionModel> {
  final Reader read;

  static const _initial = WebSessionModel();

  WebSessionProvider(this.read, [WebSessionModel model = _initial])
      : super(model) {
    init();
  }

  void init() {
    final savedKeypair = singleton<Storage>().getMap(Storage.WEB_KEYPAIR);
    if (savedKeypair != null) {
      final keypair = Keypair.fromJson(savedKeypair);
      login(keypair, false);
    }
    read(readyProvider.notifier).setReady(true);
  }

  void login(Keypair keypair, [bool andSave = true]) {
    if (andSave) {
      singleton<Storage>().setMap(Storage.WEB_KEYPAIR, keypair.toJson());
    }

    state = state.copyWith(keypair: keypair);
    loop();
  }

  void loop() async {
    getBalance();
    await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
    loop();
  }

  Future<void> getBalance() async {
    if (state.keypair == null) {
      return;
    }
    final balance = await ExplorerService().getBalance(state.keypair!.public);

    state = state.copyWith(balance: balance);
  }

  Future<void> logout() async {
    singleton<Storage>().remove(Storage.WEB_KEYPAIR);
    state = _initial;

    await Future.delayed(const Duration(milliseconds: 150));
  }
}

final webSessionProvider =
    StateNotifierProvider<WebSessionProvider, WebSessionModel>(
  (ref) => WebSessionProvider(ref.read),
);
