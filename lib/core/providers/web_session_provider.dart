import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/ready_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

class WebSessionModel {
  final Keypair? keypair;
  final double? balance;
  final bool isAuthenticated;
  final String timezoneName;

  const WebSessionModel({
    this.keypair,
    this.balance,
    this.isAuthenticated = false,
    this.timezoneName = "America/Los_Angeles",
  });

  WebSessionModel copyWith({
    Keypair? keypair,
    double? balance,
    bool? isAuthenticated,
    String? timezoneName,
  }) {
    return WebSessionModel(
      keypair: keypair ?? this.keypair,
      balance: balance ?? this.balance,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      timezoneName: timezoneName ?? this.timezoneName,
    );
  }

  Wallet? get currentWallet {
    if (keypair == null) return null;
    return Wallet(
      id: 0,
      publicKey: keypair!.publicInflated,
      privateKey: keypair!.private,
      address: keypair!.public,
      balance: 0,
      isValidating: false,
      isEncrypted: false,
    );
  }
}

class WebSessionProvider extends StateNotifier<WebSessionModel> {
  final Reader read;

  static const _initial = WebSessionModel();

  WebSessionProvider(this.read, [WebSessionModel model = _initial]) : super(model) {
    init();
  }

  void init() {
    final savedKeypair = singleton<Storage>().getMap(Storage.WEB_KEYPAIR);
    if (savedKeypair != null) {
      final keypair = Keypair.fromJson(savedKeypair);
      login(keypair, false);
    }
    read(readyProvider.notifier).setReady(true);

    final timezoneName = DateTime.now().timeZoneName.toString();
    state = state.copyWith(timezoneName: timezoneName);
  }

  void login(Keypair keypair, [bool andSave = true]) {
    if (andSave) {
      singleton<Storage>().setMap(Storage.WEB_KEYPAIR, keypair.toJson());
    }

    state = state.copyWith(keypair: keypair, isAuthenticated: true);
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

final webSessionProvider = StateNotifierProvider<WebSessionProvider, WebSessionModel>(
  (ref) => WebSessionProvider(ref.read),
);
