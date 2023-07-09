import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_sc_feature.freezed.dart';
part 'token_sc_feature.g.dart';

@freezed
class TokenScFeature with _$TokenScFeature {
  const TokenScFeature._();

  static const int compilerEnum = 13;

  const factory TokenScFeature({
    @JsonKey(name: "TokenName") required String name,
    @JsonKey(name: "TokenTicker") required String ticker,
    @JsonKey(name: "TokenDecimalPlaces") required int decimalPlaces,
    @JsonKey(name: "TokenSupply") required double supply,
    @JsonKey(name: "TokenBurnable") required bool burnable,
    @JsonKey(name: "TokenVoting") required bool voting,
    @JsonKey(name: "TokenImageUrl") String? imageUrl,
    @JsonKey(name: "TokenImageBase") String? imageBase64,
  }) = _TokenScFeature;

  factory TokenScFeature.fromJson(Map<String, dynamic> json) => _$TokenScFeatureFromJson(json);

  TokenScFeature empty() {
    return TokenScFeature(
      name: "",
      ticker: "",
      decimalPlaces: 8,
      supply: 0,
      burnable: true,
      voting: false,
    );
  }
}
