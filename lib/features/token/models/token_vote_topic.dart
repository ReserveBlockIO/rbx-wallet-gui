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
    List<WebTokenVoteTopicVoteDataItem>? webVoteList,
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

@freezed
class WebTokenVoteTopicVoteDataItem with _$WebTokenVoteTopicVoteDataItem {
  const WebTokenVoteTopicVoteDataItem._();

  factory WebTokenVoteTopicVoteDataItem({
    required String address,
    required bool value,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _WebTokenVoteTopicVoteDataItem;

  factory WebTokenVoteTopicVoteDataItem.fromJson(Map<String, dynamic> json) => _$WebTokenVoteTopicVoteDataItemFromJson(json);

  String get createdAtFormatted {
    final dateTime = DateFormat('MM/dd/yy - HH:mm').format(createdAt.toLocal());
    return "$dateTime ${DateTime.now().timeZoneName.toString()}";
  }
}

@freezed
class WebTokenVoteTopicVoteData with _$WebTokenVoteTopicVoteData {
  const WebTokenVoteTopicVoteData._();

  factory WebTokenVoteTopicVoteData({
    required List<WebTokenVoteTopicVoteDataItem> votes,
    @JsonKey(name: "vote_yes") required int voteYes,
    @JsonKey(name: "vote_no") required int voteNo,
    @JsonKey(name: "total_votes") required int totalVotes,
    @JsonKey(name: "percent_yes") required double percentYes,
    @JsonKey(name: "percent_no") required double percentNo,
  }) = _WebTokenVoteTopicVoteData;

  factory WebTokenVoteTopicVoteData.fromJson(Map<String, dynamic> json) => _$WebTokenVoteTopicVoteDataFromJson(json);
}

@freezed
class WebTokenVoteTopic with _$WebTokenVoteTopic {
  const WebTokenVoteTopic._();

  factory WebTokenVoteTopic({
    @JsonKey(name: "sc_identifier") required String smartContractUid,
    @JsonKey(name: "topic_id") required String topicUid,
    @JsonKey(name: "name") required String topicName,
    @JsonKey(name: "description") required String topicDescription,
    @JsonKey(name: "vote_requirement") required double minimumVoteRequirement,
    @JsonKey(name: "created_at") required DateTime topicCreateDate,
    @JsonKey(name: "voting_ends_at") required DateTime votingEndDate,
    @JsonKey(name: "vote_data") required WebTokenVoteTopicVoteData voteData,
  }) = _WebTokenVoteTopic;

  factory WebTokenVoteTopic.fromJson(Map<String, dynamic> json) => _$WebTokenVoteTopicFromJson(json);

  TokenVoteTopic toNative() {
    return TokenVoteTopic(
      smartContractUid: smartContractUid,
      topicUid: topicUid,
      topicName: topicName,
      topicDescription: topicDescription,
      minimumVoteRequirement: minimumVoteRequirement.round(),
      tokenHolderCount: 0,
      topicCreateDate: (topicCreateDate.millisecondsSinceEpoch / 1000).round(),
      votingEndDate: (votingEndDate.millisecondsSinceEpoch / 1000).round(),
      voteYes: voteData.voteYes,
      voteNo: voteData.voteNo,
      totalVotes: voteData.totalVotes.toDouble(),
      percentVotesYes: voteData.percentYes,
      percentVotesNo: voteData.percentNo,
      percentInFavor: voteData.percentYes,
      percentAgainst: voteData.percentNo,
      blockHeight: 0,
      webVoteList: voteData.votes,
    );
  }
}
