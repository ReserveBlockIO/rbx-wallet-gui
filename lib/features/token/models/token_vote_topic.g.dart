// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_vote_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenVoteTopic _$$_TokenVoteTopicFromJson(Map<String, dynamic> json) =>
    _$_TokenVoteTopic(
      smartContractUid: json['SmartContractUID'] as String,
      topicUid: json['TopicUID'] as String,
      topicName: json['TopicName'] as String,
      topicDescription: json['TopicDescription'] as String,
      minimumVoteRequirement: json['MinimumVoteRequirement'] as int,
      tokenHolderCount: json['TokenHolderCount'] as int,
      topicCreateDate: json['TopicCreateDate'] as int,
      votingEndDate: json['VotingEndDate'] as int,
      blockHeight: json['BlockHeight'] as int,
      voteYes: json['VoteYes'] as int,
      voteNo: json['VoteNo'] as int,
      totalVotes: (json['TotalVotes'] as num).toDouble(),
      percentVotesYes: (json['PercentVotesYes'] as num).toDouble(),
      percentVotesNo: (json['PercentVotesNo'] as num).toDouble(),
      percentInFavor: (json['PercentInFavor'] as num).toDouble(),
      percentAgainst: (json['PercentAgainst'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TokenVoteTopicToJson(_$_TokenVoteTopic instance) =>
    <String, dynamic>{
      'SmartContractUID': instance.smartContractUid,
      'TopicUID': instance.topicUid,
      'TopicName': instance.topicName,
      'TopicDescription': instance.topicDescription,
      'MinimumVoteRequirement': instance.minimumVoteRequirement,
      'TokenHolderCount': instance.tokenHolderCount,
      'TopicCreateDate': instance.topicCreateDate,
      'VotingEndDate': instance.votingEndDate,
      'BlockHeight': instance.blockHeight,
      'VoteYes': instance.voteYes,
      'VoteNo': instance.voteNo,
      'TotalVotes': instance.totalVotes,
      'PercentVotesYes': instance.percentVotesYes,
      'PercentVotesNo': instance.percentVotesNo,
      'PercentInFavor': instance.percentInFavor,
      'PercentAgainst': instance.percentAgainst,
    };
