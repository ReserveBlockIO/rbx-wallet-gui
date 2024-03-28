// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_token_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewTokenTopic _$$_NewTokenTopicFromJson(Map<String, dynamic> json) =>
    _$_NewTokenTopic(
      name: json['TopicName'] as String,
      description: json['TopicDescription'] as String,
      smartContractUid: json['SmartContractUID'] as String,
      minimumVoteRequirement: json['MinimumVoteRequirement'] as int,
      fromAddress: json['FromAddress'] as String,
      votingEndDays:
          $enumDecode(_$TokenVotingDaysEnumMap, json['VotingEndDays']),
    );

Map<String, dynamic> _$$_NewTokenTopicToJson(_$_NewTokenTopic instance) =>
    <String, dynamic>{
      'TopicName': instance.name,
      'TopicDescription': instance.description,
      'SmartContractUID': instance.smartContractUid,
      'MinimumVoteRequirement': instance.minimumVoteRequirement,
      'FromAddress': instance.fromAddress,
      'VotingEndDays': votingDaysToJson(instance.votingEndDays),
    };

const _$TokenVotingDaysEnumMap = {
  TokenVotingDays.Thirty: 'Thirty',
  TokenVotingDays.Sixty: 'Sixty',
  TokenVotingDays.Ninety: 'Ninety',
  TokenVotingDays.OneHundredEighty: 'OneHundredEighty',
};
