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
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "AddressOwner")
  String get ownerAddress => throw _privateConstructorUsedError;
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
  @JsonKey(name: "IsAuctionStarted")
  bool get isAuctionStarted => throw _privateConstructorUsedError;
  @JsonKey(name: "IsAuctionEnded")
  bool get isAuctionEnded => throw _privateConstructorUsedError;
  @JsonKey(name: "IsSaleComplete")
  bool get isSaleComplete => throw _privateConstructorUsedError;
  @JsonKey(name: "FloorPrice")
  double? get floorPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "ReservePrice")
  double? get reservePrice => throw _privateConstructorUsedError;
  @JsonKey(
      name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "IsVisibleBeforeStartDate")
  bool get isVisibleBeforeStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: "IsVisibleAfterEndDate")
  bool get isVisibleAfterEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: "FinalPrice")
  double? get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "WinningAddress")
  String? get winningAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "CollectionId")
  int get collectionId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get enableBuyNow => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get enableAuction => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get enableReservePrice => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get galleryOnly => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Nft? get nft => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "Id")
          int id,
      @JsonKey(name: "SmartContractUID")
          String smartContractUid,
      @JsonKey(name: "AddressOwner")
          String ownerAddress,
      @JsonKey(name: "BuyNowPrice")
          double? buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly")
          bool isBuyNowOnly,
      @JsonKey(name: "IsRoyaltyEnforced")
          bool isRoyaltyEnforced,
      @JsonKey(name: "IsCancelled")
          bool isCancelled,
      @JsonKey(name: "RequireBalanceCheck")
          bool requireBalanceCheck,
      @JsonKey(name: "IsAuctionStarted")
          bool isAuctionStarted,
      @JsonKey(name: "IsAuctionEnded")
          bool isAuctionEnded,
      @JsonKey(name: "IsSaleComplete")
          bool isSaleComplete,
      @JsonKey(name: "FloorPrice")
          double? floorPrice,
      @JsonKey(name: "ReservePrice")
          double? reservePrice,
      @JsonKey(name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
          DateTime startDate,
      @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
          DateTime endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate")
          bool isVisibleBeforeStartDate,
      @JsonKey(name: "IsVisibleAfterEndDate")
          bool isVisibleAfterEndDate,
      @JsonKey(name: "FinalPrice")
          double? finalPrice,
      @JsonKey(name: "WinningAddress")
          String? winningAddress,
      @JsonKey(name: "CollectionId")
          int collectionId,
      @JsonKey(ignore: true)
          bool enableBuyNow,
      @JsonKey(ignore: true)
          bool enableAuction,
      @JsonKey(ignore: true)
          bool enableReservePrice,
      @JsonKey(ignore: true)
          bool galleryOnly,
      @JsonKey(ignore: true)
          Nft? nft});

  $NftCopyWith<$Res>? get nft;
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
    Object? smartContractUid = null,
    Object? ownerAddress = null,
    Object? buyNowPrice = freezed,
    Object? isBuyNowOnly = null,
    Object? isRoyaltyEnforced = null,
    Object? isCancelled = null,
    Object? requireBalanceCheck = null,
    Object? isAuctionStarted = null,
    Object? isAuctionEnded = null,
    Object? isSaleComplete = null,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? finalPrice = freezed,
    Object? winningAddress = freezed,
    Object? collectionId = null,
    Object? enableBuyNow = null,
    Object? enableAuction = null,
    Object? enableReservePrice = null,
    Object? galleryOnly = null,
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
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
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
      isAuctionStarted: null == isAuctionStarted
          ? _value.isAuctionStarted
          : isAuctionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionEnded: null == isAuctionEnded
          ? _value.isAuctionEnded
          : isAuctionEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaleComplete: null == isSaleComplete
          ? _value.isSaleComplete
          : isSaleComplete // ignore: cast_nullable_to_non_nullable
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
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      enableBuyNow: null == enableBuyNow
          ? _value.enableBuyNow
          : enableBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAuction: null == enableAuction
          ? _value.enableAuction
          : enableAuction // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReservePrice: null == enableReservePrice
          ? _value.enableReservePrice
          : enableReservePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      galleryOnly: null == galleryOnly
          ? _value.galleryOnly
          : galleryOnly // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_ListingCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$$_ListingCopyWith(
          _$_Listing value, $Res Function(_$_Listing) then) =
      __$$_ListingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id")
          int id,
      @JsonKey(name: "SmartContractUID")
          String smartContractUid,
      @JsonKey(name: "AddressOwner")
          String ownerAddress,
      @JsonKey(name: "BuyNowPrice")
          double? buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly")
          bool isBuyNowOnly,
      @JsonKey(name: "IsRoyaltyEnforced")
          bool isRoyaltyEnforced,
      @JsonKey(name: "IsCancelled")
          bool isCancelled,
      @JsonKey(name: "RequireBalanceCheck")
          bool requireBalanceCheck,
      @JsonKey(name: "IsAuctionStarted")
          bool isAuctionStarted,
      @JsonKey(name: "IsAuctionEnded")
          bool isAuctionEnded,
      @JsonKey(name: "IsSaleComplete")
          bool isSaleComplete,
      @JsonKey(name: "FloorPrice")
          double? floorPrice,
      @JsonKey(name: "ReservePrice")
          double? reservePrice,
      @JsonKey(name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
          DateTime startDate,
      @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
          DateTime endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate")
          bool isVisibleBeforeStartDate,
      @JsonKey(name: "IsVisibleAfterEndDate")
          bool isVisibleAfterEndDate,
      @JsonKey(name: "FinalPrice")
          double? finalPrice,
      @JsonKey(name: "WinningAddress")
          String? winningAddress,
      @JsonKey(name: "CollectionId")
          int collectionId,
      @JsonKey(ignore: true)
          bool enableBuyNow,
      @JsonKey(ignore: true)
          bool enableAuction,
      @JsonKey(ignore: true)
          bool enableReservePrice,
      @JsonKey(ignore: true)
          bool galleryOnly,
      @JsonKey(ignore: true)
          Nft? nft});

  @override
  $NftCopyWith<$Res>? get nft;
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
    Object? smartContractUid = null,
    Object? ownerAddress = null,
    Object? buyNowPrice = freezed,
    Object? isBuyNowOnly = null,
    Object? isRoyaltyEnforced = null,
    Object? isCancelled = null,
    Object? requireBalanceCheck = null,
    Object? isAuctionStarted = null,
    Object? isAuctionEnded = null,
    Object? isSaleComplete = null,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? finalPrice = freezed,
    Object? winningAddress = freezed,
    Object? collectionId = null,
    Object? enableBuyNow = null,
    Object? enableAuction = null,
    Object? enableReservePrice = null,
    Object? galleryOnly = null,
    Object? nft = freezed,
  }) {
    return _then(_$_Listing(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
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
      isAuctionStarted: null == isAuctionStarted
          ? _value.isAuctionStarted
          : isAuctionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionEnded: null == isAuctionEnded
          ? _value.isAuctionEnded
          : isAuctionEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaleComplete: null == isSaleComplete
          ? _value.isSaleComplete
          : isSaleComplete // ignore: cast_nullable_to_non_nullable
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
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      enableBuyNow: null == enableBuyNow
          ? _value.enableBuyNow
          : enableBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      enableAuction: null == enableAuction
          ? _value.enableAuction
          : enableAuction // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReservePrice: null == enableReservePrice
          ? _value.enableReservePrice
          : enableReservePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      galleryOnly: null == galleryOnly
          ? _value.galleryOnly
          : galleryOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Listing extends _Listing {
  _$_Listing(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "SmartContractUID")
          required this.smartContractUid,
      @JsonKey(name: "AddressOwner")
          required this.ownerAddress,
      @JsonKey(name: "BuyNowPrice")
          this.buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly")
          this.isBuyNowOnly = false,
      @JsonKey(name: "IsRoyaltyEnforced")
          this.isRoyaltyEnforced = false,
      @JsonKey(name: "IsCancelled")
          this.isCancelled = false,
      @JsonKey(name: "RequireBalanceCheck")
          this.requireBalanceCheck = false,
      @JsonKey(name: "IsAuctionStarted")
          this.isAuctionStarted = false,
      @JsonKey(name: "IsAuctionEnded")
          this.isAuctionEnded = false,
      @JsonKey(name: "IsSaleComplete")
          this.isSaleComplete = false,
      @JsonKey(name: "FloorPrice")
          this.floorPrice,
      @JsonKey(name: "ReservePrice")
          this.reservePrice,
      @JsonKey(name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
          required this.startDate,
      @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
          required this.endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate")
          this.isVisibleBeforeStartDate = true,
      @JsonKey(name: "IsVisibleAfterEndDate")
          this.isVisibleAfterEndDate = true,
      @JsonKey(name: "FinalPrice")
          this.finalPrice,
      @JsonKey(name: "WinningAddress")
          this.winningAddress,
      @JsonKey(name: "CollectionId")
          required this.collectionId,
      @JsonKey(ignore: true)
          this.enableBuyNow = false,
      @JsonKey(ignore: true)
          this.enableAuction = false,
      @JsonKey(ignore: true)
          this.enableReservePrice = false,
      @JsonKey(ignore: true)
          this.galleryOnly = false,
      @JsonKey(ignore: true)
          this.nft})
      : super._();

  factory _$_Listing.fromJson(Map<String, dynamic> json) =>
      _$$_ListingFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractUid;
  @override
  @JsonKey(name: "AddressOwner")
  final String ownerAddress;
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
  @JsonKey(name: "IsAuctionStarted")
  final bool isAuctionStarted;
  @override
  @JsonKey(name: "IsAuctionEnded")
  final bool isAuctionEnded;
  @override
  @JsonKey(name: "IsSaleComplete")
  final bool isSaleComplete;
  @override
  @JsonKey(name: "FloorPrice")
  final double? floorPrice;
  @override
  @JsonKey(name: "ReservePrice")
  final double? reservePrice;
  @override
  @JsonKey(
      name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
  final DateTime startDate;
  @override
  @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
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
  @JsonKey(name: "CollectionId")
  final int collectionId;
  @override
  @JsonKey(ignore: true)
  final bool enableBuyNow;
  @override
  @JsonKey(ignore: true)
  final bool enableAuction;
  @override
  @JsonKey(ignore: true)
  final bool enableReservePrice;
  @override
  @JsonKey(ignore: true)
  final bool galleryOnly;
  @override
  @JsonKey(ignore: true)
  final Nft? nft;

  @override
  String toString() {
    return 'Listing(id: $id, smartContractUid: $smartContractUid, ownerAddress: $ownerAddress, buyNowPrice: $buyNowPrice, isBuyNowOnly: $isBuyNowOnly, isRoyaltyEnforced: $isRoyaltyEnforced, isCancelled: $isCancelled, requireBalanceCheck: $requireBalanceCheck, isAuctionStarted: $isAuctionStarted, isAuctionEnded: $isAuctionEnded, isSaleComplete: $isSaleComplete, floorPrice: $floorPrice, reservePrice: $reservePrice, startDate: $startDate, endDate: $endDate, isVisibleBeforeStartDate: $isVisibleBeforeStartDate, isVisibleAfterEndDate: $isVisibleAfterEndDate, finalPrice: $finalPrice, winningAddress: $winningAddress, collectionId: $collectionId, enableBuyNow: $enableBuyNow, enableAuction: $enableAuction, enableReservePrice: $enableReservePrice, galleryOnly: $galleryOnly, nft: $nft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Listing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
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
            (identical(other.isAuctionStarted, isAuctionStarted) ||
                other.isAuctionStarted == isAuctionStarted) &&
            (identical(other.isAuctionEnded, isAuctionEnded) ||
                other.isAuctionEnded == isAuctionEnded) &&
            (identical(other.isSaleComplete, isSaleComplete) ||
                other.isSaleComplete == isSaleComplete) &&
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
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.enableBuyNow, enableBuyNow) ||
                other.enableBuyNow == enableBuyNow) &&
            (identical(other.enableAuction, enableAuction) ||
                other.enableAuction == enableAuction) &&
            (identical(other.enableReservePrice, enableReservePrice) ||
                other.enableReservePrice == enableReservePrice) &&
            (identical(other.galleryOnly, galleryOnly) ||
                other.galleryOnly == galleryOnly) &&
            (identical(other.nft, nft) || other.nft == nft));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        smartContractUid,
        ownerAddress,
        buyNowPrice,
        isBuyNowOnly,
        isRoyaltyEnforced,
        isCancelled,
        requireBalanceCheck,
        isAuctionStarted,
        isAuctionEnded,
        isSaleComplete,
        floorPrice,
        reservePrice,
        startDate,
        endDate,
        isVisibleBeforeStartDate,
        isVisibleAfterEndDate,
        finalPrice,
        winningAddress,
        collectionId,
        enableBuyNow,
        enableAuction,
        enableReservePrice,
        galleryOnly,
        nft
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
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "SmartContractUID")
          required final String smartContractUid,
      @JsonKey(name: "AddressOwner")
          required final String ownerAddress,
      @JsonKey(name: "BuyNowPrice")
          final double? buyNowPrice,
      @JsonKey(name: "IsBuyNowOnly")
          final bool isBuyNowOnly,
      @JsonKey(name: "IsRoyaltyEnforced")
          final bool isRoyaltyEnforced,
      @JsonKey(name: "IsCancelled")
          final bool isCancelled,
      @JsonKey(name: "RequireBalanceCheck")
          final bool requireBalanceCheck,
      @JsonKey(name: "IsAuctionStarted")
          final bool isAuctionStarted,
      @JsonKey(name: "IsAuctionEnded")
          final bool isAuctionEnded,
      @JsonKey(name: "IsSaleComplete")
          final bool isSaleComplete,
      @JsonKey(name: "FloorPrice")
          final double? floorPrice,
      @JsonKey(name: "ReservePrice")
          final double? reservePrice,
      @JsonKey(name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
          required final DateTime startDate,
      @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
          required final DateTime endDate,
      @JsonKey(name: "IsVisibleBeforeStartDate")
          final bool isVisibleBeforeStartDate,
      @JsonKey(name: "IsVisibleAfterEndDate")
          final bool isVisibleAfterEndDate,
      @JsonKey(name: "FinalPrice")
          final double? finalPrice,
      @JsonKey(name: "WinningAddress")
          final String? winningAddress,
      @JsonKey(name: "CollectionId")
          required final int collectionId,
      @JsonKey(ignore: true)
          final bool enableBuyNow,
      @JsonKey(ignore: true)
          final bool enableAuction,
      @JsonKey(ignore: true)
          final bool enableReservePrice,
      @JsonKey(ignore: true)
          final bool galleryOnly,
      @JsonKey(ignore: true)
          final Nft? nft}) = _$_Listing;
  _Listing._() : super._();

  factory _Listing.fromJson(Map<String, dynamic> json) = _$_Listing.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid;
  @override
  @JsonKey(name: "AddressOwner")
  String get ownerAddress;
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
  @JsonKey(name: "IsAuctionStarted")
  bool get isAuctionStarted;
  @override
  @JsonKey(name: "IsAuctionEnded")
  bool get isAuctionEnded;
  @override
  @JsonKey(name: "IsSaleComplete")
  bool get isSaleComplete;
  @override
  @JsonKey(name: "FloorPrice")
  double? get floorPrice;
  @override
  @JsonKey(name: "ReservePrice")
  double? get reservePrice;
  @override
  @JsonKey(
      name: "StartDate", fromJson: startDateFromJson, toJson: stateDateToJson)
  DateTime get startDate;
  @override
  @JsonKey(name: "EndDate", fromJson: endDateFromJson, toJson: endDateToJson)
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
  @JsonKey(name: "CollectionId")
  int get collectionId;
  @override
  @JsonKey(ignore: true)
  bool get enableBuyNow;
  @override
  @JsonKey(ignore: true)
  bool get enableAuction;
  @override
  @JsonKey(ignore: true)
  bool get enableReservePrice;
  @override
  @JsonKey(ignore: true)
  bool get galleryOnly;
  @override
  @JsonKey(ignore: true)
  Nft? get nft;
  @override
  @JsonKey(ignore: true)
  _$$_ListingCopyWith<_$_Listing> get copyWith =>
      throw _privateConstructorUsedError;
}
