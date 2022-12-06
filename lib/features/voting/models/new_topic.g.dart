// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewTopic _$$_NewTopicFromJson(Map<String, dynamic> json) => _$_NewTopic(
      name: json['TopicName'] as String,
      description: json['TopicDescription'] as String,
      votingEndDays: $enumDecode(_$VotingDaysEnumMap, json['VotingEndDays']),
      category:
          $enumDecode(_$VoteTopicCategoryEnumMap, json['VoteTopicCategory']),
    );

Map<String, dynamic> _$$_NewTopicToJson(_$_NewTopic instance) =>
    <String, dynamic>{
      'TopicName': instance.name,
      'TopicDescription': instance.description,
      'VotingEndDays': votingDaysToJson(instance.votingEndDays),
      'VoteTopicCategory': categoryToJson(instance.category),
    };

const _$VotingDaysEnumMap = {
  VotingDays.Thirty: 'Thirty',
  VotingDays.Sixty: 'Sixty',
  VotingDays.Ninety: 'Ninety',
  VotingDays.OneHundredEighty: 'OneHundredEighty',
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
};
