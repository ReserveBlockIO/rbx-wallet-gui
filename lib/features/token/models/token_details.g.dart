// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenDetails _$$_TokenDetailsFromJson(Map<String, dynamic> json) =>
    _$_TokenDetails(
      name: json['TokenName'] as String? ?? "",
      ticker: json['TokenTicker'] as String? ?? "",
      startingSupply: (json['StartingSupply'] as num).toDouble(),
      currentSupply: (json['CurrentSupply'] as num).toDouble(),
      decimalPlaces: json['DecimalPlaces'] as int,
      isPaused: json['IsPaused'] as bool,
      burnable: json['TokenBurnable'] as bool,
      voting: json['TokenVoting'] as bool,
      mintable: json['TokenMintable'] as bool,
      contractOwner: json['ContractOwner'] as String,
      addressBlackList: (json['AddressBlackList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      topicList: (json['TokenTopicList'] as List<dynamic>?)
              ?.map((e) => TokenVoteTopic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TokenDetailsToJson(_$_TokenDetails instance) =>
    <String, dynamic>{
      'TokenName': instance.name,
      'TokenTicker': instance.ticker,
      'StartingSupply': instance.startingSupply,
      'CurrentSupply': instance.currentSupply,
      'DecimalPlaces': instance.decimalPlaces,
      'IsPaused': instance.isPaused,
      'TokenBurnable': instance.burnable,
      'TokenVoting': instance.voting,
      'TokenMintable': instance.mintable,
      'ContractOwner': instance.contractOwner,
      'AddressBlackList': instance.addressBlackList,
      'TokenTopicList': instance.topicList,
    };
