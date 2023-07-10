import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants.dart';

part 'token_sc_feature.freezed.dart';
part 'token_sc_feature.g.dart';

supplyToJson(double supply) {
  if (supply == 0) {
    return 0;
  }

  return supply;
}

@freezed
class TokenScFeature with _$TokenScFeature {
  const TokenScFeature._();

  static const int compilerEnum = 13;

  const factory TokenScFeature({
    @JsonKey(name: "TokenName") required String name,
    @JsonKey(name: "TokenTicker") required String ticker,
    @JsonKey(name: "TokenDecimalPlaces") required int decimalPlaces,
    @JsonKey(name: "TokenSupply", toJson: supplyToJson) required double supply,
    @JsonKey(name: "TokenBurnable") required bool burnable,
    @JsonKey(name: "TokenMintable") required bool mintable,
    @JsonKey(name: "TokenVoting") required bool voting,
    @JsonKey(name: "TokenImageURL") String? imageUrl,
    @JsonKey(name: "TokenImageBase") String? imageBase64,
  }) = _TokenScFeature;

  factory TokenScFeature.fromJson(Map<String, dynamic> json) => _$TokenScFeatureFromJson(json);

  static TokenScFeature empty() {
    return TokenScFeature(
      name: "",
      ticker: "",
      decimalPlaces: TOKEN_DEFAULT_DECIMAL_PLACES,
      supply: 0,
      burnable: true,
      voting: false,
      mintable: true,
    );
  }
}
