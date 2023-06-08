import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_address.freezed.dart';
part 'web_address.g.dart';

@freezed
abstract class WebAddress with _$WebAddress {
  const WebAddress._();

  factory WebAddress({
    required String address,
    required double balance,
    @JsonKey(name: "balance_total") @Default(0) double balanceTotal,
    @JsonKey(name: "balance_locked") @Default(0) double balanceLocked,
    String? adnr,
  }) = _WebAddress;

  factory WebAddress.fromJson(Map<String, dynamic> json) => _$WebAddressFromJson(json);
}
