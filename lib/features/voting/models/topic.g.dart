// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Topic _$$_TopicFromJson(Map<String, dynamic> json) => _$_Topic(
      id: json['Id'] as int,
      uid: json['TopicUID'] as String,
      name: json['TopicName'] as String,
      description: json['TopicDescription'] as String,
      ownerAddress: json['TopicOwnerAddress'] as String,
      ownerSignature: json['TopicOwnerSignature'] as String,
      adjudicatorAddress: json['AdjudicatorAddress'] as String?,
      blockHeight: json['BlockHeight'] as int,
      validatorCount: json['ValidatorCount'] as int,
      adjudicatorSignature: json['AdjudicatorSignature'] as String?,
      createdAt: DateTime.parse(json['TopicCreateDate'] as String),
      endsAt: DateTime.parse(json['VotingEndDate'] as String),
      voterType: voterTypeFromJson(json['VoterType'] as int),
      category: voteTopicCategoryFromJson(json['VoteTopicCategory'] as int),
      yesVotes: json['VoteYes'] as int,
      noVotes: json['VoteNo'] as int,
      totalVotes: totalVoteFromJson(json['TotalVotes'] as double),
      yesPercent: (json['PercentVotesYes'] as num).toDouble(),
      noPercent: (json['PercentVotesNo'] as num).toDouble(),
      percentInFavor: (json['PercentInFavor'] as num).toDouble(),
      percentAgainst: (json['PercentAgainst'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TopicToJson(_$_Topic instance) => <String, dynamic>{
      'Id': instance.id,
      'TopicUID': instance.uid,
      'TopicName': instance.name,
      'TopicDescription': instance.description,
      'TopicOwnerAddress': instance.ownerAddress,
      'TopicOwnerSignature': instance.ownerSignature,
      'AdjudicatorAddress': instance.adjudicatorAddress,
      'BlockHeight': instance.blockHeight,
      'ValidatorCount': instance.validatorCount,
      'AdjudicatorSignature': instance.adjudicatorSignature,
      'TopicCreateDate': instance.createdAt.toIso8601String(),
      'VotingEndDate': instance.endsAt.toIso8601String(),
      'VoterType': _$TopicVoterTypeEnumMap[instance.voterType]!,
      'VoteTopicCategory': _$VoteTopicCategoryEnumMap[instance.category]!,
      'VoteYes': instance.yesVotes,
      'VoteNo': instance.noVotes,
      'TotalVotes': instance.totalVotes,
      'PercentVotesYes': instance.yesPercent,
      'PercentVotesNo': instance.noPercent,
      'PercentInFavor': instance.percentInFavor,
      'PercentAgainst': instance.percentAgainst,
    };

const _$TopicVoterTypeEnumMap = {
  TopicVoterType.Adjudicator: 'Adjudicator',
  TopicVoterType.Validator: 'Validator',
};

const _$VoteTopicCategoryEnumMap = {
  VoteTopicCategory.General: 'General',
  VoteTopicCategory.CodeChange: 'CodeChange',
  VoteTopicCategory.AddDeveloper: 'AddDeveloper',
  VoteTopicCategory.RemoveDeveloper: 'RemoveDeveloper',
  VoteTopicCategory.NetworkChange: 'NetworkChange',
  VoteTopicCategory.AdjVoteIn: 'AdjVoteIn',
  VoteTopicCategory.AdjVoteOut: 'AdjVoteOut',
  VoteTopicCategory.ValidatorChange: 'ValidatorChange',
  VoteTopicCategory.BlockModify: 'BlockModify',
  VoteTopicCategory.TransactionModify: 'TransactionModify',
  VoteTopicCategory.BalanceCorrection: 'BalanceCorrection',
  VoteTopicCategory.HackOrExploitCorrection: 'HackOrExploitCorrection',
  VoteTopicCategory.Other: 'Other',
};
