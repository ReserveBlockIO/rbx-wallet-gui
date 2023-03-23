// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrganizedShop {
  DecShop get decShop => throw _privateConstructorUsedError;
  List<OrganizedCollection> get collections =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrganizedShopCopyWith<OrganizedShop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizedShopCopyWith<$Res> {
  factory $OrganizedShopCopyWith(
          OrganizedShop value, $Res Function(OrganizedShop) then) =
      _$OrganizedShopCopyWithImpl<$Res, OrganizedShop>;
  @useResult
  $Res call({DecShop decShop, List<OrganizedCollection> collections});

  $DecShopCopyWith<$Res> get decShop;
}

/// @nodoc
class _$OrganizedShopCopyWithImpl<$Res, $Val extends OrganizedShop>
    implements $OrganizedShopCopyWith<$Res> {
  _$OrganizedShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decShop = null,
    Object? collections = null,
  }) {
    return _then(_value.copyWith(
      decShop: null == decShop
          ? _value.decShop
          : decShop // ignore: cast_nullable_to_non_nullable
              as DecShop,
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<OrganizedCollection>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DecShopCopyWith<$Res> get decShop {
    return $DecShopCopyWith<$Res>(_value.decShop, (value) {
      return _then(_value.copyWith(decShop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrganizedShopCopyWith<$Res>
    implements $OrganizedShopCopyWith<$Res> {
  factory _$$_OrganizedShopCopyWith(
          _$_OrganizedShop value, $Res Function(_$_OrganizedShop) then) =
      __$$_OrganizedShopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DecShop decShop, List<OrganizedCollection> collections});

  @override
  $DecShopCopyWith<$Res> get decShop;
}

/// @nodoc
class __$$_OrganizedShopCopyWithImpl<$Res>
    extends _$OrganizedShopCopyWithImpl<$Res, _$_OrganizedShop>
    implements _$$_OrganizedShopCopyWith<$Res> {
  __$$_OrganizedShopCopyWithImpl(
      _$_OrganizedShop _value, $Res Function(_$_OrganizedShop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decShop = null,
    Object? collections = null,
  }) {
    return _then(_$_OrganizedShop(
      decShop: null == decShop
          ? _value.decShop
          : decShop // ignore: cast_nullable_to_non_nullable
              as DecShop,
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<OrganizedCollection>,
    ));
  }
}

/// @nodoc

class _$_OrganizedShop extends _OrganizedShop {
  _$_OrganizedShop(
      {required this.decShop,
      final List<OrganizedCollection> collections = const []})
      : _collections = collections,
        super._();

  @override
  final DecShop decShop;
  final List<OrganizedCollection> _collections;
  @override
  @JsonKey()
  List<OrganizedCollection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  String toString() {
    return 'OrganizedShop(decShop: $decShop, collections: $collections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizedShop &&
            (identical(other.decShop, decShop) || other.decShop == decShop) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, decShop, const DeepCollectionEquality().hash(_collections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizedShopCopyWith<_$_OrganizedShop> get copyWith =>
      __$$_OrganizedShopCopyWithImpl<_$_OrganizedShop>(this, _$identity);
}

abstract class _OrganizedShop extends OrganizedShop {
  factory _OrganizedShop(
      {required final DecShop decShop,
      final List<OrganizedCollection> collections}) = _$_OrganizedShop;
  _OrganizedShop._() : super._();

  @override
  DecShop get decShop;
  @override
  List<OrganizedCollection> get collections;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizedShopCopyWith<_$_OrganizedShop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrganizedCollection {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get collectionLive => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  List<OrganizedListing> get listings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrganizedCollectionCopyWith<OrganizedCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizedCollectionCopyWith<$Res> {
  factory $OrganizedCollectionCopyWith(
          OrganizedCollection value, $Res Function(OrganizedCollection) then) =
      _$OrganizedCollectionCopyWithImpl<$Res, OrganizedCollection>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      bool collectionLive,
      bool isDefault,
      List<OrganizedListing> listings});
}

/// @nodoc
class _$OrganizedCollectionCopyWithImpl<$Res, $Val extends OrganizedCollection>
    implements $OrganizedCollectionCopyWith<$Res> {
  _$OrganizedCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? collectionLive = null,
    Object? isDefault = null,
    Object? listings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      collectionLive: null == collectionLive
          ? _value.collectionLive
          : collectionLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      listings: null == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<OrganizedListing>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrganizedCollectionCopyWith<$Res>
    implements $OrganizedCollectionCopyWith<$Res> {
  factory _$$_OrganizedCollectionCopyWith(_$_OrganizedCollection value,
          $Res Function(_$_OrganizedCollection) then) =
      __$$_OrganizedCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      bool collectionLive,
      bool isDefault,
      List<OrganizedListing> listings});
}

/// @nodoc
class __$$_OrganizedCollectionCopyWithImpl<$Res>
    extends _$OrganizedCollectionCopyWithImpl<$Res, _$_OrganizedCollection>
    implements _$$_OrganizedCollectionCopyWith<$Res> {
  __$$_OrganizedCollectionCopyWithImpl(_$_OrganizedCollection _value,
      $Res Function(_$_OrganizedCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? collectionLive = null,
    Object? isDefault = null,
    Object? listings = null,
  }) {
    return _then(_$_OrganizedCollection(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      collectionLive: null == collectionLive
          ? _value.collectionLive
          : collectionLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      listings: null == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<OrganizedListing>,
    ));
  }
}

/// @nodoc

class _$_OrganizedCollection extends _OrganizedCollection {
  _$_OrganizedCollection(
      {required this.id,
      required this.name,
      required this.description,
      required this.collectionLive,
      required this.isDefault,
      final List<OrganizedListing> listings = const []})
      : _listings = listings,
        super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final bool collectionLive;
  @override
  final bool isDefault;
  final List<OrganizedListing> _listings;
  @override
  @JsonKey()
  List<OrganizedListing> get listings {
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listings);
  }

  @override
  String toString() {
    return 'OrganizedCollection(id: $id, name: $name, description: $description, collectionLive: $collectionLive, isDefault: $isDefault, listings: $listings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizedCollection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.collectionLive, collectionLive) ||
                other.collectionLive == collectionLive) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            const DeepCollectionEquality().equals(other._listings, _listings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      collectionLive,
      isDefault,
      const DeepCollectionEquality().hash(_listings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizedCollectionCopyWith<_$_OrganizedCollection> get copyWith =>
      __$$_OrganizedCollectionCopyWithImpl<_$_OrganizedCollection>(
          this, _$identity);
}

abstract class _OrganizedCollection extends OrganizedCollection {
  factory _OrganizedCollection(
      {required final int id,
      required final String name,
      required final String description,
      required final bool collectionLive,
      required final bool isDefault,
      final List<OrganizedListing> listings}) = _$_OrganizedCollection;
  _OrganizedCollection._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  bool get collectionLive;
  @override
  bool get isDefault;
  @override
  List<OrganizedListing> get listings;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizedCollectionCopyWith<_$_OrganizedCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrganizedListing {
  int get id => throw _privateConstructorUsedError;
  String get smartContractUid => throw _privateConstructorUsedError;
  String get addressOwner => throw _privateConstructorUsedError;
  double? get buyNowPrice => throw _privateConstructorUsedError;
  bool get isBuyNowOnly => throw _privateConstructorUsedError;
  bool get isRoyaltyEnforced => throw _privateConstructorUsedError;
  bool get isCancelled => throw _privateConstructorUsedError;
  bool get requireBalanceCheck => throw _privateConstructorUsedError;
  double? get floorPrice => throw _privateConstructorUsedError;
  double? get reservePrice => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  bool get isVisibleBeforeStartDate => throw _privateConstructorUsedError;
  bool get isVisibleAfterEndDate => throw _privateConstructorUsedError;
  double? get finalPrice => throw _privateConstructorUsedError;
  String? get winningAddress => throw _privateConstructorUsedError;
  Nft? get nft => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrganizedListingCopyWith<OrganizedListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizedListingCopyWith<$Res> {
  factory $OrganizedListingCopyWith(
          OrganizedListing value, $Res Function(OrganizedListing) then) =
      _$OrganizedListingCopyWithImpl<$Res, OrganizedListing>;
  @useResult
  $Res call(
      {int id,
      String smartContractUid,
      String addressOwner,
      double? buyNowPrice,
      bool isBuyNowOnly,
      bool isRoyaltyEnforced,
      bool isCancelled,
      bool requireBalanceCheck,
      double? floorPrice,
      double? reservePrice,
      DateTime startDate,
      DateTime endDate,
      bool isVisibleBeforeStartDate,
      bool isVisibleAfterEndDate,
      double? finalPrice,
      String? winningAddress,
      Nft? nft});

  $NftCopyWith<$Res>? get nft;
}

/// @nodoc
class _$OrganizedListingCopyWithImpl<$Res, $Val extends OrganizedListing>
    implements $OrganizedListingCopyWith<$Res> {
  _$OrganizedListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? smartContractUid = null,
    Object? addressOwner = null,
    Object? buyNowPrice = freezed,
    Object? isBuyNowOnly = null,
    Object? isRoyaltyEnforced = null,
    Object? isCancelled = null,
    Object? requireBalanceCheck = null,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? finalPrice = freezed,
    Object? winningAddress = freezed,
    Object? nft = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      addressOwner: null == addressOwner
          ? _value.addressOwner
          : addressOwner // ignore: cast_nullable_to_non_nullable
              as String,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isBuyNowOnly: null == isBuyNowOnly
          ? _value.isBuyNowOnly
          : isBuyNowOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isRoyaltyEnforced: null == isRoyaltyEnforced
          ? _value.isRoyaltyEnforced
          : isRoyaltyEnforced // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      requireBalanceCheck: null == requireBalanceCheck
          ? _value.requireBalanceCheck
          : requireBalanceCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reservePrice: freezed == reservePrice
          ? _value.reservePrice
          : reservePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVisibleBeforeStartDate: null == isVisibleBeforeStartDate
          ? _value.isVisibleBeforeStartDate
          : isVisibleBeforeStartDate // ignore: cast_nullable_to_non_nullable
              as bool,
      isVisibleAfterEndDate: null == isVisibleAfterEndDate
          ? _value.isVisibleAfterEndDate
          : isVisibleAfterEndDate // ignore: cast_nullable_to_non_nullable
              as bool,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      winningAddress: freezed == winningAddress
          ? _value.winningAddress
          : winningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NftCopyWith<$Res>? get nft {
    if (_value.nft == null) {
      return null;
    }

    return $NftCopyWith<$Res>(_value.nft!, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrganizedListingCopyWith<$Res>
    implements $OrganizedListingCopyWith<$Res> {
  factory _$$_OrganizedListingCopyWith(
          _$_OrganizedListing value, $Res Function(_$_OrganizedListing) then) =
      __$$_OrganizedListingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String smartContractUid,
      String addressOwner,
      double? buyNowPrice,
      bool isBuyNowOnly,
      bool isRoyaltyEnforced,
      bool isCancelled,
      bool requireBalanceCheck,
      double? floorPrice,
      double? reservePrice,
      DateTime startDate,
      DateTime endDate,
      bool isVisibleBeforeStartDate,
      bool isVisibleAfterEndDate,
      double? finalPrice,
      String? winningAddress,
      Nft? nft});

  @override
  $NftCopyWith<$Res>? get nft;
}

/// @nodoc
class __$$_OrganizedListingCopyWithImpl<$Res>
    extends _$OrganizedListingCopyWithImpl<$Res, _$_OrganizedListing>
    implements _$$_OrganizedListingCopyWith<$Res> {
  __$$_OrganizedListingCopyWithImpl(
      _$_OrganizedListing _value, $Res Function(_$_OrganizedListing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? smartContractUid = null,
    Object? addressOwner = null,
    Object? buyNowPrice = freezed,
    Object? isBuyNowOnly = null,
    Object? isRoyaltyEnforced = null,
    Object? isCancelled = null,
    Object? requireBalanceCheck = null,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? finalPrice = freezed,
    Object? winningAddress = freezed,
    Object? nft = freezed,
  }) {
    return _then(_$_OrganizedListing(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      addressOwner: null == addressOwner
          ? _value.addressOwner
          : addressOwner // ignore: cast_nullable_to_non_nullable
              as String,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isBuyNowOnly: null == isBuyNowOnly
          ? _value.isBuyNowOnly
          : isBuyNowOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isRoyaltyEnforced: null == isRoyaltyEnforced
          ? _value.isRoyaltyEnforced
          : isRoyaltyEnforced // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      requireBalanceCheck: null == requireBalanceCheck
          ? _value.requireBalanceCheck
          : requireBalanceCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reservePrice: freezed == reservePrice
          ? _value.reservePrice
          : reservePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVisibleBeforeStartDate: null == isVisibleBeforeStartDate
          ? _value.isVisibleBeforeStartDate
          : isVisibleBeforeStartDate // ignore: cast_nullable_to_non_nullable
              as bool,
      isVisibleAfterEndDate: null == isVisibleAfterEndDate
          ? _value.isVisibleAfterEndDate
          : isVisibleAfterEndDate // ignore: cast_nullable_to_non_nullable
              as bool,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      winningAddress: freezed == winningAddress
          ? _value.winningAddress
          : winningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft?,
    ));
  }
}

/// @nodoc

class _$_OrganizedListing extends _OrganizedListing {
  _$_OrganizedListing(
      {required this.id,
      required this.smartContractUid,
      required this.addressOwner,
      this.buyNowPrice,
      required this.isBuyNowOnly,
      required this.isRoyaltyEnforced,
      required this.isCancelled,
      required this.requireBalanceCheck,
      this.floorPrice,
      this.reservePrice,
      required this.startDate,
      required this.endDate,
      required this.isVisibleBeforeStartDate,
      required this.isVisibleAfterEndDate,
      this.finalPrice,
      this.winningAddress,
      this.nft})
      : super._();

  @override
  final int id;
  @override
  final String smartContractUid;
  @override
  final String addressOwner;
  @override
  final double? buyNowPrice;
  @override
  final bool isBuyNowOnly;
  @override
  final bool isRoyaltyEnforced;
  @override
  final bool isCancelled;
  @override
  final bool requireBalanceCheck;
  @override
  final double? floorPrice;
  @override
  final double? reservePrice;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final bool isVisibleBeforeStartDate;
  @override
  final bool isVisibleAfterEndDate;
  @override
  final double? finalPrice;
  @override
  final String? winningAddress;
  @override
  final Nft? nft;

  @override
  String toString() {
    return 'OrganizedListing(id: $id, smartContractUid: $smartContractUid, addressOwner: $addressOwner, buyNowPrice: $buyNowPrice, isBuyNowOnly: $isBuyNowOnly, isRoyaltyEnforced: $isRoyaltyEnforced, isCancelled: $isCancelled, requireBalanceCheck: $requireBalanceCheck, floorPrice: $floorPrice, reservePrice: $reservePrice, startDate: $startDate, endDate: $endDate, isVisibleBeforeStartDate: $isVisibleBeforeStartDate, isVisibleAfterEndDate: $isVisibleAfterEndDate, finalPrice: $finalPrice, winningAddress: $winningAddress, nft: $nft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizedListing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.addressOwner, addressOwner) ||
                other.addressOwner == addressOwner) &&
            (identical(other.buyNowPrice, buyNowPrice) ||
                other.buyNowPrice == buyNowPrice) &&
            (identical(other.isBuyNowOnly, isBuyNowOnly) ||
                other.isBuyNowOnly == isBuyNowOnly) &&
            (identical(other.isRoyaltyEnforced, isRoyaltyEnforced) ||
                other.isRoyaltyEnforced == isRoyaltyEnforced) &&
            (identical(other.isCancelled, isCancelled) ||
                other.isCancelled == isCancelled) &&
            (identical(other.requireBalanceCheck, requireBalanceCheck) ||
                other.requireBalanceCheck == requireBalanceCheck) &&
            (identical(other.floorPrice, floorPrice) ||
                other.floorPrice == floorPrice) &&
            (identical(other.reservePrice, reservePrice) ||
                other.reservePrice == reservePrice) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(
                    other.isVisibleBeforeStartDate, isVisibleBeforeStartDate) ||
                other.isVisibleBeforeStartDate == isVisibleBeforeStartDate) &&
            (identical(other.isVisibleAfterEndDate, isVisibleAfterEndDate) ||
                other.isVisibleAfterEndDate == isVisibleAfterEndDate) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.winningAddress, winningAddress) ||
                other.winningAddress == winningAddress) &&
            (identical(other.nft, nft) || other.nft == nft));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      smartContractUid,
      addressOwner,
      buyNowPrice,
      isBuyNowOnly,
      isRoyaltyEnforced,
      isCancelled,
      requireBalanceCheck,
      floorPrice,
      reservePrice,
      startDate,
      endDate,
      isVisibleBeforeStartDate,
      isVisibleAfterEndDate,
      finalPrice,
      winningAddress,
      nft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizedListingCopyWith<_$_OrganizedListing> get copyWith =>
      __$$_OrganizedListingCopyWithImpl<_$_OrganizedListing>(this, _$identity);
}

abstract class _OrganizedListing extends OrganizedListing {
  factory _OrganizedListing(
      {required final int id,
      required final String smartContractUid,
      required final String addressOwner,
      final double? buyNowPrice,
      required final bool isBuyNowOnly,
      required final bool isRoyaltyEnforced,
      required final bool isCancelled,
      required final bool requireBalanceCheck,
      final double? floorPrice,
      final double? reservePrice,
      required final DateTime startDate,
      required final DateTime endDate,
      required final bool isVisibleBeforeStartDate,
      required final bool isVisibleAfterEndDate,
      final double? finalPrice,
      final String? winningAddress,
      final Nft? nft}) = _$_OrganizedListing;
  _OrganizedListing._() : super._();

  @override
  int get id;
  @override
  String get smartContractUid;
  @override
  String get addressOwner;
  @override
  double? get buyNowPrice;
  @override
  bool get isBuyNowOnly;
  @override
  bool get isRoyaltyEnforced;
  @override
  bool get isCancelled;
  @override
  bool get requireBalanceCheck;
  @override
  double? get floorPrice;
  @override
  double? get reservePrice;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  bool get isVisibleBeforeStartDate;
  @override
  bool get isVisibleAfterEndDate;
  @override
  double? get finalPrice;
  @override
  String? get winningAddress;
  @override
  Nft? get nft;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizedListingCopyWith<_$_OrganizedListing> get copyWith =>
      throw _privateConstructorUsedError;
}

ShopData _$ShopDataFromJson(Map<String, dynamic> json) {
  return _ShopData.fromJson(json);
}

/// @nodoc
mixin _$ShopData {
  @JsonKey(name: "DecShop")
  DecShop get decShop => throw _privateConstructorUsedError;
  @JsonKey(name: "Collections")
  List<CollectionData> get collections => throw _privateConstructorUsedError;
  @JsonKey(name: "Listings")
  List<ListingData> get listings => throw _privateConstructorUsedError;
  @JsonKey(name: "Auctions")
  dynamic get auctions => throw _privateConstructorUsedError;
  @JsonKey(name: "Bids")
  dynamic get bids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopDataCopyWith<ShopData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDataCopyWith<$Res> {
  factory $ShopDataCopyWith(ShopData value, $Res Function(ShopData) then) =
      _$ShopDataCopyWithImpl<$Res, ShopData>;
  @useResult
  $Res call(
      {@JsonKey(name: "DecShop") DecShop decShop,
      @JsonKey(name: "Collections") List<CollectionData> collections,
      @JsonKey(name: "Listings") List<ListingData> listings,
      @JsonKey(name: "Auctions") dynamic auctions,
      @JsonKey(name: "Bids") dynamic bids});

  $DecShopCopyWith<$Res> get decShop;
}

/// @nodoc
class _$ShopDataCopyWithImpl<$Res, $Val extends ShopData>
    implements $ShopDataCopyWith<$Res> {
  _$ShopDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decShop = null,
    Object? collections = null,
    Object? listings = null,
    Object? auctions = freezed,
    Object? bids = freezed,
  }) {
    return _then(_value.copyWith(
      decShop: null == decShop
          ? _value.decShop
          : decShop // ignore: cast_nullable_to_non_nullable
              as DecShop,
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionData>,
      listings: null == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<ListingData>,
      auctions: freezed == auctions
          ? _value.auctions
          : auctions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bids: freezed == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DecShopCopyWith<$Res> get decShop {
    return $DecShopCopyWith<$Res>(_value.decShop, (value) {
      return _then(_value.copyWith(decShop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ShopDataCopyWith<$Res> implements $ShopDataCopyWith<$Res> {
  factory _$$_ShopDataCopyWith(
          _$_ShopData value, $Res Function(_$_ShopData) then) =
      __$$_ShopDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "DecShop") DecShop decShop,
      @JsonKey(name: "Collections") List<CollectionData> collections,
      @JsonKey(name: "Listings") List<ListingData> listings,
      @JsonKey(name: "Auctions") dynamic auctions,
      @JsonKey(name: "Bids") dynamic bids});

  @override
  $DecShopCopyWith<$Res> get decShop;
}

/// @nodoc
class __$$_ShopDataCopyWithImpl<$Res>
    extends _$ShopDataCopyWithImpl<$Res, _$_ShopData>
    implements _$$_ShopDataCopyWith<$Res> {
  __$$_ShopDataCopyWithImpl(
      _$_ShopData _value, $Res Function(_$_ShopData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decShop = null,
    Object? collections = null,
    Object? listings = null,
    Object? auctions = freezed,
    Object? bids = freezed,
  }) {
    return _then(_$_ShopData(
      decShop: null == decShop
          ? _value.decShop
          : decShop // ignore: cast_nullable_to_non_nullable
              as DecShop,
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionData>,
      listings: null == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<ListingData>,
      auctions: freezed == auctions
          ? _value.auctions
          : auctions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bids: freezed == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopData extends _ShopData {
  _$_ShopData(
      {@JsonKey(name: "DecShop")
          required this.decShop,
      @JsonKey(name: "Collections")
          final List<CollectionData> collections = const [],
      @JsonKey(name: "Listings")
          final List<ListingData> listings = const [],
      @JsonKey(name: "Auctions")
          this.auctions,
      @JsonKey(name: "Bids")
          this.bids})
      : _collections = collections,
        _listings = listings,
        super._();

  factory _$_ShopData.fromJson(Map<String, dynamic> json) =>
      _$$_ShopDataFromJson(json);

  @override
  @JsonKey(name: "DecShop")
  final DecShop decShop;
  final List<CollectionData> _collections;
  @override
  @JsonKey(name: "Collections")
  List<CollectionData> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  final List<ListingData> _listings;
  @override
  @JsonKey(name: "Listings")
  List<ListingData> get listings {
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listings);
  }

  @override
  @JsonKey(name: "Auctions")
  final dynamic auctions;
  @override
  @JsonKey(name: "Bids")
  final dynamic bids;

  @override
  String toString() {
    return 'ShopData(decShop: $decShop, collections: $collections, listings: $listings, auctions: $auctions, bids: $bids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopData &&
            (identical(other.decShop, decShop) || other.decShop == decShop) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            const DeepCollectionEquality().equals(other._listings, _listings) &&
            const DeepCollectionEquality().equals(other.auctions, auctions) &&
            const DeepCollectionEquality().equals(other.bids, bids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      decShop,
      const DeepCollectionEquality().hash(_collections),
      const DeepCollectionEquality().hash(_listings),
      const DeepCollectionEquality().hash(auctions),
      const DeepCollectionEquality().hash(bids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopDataCopyWith<_$_ShopData> get copyWith =>
      __$$_ShopDataCopyWithImpl<_$_ShopData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopDataToJson(
      this,
    );
  }
}

abstract class _ShopData extends ShopData {
  factory _ShopData(
      {@JsonKey(name: "DecShop") required final DecShop decShop,
      @JsonKey(name: "Collections") final List<CollectionData> collections,
      @JsonKey(name: "Listings") final List<ListingData> listings,
      @JsonKey(name: "Auctions") final dynamic auctions,
      @JsonKey(name: "Bids") final dynamic bids}) = _$_ShopData;
  _ShopData._() : super._();

  factory _ShopData.fromJson(Map<String, dynamic> json) = _$_ShopData.fromJson;

  @override
  @JsonKey(name: "DecShop")
  DecShop get decShop;
  @override
  @JsonKey(name: "Collections")
  List<CollectionData> get collections;
  @override
  @JsonKey(name: "Listings")
  List<ListingData> get listings;
  @override
  @JsonKey(name: "Auctions")
  dynamic get auctions;
  @override
  @JsonKey(name: "Bids")
  dynamic get bids;
  @override
  @JsonKey(ignore: true)
  _$$_ShopDataCopyWith<_$_ShopData> get copyWith =>
      throw _privateConstructorUsedError;
}

CollectionData _$CollectionDataFromJson(Map<String, dynamic> json) {
  return _CollectionData.fromJson(json);
}

/// @nodoc
mixin _$CollectionData {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "CollectionLive")
  bool get collectionLive => throw _privateConstructorUsedError;
  @JsonKey(name: "IsDefault")
  bool get isDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionDataCopyWith<CollectionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionDataCopyWith<$Res> {
  factory $CollectionDataCopyWith(
          CollectionData value, $Res Function(CollectionData) then) =
      _$CollectionDataCopyWithImpl<$Res, CollectionData>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "CollectionLive") bool collectionLive,
      @JsonKey(name: "IsDefault") bool isDefault});
}

/// @nodoc
class _$CollectionDataCopyWithImpl<$Res, $Val extends CollectionData>
    implements $CollectionDataCopyWith<$Res> {
  _$CollectionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? collectionLive = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      collectionLive: null == collectionLive
          ? _value.collectionLive
          : collectionLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CollectionDataCopyWith<$Res>
    implements $CollectionDataCopyWith<$Res> {
  factory _$$_CollectionDataCopyWith(
          _$_CollectionData value, $Res Function(_$_CollectionData) then) =
      __$$_CollectionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "CollectionLive") bool collectionLive,
      @JsonKey(name: "IsDefault") bool isDefault});
}

/// @nodoc
class __$$_CollectionDataCopyWithImpl<$Res>
    extends _$CollectionDataCopyWithImpl<$Res, _$_CollectionData>
    implements _$$_CollectionDataCopyWith<$Res> {
  __$$_CollectionDataCopyWithImpl(
      _$_CollectionData _value, $Res Function(_$_CollectionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? collectionLive = null,
    Object? isDefault = null,
  }) {
    return _then(_$_CollectionData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      collectionLive: null == collectionLive
          ? _value.collectionLive
          : collectionLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CollectionData extends _CollectionData {
  _$_CollectionData(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "Name") required this.name,
      @JsonKey(name: "Description") required this.description,
      @JsonKey(name: "CollectionLive") required this.collectionLive,
      @JsonKey(name: "IsDefault") required this.isDefault})
      : super._();

  factory _$_CollectionData.fromJson(Map<String, dynamic> json) =>
      _$$_CollectionDataFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "CollectionLive")
  final bool collectionLive;
  @override
  @JsonKey(name: "IsDefault")
  final bool isDefault;

  @override
  String toString() {
    return 'CollectionData(id: $id, name: $name, description: $description, collectionLive: $collectionLive, isDefault: $isDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollectionData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.collectionLive, collectionLive) ||
                other.collectionLive == collectionLive) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, collectionLive, isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollectionDataCopyWith<_$_CollectionData> get copyWith =>
      __$$_CollectionDataCopyWithImpl<_$_CollectionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectionDataToJson(
      this,
    );
  }
}

abstract class _CollectionData extends CollectionData {
  factory _CollectionData(
          {@JsonKey(name: "Id") required final int id,
          @JsonKey(name: "Name") required final String name,
          @JsonKey(name: "Description") required final String description,
          @JsonKey(name: "CollectionLive") required final bool collectionLive,
          @JsonKey(name: "IsDefault") required final bool isDefault}) =
      _$_CollectionData;
  _CollectionData._() : super._();

  factory _CollectionData.fromJson(Map<String, dynamic> json) =
      _$_CollectionData.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "CollectionLive")
  bool get collectionLive;
  @override
  @JsonKey(name: "IsDefault")
  bool get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$_CollectionDataCopyWith<_$_CollectionData> get copyWith =>
      throw _privateConstructorUsedError;
}

ListingData _$ListingDataFromJson(Map<String, dynamic> json) {
  return _ListingData.fromJson(json);
}

/// @nodoc
mixin _$ListingData {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "CollectionId")
  int get collectionId => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "AddressOwner")
  String get addressOwner => throw _privateConstructorUsedError;
  @JsonKey(name: "BuyNowPrice")
  double? get buyNowPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "IsBuyNowOnly")
  bool get isBuyNowOnly => throw _privateConstructorUsedError;
  @JsonKey(name: "IsRoyaltyEnforced")
  bool get isRoyaltyEnforced => throw _privateConstructorUsedError;
  @JsonKey(name: "IsCancelled")
  bool get isCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: "RequireBalanceCheck")
  bool get requireBalanceCheck => throw _privateConstructorUsedError;
  @JsonKey(name: "FloorPrice")
  double? get floorPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "ReservePrice")
  double? get reservePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "StartDate")
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "EndDate")
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "IsVisibleBeforeStartDate")
  bool get isVisibleBeforeStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: "IsVisibleAfterEndDate")
  bool get isVisibleAfterEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: "FinalPrice")
  double? get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "WinningAddress")
  String? get winningAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingDataCopyWith<ListingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingDataCopyWith<$Res> {
  factory $ListingDataCopyWith(
          ListingData value, $Res Function(ListingData) then) =
      _$ListingDataCopyWithImpl<$Res, ListingData>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "CollectionId") int collectionId,
      @JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "AddressOwner") String addressOwner,
      @JsonKey(name: "BuyNowPrice") double? buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly") bool isBuyNowOnly,
      @JsonKey(name: "IsRoyaltyEnforced") bool isRoyaltyEnforced,
      @JsonKey(name: "IsCancelled") bool isCancelled,
      @JsonKey(name: "RequireBalanceCheck") bool requireBalanceCheck,
      @JsonKey(name: "FloorPrice") double? floorPrice,
      @JsonKey(name: "ReservePrice") double? reservePrice,
      @JsonKey(name: "StartDate") DateTime startDate,
      @JsonKey(name: "EndDate") DateTime endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate") bool isVisibleBeforeStartDate,
      @JsonKey(name: "IsVisibleAfterEndDate") bool isVisibleAfterEndDate,
      @JsonKey(name: "FinalPrice") double? finalPrice,
      @JsonKey(name: "WinningAddress") String? winningAddress});
}

/// @nodoc
class _$ListingDataCopyWithImpl<$Res, $Val extends ListingData>
    implements $ListingDataCopyWith<$Res> {
  _$ListingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectionId = null,
    Object? smartContractUid = null,
    Object? addressOwner = null,
    Object? buyNowPrice = freezed,
    Object? isBuyNowOnly = null,
    Object? isRoyaltyEnforced = null,
    Object? isCancelled = null,
    Object? requireBalanceCheck = null,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? finalPrice = freezed,
    Object? winningAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      addressOwner: null == addressOwner
          ? _value.addressOwner
          : addressOwner // ignore: cast_nullable_to_non_nullable
              as String,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isBuyNowOnly: null == isBuyNowOnly
          ? _value.isBuyNowOnly
          : isBuyNowOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isRoyaltyEnforced: null == isRoyaltyEnforced
          ? _value.isRoyaltyEnforced
          : isRoyaltyEnforced // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      requireBalanceCheck: null == requireBalanceCheck
          ? _value.requireBalanceCheck
          : requireBalanceCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reservePrice: freezed == reservePrice
          ? _value.reservePrice
          : reservePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVisibleBeforeStartDate: null == isVisibleBeforeStartDate
          ? _value.isVisibleBeforeStartDate
          : isVisibleBeforeStartDate // ignore: cast_nullable_to_non_nullable
              as bool,
      isVisibleAfterEndDate: null == isVisibleAfterEndDate
          ? _value.isVisibleAfterEndDate
          : isVisibleAfterEndDate // ignore: cast_nullable_to_non_nullable
              as bool,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      winningAddress: freezed == winningAddress
          ? _value.winningAddress
          : winningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListingDataCopyWith<$Res>
    implements $ListingDataCopyWith<$Res> {
  factory _$$_ListingDataCopyWith(
          _$_ListingData value, $Res Function(_$_ListingData) then) =
      __$$_ListingDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "CollectionId") int collectionId,
      @JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "AddressOwner") String addressOwner,
      @JsonKey(name: "BuyNowPrice") double? buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly") bool isBuyNowOnly,
      @JsonKey(name: "IsRoyaltyEnforced") bool isRoyaltyEnforced,
      @JsonKey(name: "IsCancelled") bool isCancelled,
      @JsonKey(name: "RequireBalanceCheck") bool requireBalanceCheck,
      @JsonKey(name: "FloorPrice") double? floorPrice,
      @JsonKey(name: "ReservePrice") double? reservePrice,
      @JsonKey(name: "StartDate") DateTime startDate,
      @JsonKey(name: "EndDate") DateTime endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate") bool isVisibleBeforeStartDate,
      @JsonKey(name: "IsVisibleAfterEndDate") bool isVisibleAfterEndDate,
      @JsonKey(name: "FinalPrice") double? finalPrice,
      @JsonKey(name: "WinningAddress") String? winningAddress});
}

/// @nodoc
class __$$_ListingDataCopyWithImpl<$Res>
    extends _$ListingDataCopyWithImpl<$Res, _$_ListingData>
    implements _$$_ListingDataCopyWith<$Res> {
  __$$_ListingDataCopyWithImpl(
      _$_ListingData _value, $Res Function(_$_ListingData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectionId = null,
    Object? smartContractUid = null,
    Object? addressOwner = null,
    Object? buyNowPrice = freezed,
    Object? isBuyNowOnly = null,
    Object? isRoyaltyEnforced = null,
    Object? isCancelled = null,
    Object? requireBalanceCheck = null,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? finalPrice = freezed,
    Object? winningAddress = freezed,
  }) {
    return _then(_$_ListingData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      addressOwner: null == addressOwner
          ? _value.addressOwner
          : addressOwner // ignore: cast_nullable_to_non_nullable
              as String,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isBuyNowOnly: null == isBuyNowOnly
          ? _value.isBuyNowOnly
          : isBuyNowOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isRoyaltyEnforced: null == isRoyaltyEnforced
          ? _value.isRoyaltyEnforced
          : isRoyaltyEnforced // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      requireBalanceCheck: null == requireBalanceCheck
          ? _value.requireBalanceCheck
          : requireBalanceCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reservePrice: freezed == reservePrice
          ? _value.reservePrice
          : reservePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVisibleBeforeStartDate: null == isVisibleBeforeStartDate
          ? _value.isVisibleBeforeStartDate
          : isVisibleBeforeStartDate // ignore: cast_nullable_to_non_nullable
              as bool,
      isVisibleAfterEndDate: null == isVisibleAfterEndDate
          ? _value.isVisibleAfterEndDate
          : isVisibleAfterEndDate // ignore: cast_nullable_to_non_nullable
              as bool,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      winningAddress: freezed == winningAddress
          ? _value.winningAddress
          : winningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListingData extends _ListingData {
  _$_ListingData(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "CollectionId")
          required this.collectionId,
      @JsonKey(name: "SmartContractUID")
          required this.smartContractUid,
      @JsonKey(name: "AddressOwner")
          required this.addressOwner,
      @JsonKey(name: "BuyNowPrice")
          this.buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly")
          required this.isBuyNowOnly,
      @JsonKey(name: "IsRoyaltyEnforced")
          required this.isRoyaltyEnforced,
      @JsonKey(name: "IsCancelled")
          required this.isCancelled,
      @JsonKey(name: "RequireBalanceCheck")
          required this.requireBalanceCheck,
      @JsonKey(name: "FloorPrice")
          this.floorPrice,
      @JsonKey(name: "ReservePrice")
          this.reservePrice,
      @JsonKey(name: "StartDate")
          required this.startDate,
      @JsonKey(name: "EndDate")
          required this.endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate")
          required this.isVisibleBeforeStartDate,
      @JsonKey(name: "IsVisibleAfterEndDate")
          required this.isVisibleAfterEndDate,
      @JsonKey(name: "FinalPrice")
          this.finalPrice,
      @JsonKey(name: "WinningAddress")
          this.winningAddress})
      : super._();

  factory _$_ListingData.fromJson(Map<String, dynamic> json) =>
      _$$_ListingDataFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "CollectionId")
  final int collectionId;
  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractUid;
  @override
  @JsonKey(name: "AddressOwner")
  final String addressOwner;
  @override
  @JsonKey(name: "BuyNowPrice")
  final double? buyNowPrice;
  @override
  @JsonKey(name: "IsBuyNowOnly")
  final bool isBuyNowOnly;
  @override
  @JsonKey(name: "IsRoyaltyEnforced")
  final bool isRoyaltyEnforced;
  @override
  @JsonKey(name: "IsCancelled")
  final bool isCancelled;
  @override
  @JsonKey(name: "RequireBalanceCheck")
  final bool requireBalanceCheck;
  @override
  @JsonKey(name: "FloorPrice")
  final double? floorPrice;
  @override
  @JsonKey(name: "ReservePrice")
  final double? reservePrice;
  @override
  @JsonKey(name: "StartDate")
  final DateTime startDate;
  @override
  @JsonKey(name: "EndDate")
  final DateTime endDate;
  @override
  @JsonKey(name: "IsVisibleBeforeStartDate")
  final bool isVisibleBeforeStartDate;
  @override
  @JsonKey(name: "IsVisibleAfterEndDate")
  final bool isVisibleAfterEndDate;
  @override
  @JsonKey(name: "FinalPrice")
  final double? finalPrice;
  @override
  @JsonKey(name: "WinningAddress")
  final String? winningAddress;

  @override
  String toString() {
    return 'ListingData(id: $id, collectionId: $collectionId, smartContractUid: $smartContractUid, addressOwner: $addressOwner, buyNowPrice: $buyNowPrice, isBuyNowOnly: $isBuyNowOnly, isRoyaltyEnforced: $isRoyaltyEnforced, isCancelled: $isCancelled, requireBalanceCheck: $requireBalanceCheck, floorPrice: $floorPrice, reservePrice: $reservePrice, startDate: $startDate, endDate: $endDate, isVisibleBeforeStartDate: $isVisibleBeforeStartDate, isVisibleAfterEndDate: $isVisibleAfterEndDate, finalPrice: $finalPrice, winningAddress: $winningAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListingData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.addressOwner, addressOwner) ||
                other.addressOwner == addressOwner) &&
            (identical(other.buyNowPrice, buyNowPrice) ||
                other.buyNowPrice == buyNowPrice) &&
            (identical(other.isBuyNowOnly, isBuyNowOnly) ||
                other.isBuyNowOnly == isBuyNowOnly) &&
            (identical(other.isRoyaltyEnforced, isRoyaltyEnforced) ||
                other.isRoyaltyEnforced == isRoyaltyEnforced) &&
            (identical(other.isCancelled, isCancelled) ||
                other.isCancelled == isCancelled) &&
            (identical(other.requireBalanceCheck, requireBalanceCheck) ||
                other.requireBalanceCheck == requireBalanceCheck) &&
            (identical(other.floorPrice, floorPrice) ||
                other.floorPrice == floorPrice) &&
            (identical(other.reservePrice, reservePrice) ||
                other.reservePrice == reservePrice) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(
                    other.isVisibleBeforeStartDate, isVisibleBeforeStartDate) ||
                other.isVisibleBeforeStartDate == isVisibleBeforeStartDate) &&
            (identical(other.isVisibleAfterEndDate, isVisibleAfterEndDate) ||
                other.isVisibleAfterEndDate == isVisibleAfterEndDate) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.winningAddress, winningAddress) ||
                other.winningAddress == winningAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      collectionId,
      smartContractUid,
      addressOwner,
      buyNowPrice,
      isBuyNowOnly,
      isRoyaltyEnforced,
      isCancelled,
      requireBalanceCheck,
      floorPrice,
      reservePrice,
      startDate,
      endDate,
      isVisibleBeforeStartDate,
      isVisibleAfterEndDate,
      finalPrice,
      winningAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListingDataCopyWith<_$_ListingData> get copyWith =>
      __$$_ListingDataCopyWithImpl<_$_ListingData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListingDataToJson(
      this,
    );
  }
}

abstract class _ListingData extends ListingData {
  factory _ListingData(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "CollectionId")
          required final int collectionId,
      @JsonKey(name: "SmartContractUID")
          required final String smartContractUid,
      @JsonKey(name: "AddressOwner")
          required final String addressOwner,
      @JsonKey(name: "BuyNowPrice")
          final double? buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly")
          required final bool isBuyNowOnly,
      @JsonKey(name: "IsRoyaltyEnforced")
          required final bool isRoyaltyEnforced,
      @JsonKey(name: "IsCancelled")
          required final bool isCancelled,
      @JsonKey(name: "RequireBalanceCheck")
          required final bool requireBalanceCheck,
      @JsonKey(name: "FloorPrice")
          final double? floorPrice,
      @JsonKey(name: "ReservePrice")
          final double? reservePrice,
      @JsonKey(name: "StartDate")
          required final DateTime startDate,
      @JsonKey(name: "EndDate")
          required final DateTime endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate")
          required final bool isVisibleBeforeStartDate,
      @JsonKey(name: "IsVisibleAfterEndDate")
          required final bool isVisibleAfterEndDate,
      @JsonKey(name: "FinalPrice")
          final double? finalPrice,
      @JsonKey(name: "WinningAddress")
          final String? winningAddress}) = _$_ListingData;
  _ListingData._() : super._();

  factory _ListingData.fromJson(Map<String, dynamic> json) =
      _$_ListingData.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "CollectionId")
  int get collectionId;
  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid;
  @override
  @JsonKey(name: "AddressOwner")
  String get addressOwner;
  @override
  @JsonKey(name: "BuyNowPrice")
  double? get buyNowPrice;
  @override
  @JsonKey(name: "IsBuyNowOnly")
  bool get isBuyNowOnly;
  @override
  @JsonKey(name: "IsRoyaltyEnforced")
  bool get isRoyaltyEnforced;
  @override
  @JsonKey(name: "IsCancelled")
  bool get isCancelled;
  @override
  @JsonKey(name: "RequireBalanceCheck")
  bool get requireBalanceCheck;
  @override
  @JsonKey(name: "FloorPrice")
  double? get floorPrice;
  @override
  @JsonKey(name: "ReservePrice")
  double? get reservePrice;
  @override
  @JsonKey(name: "StartDate")
  DateTime get startDate;
  @override
  @JsonKey(name: "EndDate")
  DateTime get endDate;
  @override
  @JsonKey(name: "IsVisibleBeforeStartDate")
  bool get isVisibleBeforeStartDate;
  @override
  @JsonKey(name: "IsVisibleAfterEndDate")
  bool get isVisibleAfterEndDate;
  @override
  @JsonKey(name: "FinalPrice")
  double? get finalPrice;
  @override
  @JsonKey(name: "WinningAddress")
  String? get winningAddress;
  @override
  @JsonKey(ignore: true)
  _$$_ListingDataCopyWith<_$_ListingData> get copyWith =>
      throw _privateConstructorUsedError;
}
