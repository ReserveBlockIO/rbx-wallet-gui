import 'package:freezed_annotation/freezed_annotation.dart';
import 'token_vote_topic.dart';

part 'token_details.freezed.dart';
part 'token_details.g.dart';

@freezed
class TokenDetails with _$TokenDetails {
  const TokenDetails._();

  const factory TokenDetails({
    @JsonKey(name: "TokenName") @Default("") String name,
    @JsonKey(name: "TokenTicker") @Default("") String ticker,
    @JsonKey(name: "StartingSupply") required double startingSupply,
    @JsonKey(name: "CurrentSupply") required double currentSupply,
    @JsonKey(name: "DecimalPlaces") required int decimalPlaces,
    @JsonKey(name: "IsPaused") required bool isPaused,
    @JsonKey(name: "TokenBurnable") required bool burnable,
    @JsonKey(name: "TokenVoting") required bool voting,
    @JsonKey(name: "TokenMintable") required bool mintable,
    @JsonKey(name: "ContractOwner") required String contractOwner,
    @JsonKey(name: "AddressBlackList") List<String>? addressBlackList,
    @JsonKey(name: "TokenTopicList") @Default([]) List<TokenVoteTopic> topicList,
  }) = _TokenDetails;

  factory TokenDetails.fromJson(Map<String, dynamic> json) => _$TokenDetailsFromJson(json);
}
