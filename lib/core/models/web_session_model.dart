import 'package:freezed_annotation/freezed_annotation.dart';
import '../../features/btc_web/models/btc_web_account.dart';
import '../../features/btc_web/models/btc_web_balance_info.dart';
import '../../features/keygen/models/ra_keypair.dart';
import '../../features/keygen/models/keypair.dart';
import '../../features/wallet/models/wallet.dart';

part 'web_session_model.freezed.dart';
part 'web_session_model.g.dart';

enum WalletType {
  rbx("vfx"),
  ra("ra"),
  btc("btc"),
  ;

  final String storageName;
  const WalletType(this.storageName);
}

@freezed
abstract class WebSessionModel with _$WebSessionModel {
  const WebSessionModel._();

  factory WebSessionModel({
    Keypair? keypair,
    RaKeypair? raKeypair,
    BtcWebAccount? btcKeypair,
    double? balance,
    double? balanceTotal,
    double? balanceLocked,
    double? raBalance,
    double? raBalanceTotal,
    double? raBalanceLocked,
    String? adnr,
    // @Default(false) bool usingRa,
    @Default(WalletType.rbx) WalletType selectedWalletType,
    @Default(false) bool raActivated,
    @Default(false) bool isAuthenticated,
    @Default("America/Los_Angeles") String timezoneName,
    @Default(false) bool rememberMe,
    @Default(0) int currentRbxWalletIndex,
    @Default(0) int currentRaWalletIndex,
    @Default(0) int currentBtcWalletIndex,
    BtcWebBalanceInfo? btcBalanceInfo,
    @Default(false) bool ready,
  }) = _WebSessionModel;

  factory WebSessionModel.fromJson(Map<String, dynamic> json) => _$WebSessionModelFromJson(json);

  bool get usingRa {
    return selectedWalletType == WalletType.ra;
  }

  bool get usingRbx {
    return selectedWalletType == WalletType.rbx;
  }

  bool get usingBtc {
    return selectedWalletType == WalletType.btc;
  }

  Wallet? get currentWallet {
    if (keypair == null) return null;

    switch (selectedWalletType) {
      case WalletType.rbx:
        if (keypair == null) return null;
        return Wallet(
          id: 0,
          publicKey: keypair!.public,
          privateKey: keypair!.private,
          address: keypair!.address,
          balance: balance ?? 0,
          isValidating: false,
          totalBalance: balanceTotal ?? 0,
          lockedBalance: balanceLocked ?? 0,
        );

      case WalletType.ra:
        if (raKeypair == null) return null;
        return Wallet(
          id: 0,
          publicKey: raKeypair!.asKeypair.public,
          privateKey: raKeypair!.asKeypair.private,
          address: raKeypair!.asKeypair.address,
          balance: raBalance ?? 0,
          isValidating: false,
          totalBalance: raBalanceTotal ?? 0,
          lockedBalance: raBalanceLocked ?? 0,
        );
      case WalletType.btc:
        if (btcKeypair == null) return null;
        return Wallet(
          id: 0,
          publicKey: btcKeypair!.publicKey,
          privateKey: btcKeypair!.privateKey,
          btcWif: btcKeypair!.wif,
          address: btcKeypair!.address,
          balance: -1, //TODO
          isValidating: false,
        );
    }

    // return usingRa
    //     ? Wallet(
    //         id: 0,
    //         publicKey: raKeypair!.asKeypair.public,
    //         privateKey: raKeypair!.asKeypair.private,
    //         address: raKeypair!.asKeypair.address,
    //         balance: raBalance ?? 0,
    //         isValidating: false,
    //         totalBalance: raBalanceTotal ?? 0,
    //         lockedBalance: raBalanceLocked ?? 0,
    //       )
    //     : Wallet(
    //         id: 0,
    //         publicKey: keypair!.public,
    //         privateKey: keypair!.private,
    //         address: keypair!.address,
    //         balance: balance ?? 0,
    //         isValidating: false,
    //         totalBalance: balanceTotal ?? 0,
    //         lockedBalance: balanceLocked ?? 0,
    //       );
  }
}
