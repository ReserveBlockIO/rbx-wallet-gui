import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'topic.freezed.dart';
part 'topic.g.dart';

enum TopicVoterType {
  Adjudicator,
  Validator,
}

enum VoteTopicCategory {
  General,
  CodeChange,
  AddDeveloper,
  RemoveDeveloper,
  NetworkChange,
  AdjVoteIn,
  AdjVoteOut,
  ValidatorChange,
  BlockModify,
  TransactionModify,
  BalanceCorrection,
  HackOrExploitCorrection,
  Other,
}

totalVoteFromJson(double value) => value.round();

voterTypeFromJson(int value) => TopicVoterType.values[value];

voteTopicCategoryFromJson(int value) {
  if (value == 999) {
    return VoteTopicCategory.Other;
  }

  return VoteTopicCategory.values[value];
}

@freezed
class Topic with _$Topic {
  const Topic._();

  factory Topic({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "TopicUID") required String uid,
    @JsonKey(name: "TopicName") required String name,
    @JsonKey(name: "TopicDescription") required String description,
    @JsonKey(name: "TopicOwnerAddress") required String ownerAddress,
    @JsonKey(name: "TopicOwnerSignature") required String ownerSignature,
    @JsonKey(name: "AdjudicatorAddress") String? adjudicatorAddress,
    @JsonKey(name: "BlockHeight") required int blockHeight,
    @JsonKey(name: "ValidatorCount") required int validatorCount,
    @JsonKey(name: "AdjudicatorSignature") String? adjudicatorSignature,
    @JsonKey(name: "TopicCreateDate") required DateTime createdAt,
    @JsonKey(name: "VotingEndDate") required DateTime endsAt,
    @JsonKey(name: "VoterType", fromJson: voterTypeFromJson) required TopicVoterType voterType,
    @JsonKey(name: "VoteTopicCategory", fromJson: voteTopicCategoryFromJson) required VoteTopicCategory category,
    @JsonKey(name: "VoteYes") required int yesVotes,
    @JsonKey(name: "VoteNo") required int noVotes,
    @JsonKey(name: "TotalVotes", fromJson: totalVoteFromJson) required int totalVotes,
    @JsonKey(name: "PercentVotesYes") required double yesPercent,
    @JsonKey(name: "PercentVotesNo") required double noPercent,
    @JsonKey(name: "PercentInFavor") required double percentInFavor,
    @JsonKey(name: "PercentAgainst") required double percentAgainst,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  String get endsAtFormatted {
    final dateTime = DateFormat('MM/dd/yy – kk:mm').format(endsAt.toLocal());
    return "$dateTime ${DateTime.now().timeZoneName.toString()}";
  }

  String get createdAtFormatted {
    final dateTime = DateFormat('MM/dd/yy – kk:mm').format(createdAt.toLocal());
    return "$dateTime ${DateTime.now().timeZoneName.toString()}";
  }

  bool get isActive {
    return endsAt.isAfter(DateTime.now());
  }
}
