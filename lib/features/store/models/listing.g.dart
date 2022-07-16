// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Listing _$$_ListingFromJson(Map<String, dynamic> json) => _$_Listing(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
      smartContractData: json['smart_contract_data'] as Map<String, dynamic>?,
      previewUrls: (json['preview_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isAuction: json['is_auction'] as bool,
      isBuyNow: json['is_buy_now'] as bool,
      buyNowPrice: (json['buy_now_price'] as num?)?.toDouble(),
      buyNowPriceRbx: (json['buy_now_price_rbx'] as num?)?.toDouble(),
      floorPrice: (json['floor_price'] as num?)?.toDouble(),
      floorPriceRbx: (json['floor_price_rbx'] as num?)?.toDouble(),
      bids: (json['bids'] as List<dynamic>)
          .map((e) => Bid.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPurchased: json['is_purchased'] as bool,
      highestBid: json['highest_bid'] == null
          ? null
          : Bid.fromJson(json['highest_bid'] as Map<String, dynamic>),
      startsAt: DateTime.parse(json['starts_at'] as String),
      endsAt: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
      allowRbx: json['allow_rbx'] as bool,
      allowCC: json['allow_cc'] as bool,
    );

Map<String, dynamic> _$$_ListingToJson(_$_Listing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'store': instance.store,
      'smart_contract_data': instance.smartContractData,
      'preview_urls': instance.previewUrls,
      'is_auction': instance.isAuction,
      'is_buy_now': instance.isBuyNow,
      'buy_now_price': instance.buyNowPrice,
      'buy_now_price_rbx': instance.buyNowPriceRbx,
      'floor_price': instance.floorPrice,
      'floor_price_rbx': instance.floorPriceRbx,
      'bids': instance.bids,
      'is_purchased': instance.isPurchased,
      'highest_bid': instance.highestBid,
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
      'allow_rbx': instance.allowRbx,
      'allow_cc': instance.allowCC,
    };
