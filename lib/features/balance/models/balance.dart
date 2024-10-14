import 'package:freezed_annotation/freezed_annotation.dart';
import '../../token/models/token_account.dart';

part 'balance.freezed.dart';
part 'balance.g.dart';

@freezed
class Balance with _$Balance {
  const Balance._();

  const factory Balance({
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "RBXBalance") required double balance,
    @JsonKey(name: "RBXLockedBalance") required double lockedBalance,
    @JsonKey(name: "TokenAccounts") required List<TokenAccount> tokens,
  }) = _Balance;

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);
}
