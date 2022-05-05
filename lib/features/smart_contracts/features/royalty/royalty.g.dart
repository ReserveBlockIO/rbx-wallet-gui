// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'royalty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Royalty _$$_RoyaltyFromJson(Map<String, dynamic> json) => _$_Royalty(
      id: json['id'] as String? ?? '',
      type: $enumDecodeNullable(_$RoyaltyTypeEnumMap, json['type']) ??
          RoyaltyType.fixed,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
    );

Map<String, dynamic> _$$_RoyaltyToJson(_$_Royalty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RoyaltyTypeEnumMap[instance.type],
      'amount': instance.amount,
      'address': instance.address,
    };

const _$RoyaltyTypeEnumMap = {
  RoyaltyType.percent: 'percent',
  RoyaltyType.fixed: 'fixed',
};
