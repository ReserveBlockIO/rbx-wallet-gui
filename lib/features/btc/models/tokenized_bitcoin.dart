import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokenized_bitcoin.freezed.dart';
part 'tokenized_bitcoin.g.dart';

@freezed
class TokenizedBitcoin with _$TokenizedBitcoin {
  const TokenizedBitcoin._();

  factory TokenizedBitcoin({
    @JsonKey(name: "Id") required double id,
    @JsonKey(name: "SmartContractUID") required String smartContractUid,
    @JsonKey(name: "RBXAddress") required String rbxAddress,
    @JsonKey(name: "DepositAddress") String? btcAddress,
    @JsonKey(name: "Balance") @Default(0.0) double balance,
    @JsonKey(name: "TokenName") required String tokenName,
    @JsonKey(name: "TokenDescription") required String tokenDescription,
    @JsonKey(name: "SmartContractMainId") required double smartContractMainId,
    @JsonKey(name: "IsPublished") required bool isPublished,
  }) = _TokenizedBitcoin;

  factory TokenizedBitcoin.fromJson(Map<String, dynamic> json) => _$TokenizedBitcoinFromJson(json);
}
