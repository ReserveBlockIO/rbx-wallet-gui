// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SmartContract _$$_SmartContractFromJson(Map<String, dynamic> json) =>
    _$_SmartContract(
      owner: Wallet.fromJson(json['owner'] as Map<String, dynamic>),
      draftId: json['draftId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      minterName: json['minterName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      primaryAsset: json['primaryAsset'] == null
          ? null
          : Asset.fromJson(json['primaryAsset'] as Map<String, dynamic>),
      rarities: (json['rarities'] as List<dynamic>?)
              ?.map((e) => Rarity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      stats: (json['stats'] as List<dynamic>?)
              ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      royalties: (json['royalties'] as List<dynamic>?)
              ?.map((e) => Royalty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      evolves: (json['evolves'] as List<dynamic>?)
              ?.map((e) => Evolve.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tickets: (json['tickets'] as List<dynamic>?)
              ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      multiAssets: (json['multiAssets'] as List<dynamic>?)
              ?.map((e) => MultiAsset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      code: json['code'] as String? ?? '',
      isCompiled: json['isCompiled'] as bool? ?? false,
      isPublished: json['isPublished'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SmartContractToJson(_$_SmartContract instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'draftId': instance.draftId,
      'name': instance.name,
      'minterName': instance.minterName,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'primaryAsset': instance.primaryAsset,
      'rarities': instance.rarities,
      'stats': instance.stats,
      'royalties': instance.royalties,
      'evolves': instance.evolves,
      'tickets': instance.tickets,
      'multiAssets': instance.multiAssets,
      'code': instance.code,
      'isCompiled': instance.isCompiled,
      'isPublished': instance.isPublished,
    };
