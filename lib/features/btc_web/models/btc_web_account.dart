import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc_web_account.freezed.dart';
part 'btc_web_account.g.dart';

@freezed
class BtcWebAccount with _$BtcWebAccount {
  const BtcWebAccount._();

  factory BtcWebAccount({
    required String address,
    required String wif,
    required String privateKey,
    required String publicKey,
    String? mnemonic,
    String? adnr,
  }) = _BtcWebAccount;

  factory BtcWebAccount.fromJson(Map<String, dynamic> json) => _$BtcWebAccountFromJson(json);
}
