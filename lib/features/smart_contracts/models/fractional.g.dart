// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fractional.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Fractional _$$_FractionalFromJson(Map<String, dynamic> json) =>
    _$_Fractional(
      id: json['id'] as String? ?? "",
      creatorRetains: (json['creatorRetains'] as num?)?.toDouble() ?? 0,
      fractionalInterest: (json['fractionalInterest'] as num?)?.toDouble() ?? 5,
      allowVoting: json['allowVoting'] as bool? ?? false,
      votingDescription: json['votingDescription'] as String? ?? "",
    );

Map<String, dynamic> _$$_FractionalToJson(_$_Fractional instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorRetains': instance.creatorRetains,
      'fractionalInterest': instance.fractionalInterest,
      'allowVoting': instance.allowVoting,
      'votingDescription': instance.votingDescription,
    };
