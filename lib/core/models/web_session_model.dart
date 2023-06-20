import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/keygen/models/ra_keypair.dart';
import '../../features/keygen/models/keypair.dart';
import '../../features/wallet/models/wallet.dart';

part 'web_session_model.freezed.dart';
part 'web_session_model.g.dart';

@freezed
abstract class WebSessionModel with _$WebSessionModel {
  const WebSessionModel._();

  factory WebSessionModel({
    Keypair? keypair,
    RaKeypair? raKeypair,
    double? balance,
    double? balanceTotal,
    double? balanceLocked,
    double? raBalance,
    double? raBalanceTotal,
    double? raBalanceLocked,
    String? adnr,
    @Default(false) bool usingRa,
    @Default(false) bool raActivated,
    @Default(false) bool isAuthenticated,
    @Default("America/Los_Angeles") String timezoneName,
    @Default(false) bool rememberMe,
  }) = _WebSessionModel;

  factory WebSessionModel.fromJson(Map<String, dynamic> json) => _$WebSessionModelFromJson(json);

  Wallet? get currentWallet {
    if (keypair == null) return null;

    return usingRa
        ? Wallet(
            id: 0,
            publicKey: raKeypair!.asKeypair.public,
            privateKey: raKeypair!.asKeypair.private,
            address: raKeypair!.asKeypair.address,
            balance: raBalance ?? 0,
            isValidating: false,
            totalBalance: raBalanceTotal ?? 0,
            lockedBalance: raBalanceLocked ?? 0,
          )
        : Wallet(
            id: 0,
            publicKey: keypair!.public,
            privateKey: keypair!.private,
            address: keypair!.address,
            balance: balance ?? 0,
            isValidating: false,
            totalBalance: balanceTotal ?? 0,
            lockedBalance: balanceLocked ?? 0,
          );
  }
}
