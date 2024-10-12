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

_$_WebTokenVoteTopic _$$_WebTokenVoteTopicFromJson(Map<String, dynamic> json) =>
    _$_WebTokenVoteTopic(
      smartContractUid: json['sc_identifier'] as String,
      topicUid: json['topic_id'] as String,
      topicName: json['name'] as String,
      topicDescription: json['description'] as String,
      minimumVoteRequirement: (json['vote_requirement'] as num).toDouble(),
      topicCreateDate: DateTime.parse(json['created_at'] as String),
      votingEndDate: DateTime.parse(json['voting_ends_at'] as String),
    );

Map<String, dynamic> _$$_WebTokenVoteTopicToJson(
        _$_WebTokenVoteTopic instance) =>
    <String, dynamic>{
      'sc_identifier': instance.smartContractUid,
      'topic_id': instance.topicUid,
      'name': instance.topicName,
      'description': instance.topicDescription,
      'vote_requirement': instance.minimumVoteRequirement,
      'created_at': instance.topicCreateDate.toIso8601String(),
      'voting_ends_at': instance.votingEndDate.toIso8601String(),
    };
