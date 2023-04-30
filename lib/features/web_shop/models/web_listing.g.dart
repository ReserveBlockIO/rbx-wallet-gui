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
      nft: json['nft'] == null
          ? null
          : WebNft.fromJson(json['nft'] as Map<String, dynamic>),
      smartContractUid: json['smart_contract_uid'] as String,
      ownerAddress: json['owner_address'] as String,
      winningAddress: json['winning_address'] as String?,
      buyNowPrice: (json['buy_now_price'] as num?)?.toDouble(),
      floorPrice: (json['floor_price'] as num?)?.toDouble(),
      reservePrice: (json['reserve_price'] as num?)?.toDouble(),
      finalPrice: (json['final_price'] as num?)?.toDouble() ?? 0,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      isVisibleBeforeStartDate: json['is_visible_before_start_date'] as bool,
      isVisibleAfterEndDate: json['is_visible_after_end_date'] as bool,
      isCancelled: json['is_cancelled'] as bool? ?? false,
      isAuctionStarted: json['has_started'] as bool? ?? true,
      isAuctionEnded: json['has_ended'] as bool? ?? false,
      purchaseKey: json['purchase_key'] as String? ?? "",
      thumbnails: (json['thumbnails'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      auction: json['auction'] == null
          ? null
          : WebAuction.fromJson(json['auction'] as Map<String, dynamic>),
      bids: (json['bids'] as List<dynamic>?)
              ?.map((e) => WebBid.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_WebListingToJson(_$_WebListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collection': collectionToJson(instance.collection),
      'smart_contract_uid': instance.smartContractUid,
      'owner_address': instance.ownerAddress,
      'winning_address': instance.winningAddress,
      'buy_now_price': instance.buyNowPrice,
      'floor_price': instance.floorPrice,
      'reserve_price': instance.reservePrice,
      'final_price': instance.finalPrice,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'is_visible_before_start_date': instance.isVisibleBeforeStartDate,
      'is_visible_after_end_date': instance.isVisibleAfterEndDate,
      'is_cancelled': instance.isCancelled,
      'has_started': instance.isAuctionStarted,
      'has_ended': instance.isAuctionEnded,
      'purchase_key': instance.purchaseKey,
      'thumbnails': instance.thumbnails,
      'auction': instance.auction,
      'bids': instance.bids,
    };
