// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WebListing _$$_WebListingFromJson(Map<String, dynamic> json) =>
    _$_WebListing(
      id: json['id'] as int,
      collection:
          WebCollection.fromJson(json['collection'] as Map<String, dynamic>),
      nft: WebNft.fromJson(json['nft'] as Map<String, dynamic>),
      smartContractUid: json['smart_contract_uid'] as String,
      ownerAddress: json['owner_address'] as String,
      winningAddress: json['winning_address'] as String?,
      buyNowPrice: (json['buy_now_price'] as num?)?.toDouble(),
      floorPrice: (json['floor_price'] as num?)?.toDouble(),
      finalPrice: (json['final_price'] as num?)?.toDouble(),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      isVisibleBeforeStartDate: json['is_visible_before_start_date'] as bool,
      isVisibleAfterEndDate: json['is_visible_after_end_date'] as bool,
      thumbnailsFetched: json['thumbnails_fetched'] as bool,
      thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_WebListingToJson(_$_WebListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collection': instance.collection,
      'nft': instance.nft,
      'smart_contract_uid': instance.smartContractUid,
      'owner_address': instance.ownerAddress,
      'winning_address': instance.winningAddress,
      'buy_now_price': instance.buyNowPrice,
      'floor_price': instance.floorPrice,
      'final_price': instance.finalPrice,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'is_visible_before_start_date': instance.isVisibleBeforeStartDate,
      'is_visible_after_end_date': instance.isVisibleAfterEndDate,
      'thumbnails_fetched': instance.thumbnailsFetched,
      'thumbnails': instance.thumbnails,
    };
