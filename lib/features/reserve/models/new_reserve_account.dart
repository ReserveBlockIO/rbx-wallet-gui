import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_reserve_account.freezed.dart';
part 'new_reserve_account.g.dart';

@freezed
abstract class NewReserveAccount with _$NewReserveAccount {
  const NewReserveAccount._();

  factory NewReserveAccount({
    @JsonKey(name: "PrivateKey") required String privateKey,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "RecoveryAddress") required String recoveryAddress,
    @JsonKey(name: "RecoveryPrivateKey") required String recoveryPrivateKey,
    @JsonKey(name: "RestoreCode") required String restoreCode,
  }) = _NewReserveAccount;

  factory NewReserveAccount.fromJson(Map<String, dynamic> json) => _$NewReserveAccountFromJson(json);
}
