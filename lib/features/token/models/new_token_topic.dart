import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_token_topic.freezed.dart';
part 'new_token_topic.g.dart';

enum TokenVotingDays {
  Thirty,
  Sixty,
  Ninety,
  OneHundredEighty,
}

votingDaysToJson(TokenVotingDays value) {
  switch (value) {
    case TokenVotingDays.Thirty:
      return 30;
    case TokenVotingDays.Sixty:
      return 60;
    case TokenVotingDays.Ninety:
      return 90;
    case TokenVotingDays.OneHundredEighty:
      return 180;
  }
}

@freezed
class NewTokenTopic with _$NewTokenTopic {
  const NewTokenTopic._();

  factory NewTokenTopic({
    @JsonKey(name: "TopicName") required String name,
    @JsonKey(name: "TopicDescription") required String description,
    @JsonKey(name: "SmartContractUID") required String smartContractUid,
    @JsonKey(name: "MinimumVoteRequirement") required int minimumVoteRequirement,
    @JsonKey(name: "FromAddress") required String fromAddress,
    @JsonKey(name: "VotingEndDays", toJson: votingDaysToJson) required TokenVotingDays votingEndDays,
  }) = _NewTokenTopic;

  factory NewTokenTopic.fromJson(Map<String, dynamic> json) => _$NewTokenTopicFromJson(json);

  factory NewTokenTopic.empty(String scId, String fromAddress) {
    return NewTokenTopic(
      name: "",
      description: "",
      smartContractUid: scId,
      minimumVoteRequirement: 0,
      fromAddress: fromAddress,
      votingEndDays: TokenVotingDays.Thirty,
    );
  }

  int get votingDaysAsInt {
    switch (votingEndDays) {
      case TokenVotingDays.Thirty:
        return 30;
      case TokenVotingDays.Sixty:
        return 60;
      case TokenVotingDays.Ninety:
        return 90;
      case TokenVotingDays.OneHundredEighty:
        return 180;
    }
  }
}
