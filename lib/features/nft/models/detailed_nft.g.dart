// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_nft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailedNft _$$_DetailedNftFromJson(Map<String, dynamic> json) =>
    _$_DetailedNft(
      nft: Nft.fromJson(json['SmartContract'] as Map<String, dynamic>),
      code: json['SmartContractCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_DetailedNftToJson(_$_DetailedNft instance) =>
    <String, dynamic>{
      'SmartContract': instance.nft,
      'SmartContractCode': instance.code,
    };
