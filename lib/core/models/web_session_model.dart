import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/keygen/models/keypair.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';

part 'web_session_model.freezed.dart';
part 'web_session_model.g.dart';

@freezed
abstract class WebSessionModel with _$WebSessionModel {
  const WebSessionModel._();

  factory WebSessionModel({
    Keypair? keypair,
    double? balance,
    String? adnr,
    @Default(false) bool isAuthenticated,
    @Default("America/Los_Angeles") String timezoneName,
    @Default(false) bool rememberMe,
  }) = _WebSessionModel;

  factory WebSessionModel.fromJson(Map<String, dynamic> json) => _$WebSessionModelFromJson(json);

  Wallet? get currentWallet {
    if (keypair == null) return null;
    return Wallet(
      id: 0,
      publicKey: keypair!.publicInflated,
      privateKey: keypair!.private,
      address: keypair!.public,
      balance: balance ?? 0,
      isValidating: false,
      // isEncrypted: false,
    );
  }
}
