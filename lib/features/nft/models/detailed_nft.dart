import 'package:freezed_annotation/freezed_annotation.dart';

import 'nft.dart';

part 'detailed_nft.freezed.dart';
part 'detailed_nft.g.dart';

@freezed
abstract class DetailedNft with _$DetailedNft {
  const DetailedNft._();

  factory DetailedNft({
    @JsonKey(name: "SmartContract") required Nft nft,
    @JsonKey(name: "SmartContractCode", defaultValue: "") required String code,
  }) = _DetailedNft;

  factory DetailedNft.fromJson(Map<String, dynamic> json) => _$DetailedNftFromJson(json);
}
