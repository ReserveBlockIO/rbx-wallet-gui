// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebAddress _$$_WebAddressFromJson(Map<String, dynamic> json) =>
    _$_WebAddress(
      address: json['address'] as String,
      balance: (json['balance'] as num).toDouble(),
      balanceTotal: (json['balance_total'] as num?)?.toDouble() ?? 0,
      balanceLocked: (json['balance_locked'] as num?)?.toDouble() ?? 0,
      adnr: json['adnr'] as String?,
    );

Map<String, dynamic> _$$_WebAddressToJson(_$_WebAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'balance': instance.balance,
      'balance_total': instance.balanceTotal,
      'balance_locked': instance.balanceLocked,
      'adnr': instance.adnr,
    };
