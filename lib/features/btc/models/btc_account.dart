import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc_account.freezed.dart';
part 'btc_account.g.dart';

@freezed
class BtcAccount with _$BtcAccount {
  const BtcAccount._();

  factory BtcAccount({
    @JsonKey(name: "Id") @Default(0) int id,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "PrivateKey") required String privateKey,
    @JsonKey(name: "ADNR") String? adnr,
    @JsonKey(name: "ADNROwnerAddress") String? adnrOwnerAddress,
    @JsonKey(name: "WifKey") required String wifKey,
    @JsonKey(name: "Balance") @Default(0.0) double balance,
  }) = _BtcAccount;

  factory BtcAccount.fromJson(Map<String, dynamic> json) => _$BtcAccountFromJson(json);

  String get label {
    final start = address.substring(0, 5);
    final end = address.substring(address.length - 5, address.length);
    return "${adnr != null ? '@$adnr | ' : ''}$start.....$end";
  }
}
