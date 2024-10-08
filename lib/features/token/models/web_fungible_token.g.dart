// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_fungible_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebFungibleToken _$$_WebFungibleTokenFromJson(Map<String, dynamic> json) =>
    _$_WebFungibleToken(
      smartContractId: json['sc_identifier'] as String,
      name: json['name'] as String,
      ticker: json['ticker'] as String,
      ownerAddress: json['owner_address'] as String,
      imageUrl: json['image_url'] as String?,
      canMint: json['can_mint'] as bool,
      canBurn: json['can_burn'] as bool,
      canVote: json['can_vote'] as bool,
      isPaused: json['is_paused'] as bool,
      circulatingSupply: (json['circulating_supply'] as num).toDouble(),
      initialSupply: (json['initial_supply'] as num).toDouble(),
      bannedAddresses: (json['banned_addresses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_WebFungibleTokenToJson(_$_WebFungibleToken instance) =>
    <String, dynamic>{
      'sc_identifier': instance.smartContractId,
      'name': instance.name,
      'ticker': instance.ticker,
      'owner_address': instance.ownerAddress,
      'image_url': instance.imageUrl,
      'can_mint': instance.canMint,
      'can_burn': instance.canBurn,
      'can_vote': instance.canVote,
      'is_paused': instance.isPaused,
      'circulating_supply': instance.circulatingSupply,
      'initial_supply': instance.initialSupply,
      'banned_addresses': instance.bannedAddresses,
      'created_at': instance.createdAt.toIso8601String(),
    };
