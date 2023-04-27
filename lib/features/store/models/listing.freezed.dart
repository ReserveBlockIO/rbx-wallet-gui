// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return _Listing.fromJson(json);
}

/// @nodoc
mixin _$Listing {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Store get store => throw _privateConstructorUsedError;
  WebNft get nft => throw _privateConstructorUsedError;
  @JsonKey(name: "preview_urls")
  List<String> get previewUrls => throw _privateConstructorUsedError;
  @JsonKey(name: "is_auction")
  bool get isAuction => throw _privateConstructorUsedError;
  @JsonKey(name: "is_buy_now")
  bool get isBuyNow => throw _privateConstructorUsedError;
  @JsonKey(name: "buy_now_price")
  double? get buyNowPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "buy_now_price_rbx")
  double? get buyNowPriceRbx => throw _privateConstructorUsedError;
  @JsonKey(name: "floor_price")
  double? get floorPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "floor_price_rbx")
  double? get floorPriceRbx => throw _privateConstructorUsedError;
  List<Bid> get bids => throw _privateConstructorUsedError;
  @JsonKey(name: "is_purchased")
  bool get isPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: "highest_bid")
  Bid? get highestBid => throw _privateConstructorUsedError;
  @JsonKey(name: "starts_at")
  DateTime get startsAt => throw _privateConstructorUsedError;
  @JsonKey(name: "ends_at")
  DateTime? get endsAt => throw _privateConstructorUsedError;
  @JsonKey(name: "allow_rbx")
  bool get allowRbx => throw _privateConstructorUsedError;
  @JsonKey(name: "allow_cc")
  bool get allowCC => throw _privateConstructorUsedError;
  @JsonKey(name: "append_description_text")
  String? get appendDescriptionText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingCopyWith<Listing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingCopyWith<$Res> {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) then) =
      _$ListingCopyWithImpl<$Res, Listing>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String slug,
      String name,
      String description,
      Store store,
      WebNft nft,
      @JsonKey(name: "preview_urls") List<String> previewUrls,
      @JsonKey(name: "is_auction") bool isAuction,
      @JsonKey(name: "is_buy_now") bool isBuyNow,
      @JsonKey(name: "buy_now_price") double? buyNowPrice,
      @JsonKey(name: "buy_now_price_rbx") double? buyNowPriceRbx,
      @JsonKey(name: "floor_price") double? floorPrice,
      @JsonKey(name: "floor_price_rbx") double? floorPriceRbx,
      List<Bid> bids,
      @JsonKey(name: "is_purchased") bool isPurchased,
      @JsonKey(name: "highest_bid") Bid? highestBid,
      @JsonKey(name: "starts_at") DateTime startsAt,
      @JsonKey(name: "ends_at") DateTime? endsAt,
      @JsonKey(name: "allow_rbx") bool allowRbx,
      @JsonKey(name: "allow_cc") bool allowCC,
      @JsonKey(name: "append_description_text") String? appendDescriptionText});

  $StoreCopyWith<$Res> get store;
  $WebNftCopyWith<$Res> get nft;
  $BidCopyWith<$Res>? get highestBid;
}

/// @nodoc
class _$ListingCopyWithImpl<$Res, $Val extends Listing>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? slug = null,
    Object? name = null,
    Object? description = null,
    Object? store = null,
    Object? nft = null,
    Object? previewUrls = null,
    Object? isAuction = null,
    Object? isBuyNow = null,
    Object? buyNowPrice = freezed,
    Object? buyNowPriceRbx = freezed,
    Object? floorPrice = freezed,
    Object? floorPriceRbx = freezed,
    Object? bids = null,
    Object? isPurchased = null,
    Object? highestBid = freezed,
    Object? startsAt = null,
    Object? endsAt = freezed,
    Object? allowRbx = null,
    Object? allowCC = null,
    Object? appendDescriptionText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as WebNft,
      previewUrls: null == previewUrls
          ? _value.previewUrls
          : previewUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAuction: null == isAuction
          ? _value.isAuction
          : isAuction // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyNow: null == isBuyNow
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      buyNowPriceRbx: freezed == buyNowPriceRbx
          ? _value.buyNowPriceRbx
          : buyNowPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPriceRbx: freezed == floorPriceRbx
          ? _value.floorPriceRbx
          : floorPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      bids: null == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<Bid>,
      isPurchased: null == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      highestBid: freezed == highestBid
          ? _value.highestBid
          : highestBid // ignore: cast_nullable_to_non_nullable
              as Bid?,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      allowRbx: null == allowRbx
          ? _value.allowRbx
          : allowRbx // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCC: null == allowCC
          ? _value.allowCC
          : allowCC // ignore: cast_nullable_to_non_nullable
              as bool,
      appendDescriptionText: freezed == appendDescriptionText
          ? _value.appendDescriptionText
          : appendDescriptionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreCopyWith<$Res> get store {
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WebNftCopyWith<$Res> get nft {
    return $WebNftCopyWith<$Res>(_value.nft, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BidCopyWith<$Res>? get highestBid {
    if (_value.highestBid == null) {
      return null;
    }

    return $BidCopyWith<$Res>(_value.highestBid!, (value) {
      return _then(_value.copyWith(highestBid: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ListingCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$$_ListingCopyWith(
          _$_Listing value, $Res Function(_$_Listing) then) =
      __$$_ListingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String slug,
      String name,
      String description,
      Store store,
      WebNft nft,
      @JsonKey(name: "preview_urls") List<String> previewUrls,
      @JsonKey(name: "is_auction") bool isAuction,
      @JsonKey(name: "is_buy_now") bool isBuyNow,
      @JsonKey(name: "buy_now_price") double? buyNowPrice,
      @JsonKey(name: "buy_now_price_rbx") double? buyNowPriceRbx,
      @JsonKey(name: "floor_price") double? floorPrice,
      @JsonKey(name: "floor_price_rbx") double? floorPriceRbx,
      List<Bid> bids,
      @JsonKey(name: "is_purchased") bool isPurchased,
      @JsonKey(name: "highest_bid") Bid? highestBid,
      @JsonKey(name: "starts_at") DateTime startsAt,
      @JsonKey(name: "ends_at") DateTime? endsAt,
      @JsonKey(name: "allow_rbx") bool allowRbx,
      @JsonKey(name: "allow_cc") bool allowCC,
      @JsonKey(name: "append_description_text") String? appendDescriptionText});

  @override
  $StoreCopyWith<$Res> get store;
  @override
  $WebNftCopyWith<$Res> get nft;
  @override
  $BidCopyWith<$Res>? get highestBid;
}

/// @nodoc
class __$$_ListingCopyWithImpl<$Res>
    extends _$ListingCopyWithImpl<$Res, _$_Listing>
    implements _$$_ListingCopyWith<$Res> {
  __$$_ListingCopyWithImpl(_$_Listing _value, $Res Function(_$_Listing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? slug = null,
    Object? name = null,
    Object? description = null,
    Object? store = null,
    Object? nft = null,
    Object? previewUrls = null,
    Object? isAuction = null,
    Object? isBuyNow = null,
    Object? buyNowPrice = freezed,
    Object? buyNowPriceRbx = freezed,
    Object? floorPrice = freezed,
    Object? floorPriceRbx = freezed,
    Object? bids = null,
    Object? isPurchased = null,
    Object? highestBid = freezed,
    Object? startsAt = null,
    Object? endsAt = freezed,
    Object? allowRbx = null,
    Object? allowCC = null,
    Object? appendDescriptionText = freezed,
  }) {
    return _then(_$_Listing(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as WebNft,
      previewUrls: null == previewUrls
          ? _value._previewUrls
          : previewUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAuction: null == isAuction
          ? _value.isAuction
          : isAuction // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyNow: null == isBuyNow
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      buyNowPriceRbx: freezed == buyNowPriceRbx
          ? _value.buyNowPriceRbx
          : buyNowPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPriceRbx: freezed == floorPriceRbx
          ? _value.floorPriceRbx
          : floorPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      bids: null == bids
          ? _value._bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<Bid>,
      isPurchased: null == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      highestBid: freezed == highestBid
          ? _value.highestBid
          : highestBid // ignore: cast_nullable_to_non_nullable
              as Bid?,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      allowRbx: null == allowRbx
          ? _value.allowRbx
          : allowRbx // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCC: null == allowCC
          ? _value.allowCC
          : allowCC // ignore: cast_nullable_to_non_nullable
              as bool,
      appendDescriptionText: freezed == appendDescriptionText
          ? _value.appendDescriptionText
          : appendDescriptionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Listing extends _Listing {
  _$_Listing(
      {required this.id,
      required this.uuid,
      required this.slug,
      required this.name,
      required this.description,
      required this.store,
      required this.nft,
      @JsonKey(name: "preview_urls") required final List<String> previewUrls,
      @JsonKey(name: "is_auction") required this.isAuction,
      @JsonKey(name: "is_buy_now") required this.isBuyNow,
      @JsonKey(name: "buy_now_price") this.buyNowPrice,
      @JsonKey(name: "buy_now_price_rbx") this.buyNowPriceRbx,
      @JsonKey(name: "floor_price") this.floorPrice,
      @JsonKey(name: "floor_price_rbx") this.floorPriceRbx,
      required final List<Bid> bids,
      @JsonKey(name: "is_purchased") required this.isPurchased,
      @JsonKey(name: "highest_bid") this.highestBid,
      @JsonKey(name: "starts_at") required this.startsAt,
      @JsonKey(name: "ends_at") this.endsAt,
      @JsonKey(name: "allow_rbx") required this.allowRbx,
      @JsonKey(name: "allow_cc") required this.allowCC,
      @JsonKey(name: "append_description_text") this.appendDescriptionText})
      : _previewUrls = previewUrls,
        _bids = bids,
        super._();

  factory _$_Listing.fromJson(Map<String, dynamic> json) =>
      _$$_ListingFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String slug;
  @override
  final String name;
  @override
  final String description;
  @override
  final Store store;
  @override
  final WebNft nft;
  final List<String> _previewUrls;
  @override
  @JsonKey(name: "preview_urls")
  List<String> get previewUrls {
    if (_previewUrls is EqualUnmodifiableListView) return _previewUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previewUrls);
  }

  @override
  @JsonKey(name: "is_auction")
  final bool isAuction;
  @override
  @JsonKey(name: "is_buy_now")
  final bool isBuyNow;
  @override
  @JsonKey(name: "buy_now_price")
  final double? buyNowPrice;
  @override
  @JsonKey(name: "buy_now_price_rbx")
  final double? buyNowPriceRbx;
  @override
  @JsonKey(name: "floor_price")
  final double? floorPrice;
  @override
  @JsonKey(name: "floor_price_rbx")
  final double? floorPriceRbx;
  final List<Bid> _bids;
  @override
  List<Bid> get bids {
    if (_bids is EqualUnmodifiableListView) return _bids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bids);
  }

  @override
  @JsonKey(name: "is_purchased")
  final bool isPurchased;
  @override
  @JsonKey(name: "highest_bid")
  final Bid? highestBid;
  @override
  @JsonKey(name: "starts_at")
  final DateTime startsAt;
  @override
  @JsonKey(name: "ends_at")
  final DateTime? endsAt;
  @override
  @JsonKey(name: "allow_rbx")
  final bool allowRbx;
  @override
  @JsonKey(name: "allow_cc")
  final bool allowCC;
  @override
  @JsonKey(name: "append_description_text")
  final String? appendDescriptionText;

  @override
  String toString() {
    return 'Listing(id: $id, uuid: $uuid, slug: $slug, name: $name, description: $description, store: $store, nft: $nft, previewUrls: $previewUrls, isAuction: $isAuction, isBuyNow: $isBuyNow, buyNowPrice: $buyNowPrice, buyNowPriceRbx: $buyNowPriceRbx, floorPrice: $floorPrice, floorPriceRbx: $floorPriceRbx, bids: $bids, isPurchased: $isPurchased, highestBid: $highestBid, startsAt: $startsAt, endsAt: $endsAt, allowRbx: $allowRbx, allowCC: $allowCC, appendDescriptionText: $appendDescriptionText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Listing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.nft, nft) || other.nft == nft) &&
            const DeepCollectionEquality()
                .equals(other._previewUrls, _previewUrls) &&
            (identical(other.isAuction, isAuction) ||
                other.isAuction == isAuction) &&
            (identical(other.isBuyNow, isBuyNow) ||
                other.isBuyNow == isBuyNow) &&
            (identical(other.buyNowPrice, buyNowPrice) ||
                other.buyNowPrice == buyNowPrice) &&
            (identical(other.buyNowPriceRbx, buyNowPriceRbx) ||
                other.buyNowPriceRbx == buyNowPriceRbx) &&
            (identical(other.floorPrice, floorPrice) ||
                other.floorPrice == floorPrice) &&
            (identical(other.floorPriceRbx, floorPriceRbx) ||
                other.floorPriceRbx == floorPriceRbx) &&
            const DeepCollectionEquality().equals(other._bids, _bids) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.highestBid, highestBid) ||
                other.highestBid == highestBid) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.allowRbx, allowRbx) ||
                other.allowRbx == allowRbx) &&
            (identical(other.allowCC, allowCC) || other.allowCC == allowCC) &&
            (identical(other.appendDescriptionText, appendDescriptionText) ||
                other.appendDescriptionText == appendDescriptionText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        slug,
        name,
        description,
        store,
        nft,
        const DeepCollectionEquality().hash(_previewUrls),
        isAuction,
        isBuyNow,
        buyNowPrice,
        buyNowPriceRbx,
        floorPrice,
        floorPriceRbx,
        const DeepCollectionEquality().hash(_bids),
        isPurchased,
        highestBid,
        startsAt,
        endsAt,
        allowRbx,
        allowCC,
        appendDescriptionText
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListingCopyWith<_$_Listing> get copyWith =>
      __$$_ListingCopyWithImpl<_$_Listing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListingToJson(
      this,
    );
  }
}

abstract class _Listing extends Listing {
  factory _Listing(
      {required final int id,
      required final String uuid,
      required final String slug,
      required final String name,
      required final String description,
      required final Store store,
      required final WebNft nft,
      @JsonKey(name: "preview_urls")
          required final List<String> previewUrls,
      @JsonKey(name: "is_auction")
          required final bool isAuction,
      @JsonKey(name: "is_buy_now")
          required final bool isBuyNow,
      @JsonKey(name: "buy_now_price")
          final double? buyNowPrice,
      @JsonKey(name: "buy_now_price_rbx")
          final double? buyNowPriceRbx,
      @JsonKey(name: "floor_price")
          final double? floorPrice,
      @JsonKey(name: "floor_price_rbx")
          final double? floorPriceRbx,
      required final List<Bid> bids,
      @JsonKey(name: "is_purchased")
          required final bool isPurchased,
      @JsonKey(name: "highest_bid")
          final Bid? highestBid,
      @JsonKey(name: "starts_at")
          required final DateTime startsAt,
      @JsonKey(name: "ends_at")
          final DateTime? endsAt,
      @JsonKey(name: "allow_rbx")
          required final bool allowRbx,
      @JsonKey(name: "allow_cc")
          required final bool allowCC,
      @JsonKey(name: "append_description_text")
          final String? appendDescriptionText}) = _$_Listing;
  _Listing._() : super._();

  factory _Listing.fromJson(Map<String, dynamic> json) = _$_Listing.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get slug;
  @override
  String get name;
  @override
  String get description;
  @override
  Store get store;
  @override
  WebNft get nft;
  @override
  @JsonKey(name: "preview_urls")
  List<String> get previewUrls;
  @override
  @JsonKey(name: "is_auction")
  bool get isAuction;
  @override
  @JsonKey(name: "is_buy_now")
  bool get isBuyNow;
  @override
  @JsonKey(name: "buy_now_price")
  double? get buyNowPrice;
  @override
  @JsonKey(name: "buy_now_price_rbx")
  double? get buyNowPriceRbx;
  @override
  @JsonKey(name: "floor_price")
  double? get floorPrice;
  @override
  @JsonKey(name: "floor_price_rbx")
  double? get floorPriceRbx;
  @override
  List<Bid> get bids;
  @override
  @JsonKey(name: "is_purchased")
  bool get isPurchased;
  @override
  @JsonKey(name: "highest_bid")
  Bid? get highestBid;
  @override
  @JsonKey(name: "starts_at")
  DateTime get startsAt;
  @override
  @JsonKey(name: "ends_at")
  DateTime? get endsAt;
  @override
  @JsonKey(name: "allow_rbx")
  bool get allowRbx;
  @override
  @JsonKey(name: "allow_cc")
  bool get allowCC;
  @override
  @JsonKey(name: "append_description_text")
  String? get appendDescriptionText;
  @override
  @JsonKey(ignore: true)
  _$$_ListingCopyWith<_$_Listing> get copyWith =>
      throw _privateConstructorUsedError;
}
