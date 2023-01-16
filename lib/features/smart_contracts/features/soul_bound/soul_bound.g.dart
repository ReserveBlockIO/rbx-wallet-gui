// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soul_bound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SoulBound _$$_SoulBoundFromJson(Map<String, dynamic> json) => _$_SoulBound(
      id: json['id'] as String? ?? "",
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      ownerAddress: json['ownerAddress'] as String? ?? "",
      beneficiaryAddress: json['beneficiaryAddress'] as String?,
    );

Map<String, dynamic> _$$_SoulBoundToJson(_$_SoulBound instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'ownerAddress': instance.ownerAddress,
      'beneficiaryAddress': instance.beneficiaryAddress,
    };
