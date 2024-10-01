import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'token_vote_topic.freezed.dart';
part 'token_vote_topic.g.dart';

@freezed
class TokenVoteTopic with _$TokenVoteTopic {
  const TokenVoteTopic._();

  factory TokenVoteTopic({
    @JsonKey(name: "SmartContractUID") required String smartContractUid,
    @JsonKey(name: "TopicUID") required String topicUid,
    @JsonKey(name: "TopicName") required String topicName,
    @JsonKey(name: "TopicDescription") required String topicDescription,
    @JsonKey(name: "MinimumVoteRequirement") required int minimumVoteRequirement,
    @JsonKey(name: "TokenHolderCount") required int tokenHolderCount,
    @JsonKey(name: "TopicCreateDate") required int topicCreateDate,
    @JsonKey(name: "VotingEndDate") required int votingEndDate,
    @JsonKey(name: "BlockHeight") required int blockHeight,
    @JsonKey(name: "VoteYes") required int voteYes,
    @JsonKey(name: "VoteNo") required int voteNo,
    @JsonKey(name: "TotalVotes") required double totalVotes,
    @JsonKey(name: "PercentVotesYes") required double percentVotesYes,
    @JsonKey(name: "PercentVotesNo") required double percentVotesNo,
    @JsonKey(name: "PercentInFavor") required double percentInFavor,
    @JsonKey(name: "PercentAgainst") required double percentAgainst,
  }) = _TokenVoteTopic;

  factory TokenVoteTopic.fromJson(Map<String, dynamic> json) => _$TokenVoteTopicFromJson(json);

  DateTime get createdAt {
    return DateTime.fromMillisecondsSinceEpoch(topicCreateDate * 1000);
  }

  DateTime get endsAt {
    return DateTime.fromMillisecondsSinceEpoch(votingEndDate * 1000);
  }

  String get endsAtFormatted {
    final dateTime = DateFormat('MM/dd/yy - HH:mm').format(endsAt.toLocal());
    return "$dateTime ${DateTime.now().timeZoneName.toString()}";
  }

  String get createdAtFormatted {
    final dateTime = DateFormat('MM/dd/yy - HH:mm').format(createdAt.toLocal());
    return "$dateTime ${DateTime.now().timeZoneName.toString()}";
  }

  bool get isActive {
    return endsAt.isAfter(DateTime.now());
  }
}
