// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vote _$$_VoteFromJson(Map<String, dynamic> json) => _$_Vote(
      id: json['Id'] as int,
      uid: json['TopicUID'] as String,
      address: json['Address'] as String,
      type: voteTypeFromJson(json['VoteType'] as int),
      transactionHash: json['TransactionHash'] as String,
      blockHeight: json['BlockHeight'] as int,
    );

Map<String, dynamic> _$$_VoteToJson(_$_Vote instance) => <String, dynamic>{
      'Id': instance.id,
      'TopicUID': instance.uid,
      'Address': instance.address,
      'VoteType': _$VoteTypeEnumMap[instance.type],
      'TransactionHash': instance.transactionHash,
      'BlockHeight': instance.blockHeight,
    };

const _$VoteTypeEnumMap = {
  VoteType.No: 'No',
  VoteType.Yes: 'Yes',
};
