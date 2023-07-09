// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Balance _$$_BalanceFromJson(Map<String, dynamic> json) => _$_Balance(
      address: json['Address'] as String,
      balance: json['RBXBalance'] as String,
      lockedBalance: json['RBXLockedBalance'] as String,
      tokens: (json['TokenAccounts'] as List<dynamic>)
          .map((e) => TokenAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BalanceToJson(_$_Balance instance) =>
    <String, dynamic>{
      'Address': instance.address,
      'RBXBalance': instance.balance,
      'RBXLockedBalance': instance.lockedBalance,
      'TokenAccounts': instance.tokens,
    };
