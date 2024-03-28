// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SmartContract _$$_SmartContractFromJson(Map<String, dynamic> json) =>
    _$_SmartContract(
      owner: Wallet.fromJson(json['owner'] as Map<String, dynamic>),
      draftId: json['draftId'] as String? ?? "",
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      minterName: json['minterName'] as String? ?? "",
      description: json['description'] as String? ?? "",
      thumbnail: json['thumbnail'] as String? ?? "",
      primaryAsset: json['primaryAsset'] == null
          ? null
          : Asset.fromJson(json['primaryAsset'] as Map<String, dynamic>),
      rarities: (json['rarities'] as List<dynamic>?)
              ?.map((e) => Rarity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stats: (json['stats'] as List<dynamic>?)
              ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      royalties: (json['royalties'] as List<dynamic>?)
              ?.map((e) => Royalty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      evolves: (json['evolves'] as List<dynamic>?)
              ?.map((e) => Evolve.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tickets: (json['tickets'] as List<dynamic>?)
              ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      multiAssets: (json['multiAssets'] as List<dynamic>?)
              ?.map((e) => MultiAsset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tokenizations: (json['tokenizations'] as List<dynamic>?)
              ?.map((e) => Tokenization.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fractionals: (json['fractionals'] as List<dynamic>?)
              ?.map((e) => Fractional.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pairs: (json['pairs'] as List<dynamic>?)
              ?.map((e) => Pair.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      soulBounds: (json['soulBounds'] as List<dynamic>?)
              ?.map((e) => SoulBound.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      includesBtcTokenization: json['includesBtcTokenization'] ?? false,
      code: json['code'] as String? ?? "",
      isCompiled: json['isCompiled'] as bool? ?? false,
      isPublished: json['isPublished'] as bool? ?? false,
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) => ScProperty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      token: json['token'] == null
          ? null
          : TokenScFeature.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SmartContractToJson(_$_SmartContract instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'draftId': instance.draftId,
      'id': instance.id,
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
      'tokenizations': instance.tokenizations,
      'fractionals': instance.fractionals,
      'pairs': instance.pairs,
      'soulBounds': instance.soulBounds,
      'includesBtcTokenization': instance.includesBtcTokenization,
      'code': instance.code,
      'isCompiled': instance.isCompiled,
      'isPublished': instance.isPublished,
      'properties': instance.properties,
      'token': instance.token,
    };
