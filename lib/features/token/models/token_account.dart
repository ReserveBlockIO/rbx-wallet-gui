import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_account.freezed.dart';
part 'token_account.g.dart';

@freezed
class TokenAccount with _$TokenAccount {
  const TokenAccount._();

  const factory TokenAccount({
    @JsonKey(name: "SmartContractUID") required String smartContractId,
    @JsonKey(name: "TokenName") required String name,
    @JsonKey(name: "TokenTicker") required String ticker,
    @JsonKey(name: "Balance") required double balance,
    @JsonKey(name: "LockedBalance") required double lockedBalance,
    @JsonKey(name: "DecimalPlaces") required int decimalPlaces,
  }) = _TokenAccount;

  factory TokenAccount.fromJson(Map<String, dynamic> json) => _$TokenAccountFromJson(json);
}
