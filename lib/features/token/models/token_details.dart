import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_details.freezed.dart';
part 'token_details.g.dart';

@freezed
class TokenDetails with _$TokenDetails {
  const TokenDetails._();

  const factory TokenDetails({
    @JsonKey(name: "TokenName") required String name,
    @JsonKey(name: "TokenTicker") required String ticker,
    @JsonKey(name: "StartingSupply") required double startingSupply,
    @JsonKey(name: "CurrentSupply") required double currentSupply,
    @JsonKey(name: "DecimalPlaces") required int decimalPlaces,
    @JsonKey(name: "IsPaused") required bool isPaused,
    @JsonKey(name: "ContractOwner") required String contractOwner,
    @JsonKey(name: "AddressBlackList") List<String>? addressBlackList,
  }) = _TokenDetails;

  factory TokenDetails.fromJson(Map<String, dynamic> json) => _$TokenDetailsFromJson(json);
}
