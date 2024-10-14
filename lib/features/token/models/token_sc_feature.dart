import 'package:freezed_annotation/freezed_annotation.dart';
import '../../nft/models/nft.dart';

import '../../asset/asset.dart';
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
    @JsonKey(name: "TokenName") @Default("Unnamed") String name,
    @JsonKey(name: "TokenTicker") @Default("unnamed") String ticker,
    @JsonKey(name: "TokenDecimalPlaces") @Default(TOKEN_DEFAULT_DECIMAL_PLACES) int decimalPlaces,
    @JsonKey(name: "TokenSupply", toJson: supplyToJson) @Default(0.0) double supply,
    @JsonKey(name: "TokenBurnable") @Default(false) bool burnable,
    @JsonKey(name: "TokenMintable") @Default(false) bool mintable,
    @JsonKey(name: "TokenVoting") @Default(false) bool voting,
    @JsonKey(name: "TokenImageURL") String? imageUrl,
    @JsonKey(name: "TokenImageBase") String? imageBase64,
    @JsonKey(includeFromJson: false, includeToJson: false) Asset? webAsset,
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

  static TokenScFeature? fromNft(Nft nft) {
    if (!nft.isToken) {
      return null;
    }

    if (nft.tokenDetails == null) {
      return null;
    }

    final details = nft.tokenDetails!;

    return TokenScFeature(
      name: details.name,
      ticker: details.ticker,
      decimalPlaces: details.decimalPlaces,
      supply: details.supply,
      burnable: details.burnable,
      mintable: details.mintable,
      voting: details.voting,
      imageBase64: details.imageBase64,
      imageUrl: details.imageUrl,
    );
  }
}
