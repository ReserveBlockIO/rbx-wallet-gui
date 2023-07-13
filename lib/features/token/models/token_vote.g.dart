// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenVote _$$_TokenVoteFromJson(Map<String, dynamic> json) => _$_TokenVote(
      id: json['Id'] as int,
      smartContractUid: json['SmartContractUID'] as String,
      topicUid: json['TopicUID'] as String,
      address: json['Address'] as String,
      voteType: voteTypeFromJson(json['VoteType'] as int),
      transactionHash: json['TransactionHash'] as String,
      blockHeight: json['BlockHeight'] as int,
    );

Map<String, dynamic> _$$_TokenVoteToJson(_$_TokenVote instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'SmartContractUID': instance.smartContractUid,
      'TopicUID': instance.topicUid,
      'Address': instance.address,
      'VoteType': _$TokenVoteTypeEnumMap[instance.voteType]!,
      'TransactionHash': instance.transactionHash,
      'BlockHeight': instance.blockHeight,
    };

const _$TokenVoteTypeEnumMap = {
  TokenVoteType.No: 'No',
  TokenVoteType.Yes: 'Yes',
};
