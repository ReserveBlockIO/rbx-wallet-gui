// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: "smart_contract_data")
  Map<String, dynamic>? get smartContractData =>
      throw _privateConstructorUsedError;
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingCopyWith<Listing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingCopyWith<$Res> {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) then) =
      _$ListingCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String uuid,
      String slug,
      String name,
      String description,
      Store store,
      @JsonKey(name: "smart_contract_data")
          Map<String, dynamic>? smartContractData,
      @JsonKey(name: "preview_urls")
          List<String> previewUrls,
      @JsonKey(name: "is_auction")
          bool isAuction,
      @JsonKey(name: "is_buy_now")
          bool isBuyNow,
      @JsonKey(name: "buy_now_price")
          double? buyNowPrice,
      @JsonKey(name: "buy_now_price_rbx")
          double? buyNowPriceRbx,
      @JsonKey(name: "floor_price")
          double? floorPrice,
      @JsonKey(name: "floor_price_rbx")
          double? floorPriceRbx,
      List<Bid> bids,
      @JsonKey(name: "is_purchased")
          bool isPurchased,
      @JsonKey(name: "highest_bid")
          Bid? highestBid,
      @JsonKey(name: "starts_at")
          DateTime startsAt,
      @JsonKey(name: "ends_at")
          DateTime? endsAt});

  $StoreCopyWith<$Res> get store;
  $BidCopyWith<$Res>? get highestBid;
}

/// @nodoc
class _$ListingCopyWithImpl<$Res> implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._value, this._then);

  final Listing _value;
  // ignore: unused_field
  final $Res Function(Listing) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? store = freezed,
    Object? smartContractData = freezed,
    Object? previewUrls = freezed,
    Object? isAuction = freezed,
    Object? isBuyNow = freezed,
    Object? buyNowPrice = freezed,
    Object? buyNowPriceRbx = freezed,
    Object? floorPrice = freezed,
    Object? floorPriceRbx = freezed,
    Object? bids = freezed,
    Object? isPurchased = freezed,
    Object? highestBid = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      store: store == freezed
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      smartContractData: smartContractData == freezed
          ? _value.smartContractData
          : smartContractData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      previewUrls: previewUrls == freezed
          ? _value.previewUrls
          : previewUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAuction: isAuction == freezed
          ? _value.isAuction
          : isAuction // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyNow: isBuyNow == freezed
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      buyNowPrice: buyNowPrice == freezed
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      buyNowPriceRbx: buyNowPriceRbx == freezed
          ? _value.buyNowPriceRbx
          : buyNowPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPrice: floorPrice == freezed
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPriceRbx: floorPriceRbx == freezed
          ? _value.floorPriceRbx
          : floorPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      bids: bids == freezed
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<Bid>,
      isPurchased: isPurchased == freezed
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      highestBid: highestBid == freezed
          ? _value.highestBid
          : highestBid // ignore: cast_nullable_to_non_nullable
              as Bid?,
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $StoreCopyWith<$Res> get store {
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value));
    });
  }

  @override
  $BidCopyWith<$Res>? get highestBid {
    if (_value.highestBid == null) {
      return null;
    }

    return $BidCopyWith<$Res>(_value.highestBid!, (value) {
      return _then(_value.copyWith(highestBid: value));
    });
  }
}

/// @nodoc
abstract class _$$_ListingCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$$_ListingCopyWith(
          _$_Listing value, $Res Function(_$_Listing) then) =
      __$$_ListingCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String uuid,
      String slug,
      String name,
      String description,
      Store store,
      @JsonKey(name: "smart_contract_data")
          Map<String, dynamic>? smartContractData,
      @JsonKey(name: "preview_urls")
          List<String> previewUrls,
      @JsonKey(name: "is_auction")
          bool isAuction,
      @JsonKey(name: "is_buy_now")
          bool isBuyNow,
      @JsonKey(name: "buy_now_price")
          double? buyNowPrice,
      @JsonKey(name: "buy_now_price_rbx")
          double? buyNowPriceRbx,
      @JsonKey(name: "floor_price")
          double? floorPrice,
      @JsonKey(name: "floor_price_rbx")
          double? floorPriceRbx,
      List<Bid> bids,
      @JsonKey(name: "is_purchased")
          bool isPurchased,
      @JsonKey(name: "highest_bid")
          Bid? highestBid,
      @JsonKey(name: "starts_at")
          DateTime startsAt,
      @JsonKey(name: "ends_at")
          DateTime? endsAt});

  @override
  $StoreCopyWith<$Res> get store;
  @override
  $BidCopyWith<$Res>? get highestBid;
}

/// @nodoc
class __$$_ListingCopyWithImpl<$Res> extends _$ListingCopyWithImpl<$Res>
    implements _$$_ListingCopyWith<$Res> {
  __$$_ListingCopyWithImpl(_$_Listing _value, $Res Function(_$_Listing) _then)
      : super(_value, (v) => _then(v as _$_Listing));

  @override
  _$_Listing get _value => super._value as _$_Listing;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? store = freezed,
    Object? smartContractData = freezed,
    Object? previewUrls = freezed,
    Object? isAuction = freezed,
    Object? isBuyNow = freezed,
    Object? buyNowPrice = freezed,
    Object? buyNowPriceRbx = freezed,
    Object? floorPrice = freezed,
    Object? floorPriceRbx = freezed,
    Object? bids = freezed,
    Object? isPurchased = freezed,
    Object? highestBid = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_$_Listing(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      store: store == freezed
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
      smartContractData: smartContractData == freezed
          ? _value._smartContractData
          : smartContractData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      previewUrls: previewUrls == freezed
          ? _value._previewUrls
          : previewUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAuction: isAuction == freezed
          ? _value.isAuction
          : isAuction // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyNow: isBuyNow == freezed
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      buyNowPrice: buyNowPrice == freezed
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      buyNowPriceRbx: buyNowPriceRbx == freezed
          ? _value.buyNowPriceRbx
          : buyNowPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPrice: floorPrice == freezed
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPriceRbx: floorPriceRbx == freezed
          ? _value.floorPriceRbx
          : floorPriceRbx // ignore: cast_nullable_to_non_nullable
              as double?,
      bids: bids == freezed
          ? _value._bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<Bid>,
      isPurchased: isPurchased == freezed
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool,
      highestBid: highestBid == freezed
          ? _value.highestBid
          : highestBid // ignore: cast_nullable_to_non_nullable
              as Bid?,
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      @JsonKey(name: "smart_contract_data")
          final Map<String, dynamic>? smartContractData,
      @JsonKey(name: "preview_urls")
          required final List<String> previewUrls,
      @JsonKey(name: "is_auction")
          required this.isAuction,
      @JsonKey(name: "is_buy_now")
          required this.isBuyNow,
      @JsonKey(name: "buy_now_price")
          this.buyNowPrice,
      @JsonKey(name: "buy_now_price_rbx")
          this.buyNowPriceRbx,
      @JsonKey(name: "floor_price")
          this.floorPrice,
      @JsonKey(name: "floor_price_rbx")
          this.floorPriceRbx,
      required final List<Bid> bids,
      @JsonKey(name: "is_purchased")
          required this.isPurchased,
      @JsonKey(name: "highest_bid")
          this.highestBid,
      @JsonKey(name: "starts_at")
          required this.startsAt,
      @JsonKey(name: "ends_at")
          this.endsAt})
      : _smartContractData = smartContractData,
        _previewUrls = previewUrls,
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
  final Map<String, dynamic>? _smartContractData;
  @override
  @JsonKey(name: "smart_contract_data")
  Map<String, dynamic>? get smartContractData {
    final value = _smartContractData;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String> _previewUrls;
  @override
  @JsonKey(name: "preview_urls")
  List<String> get previewUrls {
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
  String toString() {
    return 'Listing(id: $id, uuid: $uuid, slug: $slug, name: $name, description: $description, store: $store, smartContractData: $smartContractData, previewUrls: $previewUrls, isAuction: $isAuction, isBuyNow: $isBuyNow, buyNowPrice: $buyNowPrice, buyNowPriceRbx: $buyNowPriceRbx, floorPrice: $floorPrice, floorPriceRbx: $floorPriceRbx, bids: $bids, isPurchased: $isPurchased, highestBid: $highestBid, startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Listing &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.store, store) &&
            const DeepCollectionEquality()
                .equals(other._smartContractData, _smartContractData) &&
            const DeepCollectionEquality()
                .equals(other._previewUrls, _previewUrls) &&
            const DeepCollectionEquality().equals(other.isAuction, isAuction) &&
            const DeepCollectionEquality().equals(other.isBuyNow, isBuyNow) &&
            const DeepCollectionEquality()
                .equals(other.buyNowPrice, buyNowPrice) &&
            const DeepCollectionEquality()
                .equals(other.buyNowPriceRbx, buyNowPriceRbx) &&
            const DeepCollectionEquality()
                .equals(other.floorPrice, floorPrice) &&
            const DeepCollectionEquality()
                .equals(other.floorPriceRbx, floorPriceRbx) &&
            const DeepCollectionEquality().equals(other._bids, _bids) &&
            const DeepCollectionEquality()
                .equals(other.isPurchased, isPurchased) &&
            const DeepCollectionEquality()
                .equals(other.highestBid, highestBid) &&
            const DeepCollectionEquality().equals(other.startsAt, startsAt) &&
            const DeepCollectionEquality().equals(other.endsAt, endsAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(uuid),
        const DeepCollectionEquality().hash(slug),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(description),
        const DeepCollectionEquality().hash(store),
        const DeepCollectionEquality().hash(_smartContractData),
        const DeepCollectionEquality().hash(_previewUrls),
        const DeepCollectionEquality().hash(isAuction),
        const DeepCollectionEquality().hash(isBuyNow),
        const DeepCollectionEquality().hash(buyNowPrice),
        const DeepCollectionEquality().hash(buyNowPriceRbx),
        const DeepCollectionEquality().hash(floorPrice),
        const DeepCollectionEquality().hash(floorPriceRbx),
        const DeepCollectionEquality().hash(_bids),
        const DeepCollectionEquality().hash(isPurchased),
        const DeepCollectionEquality().hash(highestBid),
        const DeepCollectionEquality().hash(startsAt),
        const DeepCollectionEquality().hash(endsAt)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_ListingCopyWith<_$_Listing> get copyWith =>
      __$$_ListingCopyWithImpl<_$_Listing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListingToJson(this);
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
      @JsonKey(name: "smart_contract_data")
          final Map<String, dynamic>? smartContractData,
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
          final DateTime? endsAt}) = _$_Listing;
  _Listing._() : super._();

  factory _Listing.fromJson(Map<String, dynamic> json) = _$_Listing.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get uuid => throw _privateConstructorUsedError;
  @override
  String get slug => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  Store get store => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "smart_contract_data")
  Map<String, dynamic>? get smartContractData =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "preview_urls")
  List<String> get previewUrls => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "is_auction")
  bool get isAuction => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "is_buy_now")
  bool get isBuyNow => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "buy_now_price")
  double? get buyNowPrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "buy_now_price_rbx")
  double? get buyNowPriceRbx => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "floor_price")
  double? get floorPrice => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "floor_price_rbx")
  double? get floorPriceRbx => throw _privateConstructorUsedError;
  @override
  List<Bid> get bids => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "is_purchased")
  bool get isPurchased => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "highest_bid")
  Bid? get highestBid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "starts_at")
  DateTime get startsAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ends_at")
  DateTime? get endsAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ListingCopyWith<_$_Listing> get copyWith =>
      throw _privateConstructorUsedError;
}
