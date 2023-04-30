// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebListing _$WebListingFromJson(Map<String, dynamic> json) {
  return _WebListing.fromJson(json);
}

/// @nodoc
mixin _$WebListing {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(toJson: collectionToJson)
  WebCollection get collection => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  WebNft? get nft => throw _privateConstructorUsedError;
  @JsonKey(name: "smart_contract_uid")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_address")
  String get ownerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "winning_address")
  String? get winningAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "buy_now_price")
  double? get buyNowPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "floor_price")
  double? get floorPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "reserve_price")
  double? get reservePrice => throw _privateConstructorUsedError;
  @JsonKey(name: "final_price")
  double? get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "is_visible_before_start_date")
  bool get isVisibleBeforeStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: "is_visible_after_end_date")
  bool get isVisibleAfterEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: "is_cancelled")
  bool get isCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: "has_started")
  bool get isAuctionStarted => throw _privateConstructorUsedError;
  @JsonKey(name: "has_ended")
  bool get isAuctionEnded => throw _privateConstructorUsedError;
  @JsonKey(name: "purchase_key")
  String get purchaseKey => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get enableBuyNow => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get enableAuction => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get enableReservePrice => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get galleryOnly => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<String> get thumbnails => throw _privateConstructorUsedError;
  WebAuction? get auction => throw _privateConstructorUsedError;
  List<WebBid> get bids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebListingCopyWith<WebListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebListingCopyWith<$Res> {
  factory $WebListingCopyWith(
          WebListing value, $Res Function(WebListing) then) =
      _$WebListingCopyWithImpl<$Res, WebListing>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(toJson: collectionToJson)
          WebCollection collection,
      @JsonKey(includeToJson: false)
          WebNft? nft,
      @JsonKey(name: "smart_contract_uid")
          String smartContractUid,
      @JsonKey(name: "owner_address")
          String ownerAddress,
      @JsonKey(name: "winning_address")
          String? winningAddress,
      @JsonKey(name: "buy_now_price")
          double? buyNowPrice,
      @JsonKey(name: "floor_price")
          double? floorPrice,
      @JsonKey(name: "reserve_price")
          double? reservePrice,
      @JsonKey(name: "final_price")
          double? finalPrice,
      @JsonKey(name: "start_date")
          DateTime startDate,
      @JsonKey(name: "end_date")
          DateTime endDate,
      @JsonKey(name: "is_visible_before_start_date")
          bool isVisibleBeforeStartDate,
      @JsonKey(name: "is_visible_after_end_date")
          bool isVisibleAfterEndDate,
      @JsonKey(name: "is_cancelled")
          bool isCancelled,
      @JsonKey(name: "has_started")
          bool isAuctionStarted,
      @JsonKey(name: "has_ended")
          bool isAuctionEnded,
      @JsonKey(name: "purchase_key")
          String purchaseKey,
      @JsonKey(ignore: true)
          bool enableBuyNow,
      @JsonKey(ignore: true)
          bool enableAuction,
      @JsonKey(ignore: true)
          bool enableReservePrice,
      @JsonKey(ignore: true)
          bool galleryOnly,
      @JsonKey(defaultValue: [])
          List<String> thumbnails,
      WebAuction? auction,
      List<WebBid> bids});

  $WebCollectionCopyWith<$Res> get collection;
  $WebNftCopyWith<$Res>? get nft;
  $WebAuctionCopyWith<$Res>? get auction;
}

/// @nodoc
class _$WebListingCopyWithImpl<$Res, $Val extends WebListing>
    implements $WebListingCopyWith<$Res> {
  _$WebListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collection = null,
    Object? nft = freezed,
    Object? smartContractUid = null,
    Object? ownerAddress = null,
    Object? winningAddress = freezed,
    Object? buyNowPrice = freezed,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? finalPrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? isCancelled = null,
    Object? isAuctionStarted = null,
    Object? isAuctionEnded = null,
    Object? purchaseKey = null,
    Object? enableBuyNow = null,
    Object? enableAuction = null,
    Object? enableReservePrice = null,
    Object? galleryOnly = null,
    Object? thumbnails = null,
    Object? auction = freezed,
    Object? bids = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as WebCollection,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as WebNft?,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      winningAddress: freezed == winningAddress
          ? _value.winningAddress
          : winningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reservePrice: freezed == reservePrice
          ? _value.reservePrice
          : reservePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
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
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionStarted: null == isAuctionStarted
          ? _value.isAuctionStarted
          : isAuctionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionEnded: null == isAuctionEnded
          ? _value.isAuctionEnded
          : isAuctionEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseKey: null == purchaseKey
          ? _value.purchaseKey
          : purchaseKey // ignore: cast_nullable_to_non_nullable
              as String,
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
      thumbnails: null == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      auction: freezed == auction
          ? _value.auction
          : auction // ignore: cast_nullable_to_non_nullable
              as WebAuction?,
      bids: null == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<WebBid>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WebCollectionCopyWith<$Res> get collection {
    return $WebCollectionCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WebNftCopyWith<$Res>? get nft {
    if (_value.nft == null) {
      return null;
    }

    return $WebNftCopyWith<$Res>(_value.nft!, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WebAuctionCopyWith<$Res>? get auction {
    if (_value.auction == null) {
      return null;
    }

    return $WebAuctionCopyWith<$Res>(_value.auction!, (value) {
      return _then(_value.copyWith(auction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WebListingCopyWith<$Res>
    implements $WebListingCopyWith<$Res> {
  factory _$$_WebListingCopyWith(
          _$_WebListing value, $Res Function(_$_WebListing) then) =
      __$$_WebListingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(toJson: collectionToJson)
          WebCollection collection,
      @JsonKey(includeToJson: false)
          WebNft? nft,
      @JsonKey(name: "smart_contract_uid")
          String smartContractUid,
      @JsonKey(name: "owner_address")
          String ownerAddress,
      @JsonKey(name: "winning_address")
          String? winningAddress,
      @JsonKey(name: "buy_now_price")
          double? buyNowPrice,
      @JsonKey(name: "floor_price")
          double? floorPrice,
      @JsonKey(name: "reserve_price")
          double? reservePrice,
      @JsonKey(name: "final_price")
          double? finalPrice,
      @JsonKey(name: "start_date")
          DateTime startDate,
      @JsonKey(name: "end_date")
          DateTime endDate,
      @JsonKey(name: "is_visible_before_start_date")
          bool isVisibleBeforeStartDate,
      @JsonKey(name: "is_visible_after_end_date")
          bool isVisibleAfterEndDate,
      @JsonKey(name: "is_cancelled")
          bool isCancelled,
      @JsonKey(name: "has_started")
          bool isAuctionStarted,
      @JsonKey(name: "has_ended")
          bool isAuctionEnded,
      @JsonKey(name: "purchase_key")
          String purchaseKey,
      @JsonKey(ignore: true)
          bool enableBuyNow,
      @JsonKey(ignore: true)
          bool enableAuction,
      @JsonKey(ignore: true)
          bool enableReservePrice,
      @JsonKey(ignore: true)
          bool galleryOnly,
      @JsonKey(defaultValue: [])
          List<String> thumbnails,
      WebAuction? auction,
      List<WebBid> bids});

  @override
  $WebCollectionCopyWith<$Res> get collection;
  @override
  $WebNftCopyWith<$Res>? get nft;
  @override
  $WebAuctionCopyWith<$Res>? get auction;
}

/// @nodoc
class __$$_WebListingCopyWithImpl<$Res>
    extends _$WebListingCopyWithImpl<$Res, _$_WebListing>
    implements _$$_WebListingCopyWith<$Res> {
  __$$_WebListingCopyWithImpl(
      _$_WebListing _value, $Res Function(_$_WebListing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collection = null,
    Object? nft = freezed,
    Object? smartContractUid = null,
    Object? ownerAddress = null,
    Object? winningAddress = freezed,
    Object? buyNowPrice = freezed,
    Object? floorPrice = freezed,
    Object? reservePrice = freezed,
    Object? finalPrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? isCancelled = null,
    Object? isAuctionStarted = null,
    Object? isAuctionEnded = null,
    Object? purchaseKey = null,
    Object? enableBuyNow = null,
    Object? enableAuction = null,
    Object? enableReservePrice = null,
    Object? galleryOnly = null,
    Object? thumbnails = null,
    Object? auction = freezed,
    Object? bids = null,
  }) {
    return _then(_$_WebListing(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as WebCollection,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as WebNft?,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      winningAddress: freezed == winningAddress
          ? _value.winningAddress
          : winningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      buyNowPrice: freezed == buyNowPrice
          ? _value.buyNowPrice
          : buyNowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      floorPrice: freezed == floorPrice
          ? _value.floorPrice
          : floorPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      reservePrice: freezed == reservePrice
          ? _value.reservePrice
          : reservePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
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
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionStarted: null == isAuctionStarted
          ? _value.isAuctionStarted
          : isAuctionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionEnded: null == isAuctionEnded
          ? _value.isAuctionEnded
          : isAuctionEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseKey: null == purchaseKey
          ? _value.purchaseKey
          : purchaseKey // ignore: cast_nullable_to_non_nullable
              as String,
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
      thumbnails: null == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      auction: freezed == auction
          ? _value.auction
          : auction // ignore: cast_nullable_to_non_nullable
              as WebAuction?,
      bids: null == bids
          ? _value._bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<WebBid>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebListing extends _WebListing {
  _$_WebListing(
      {required this.id,
      @JsonKey(toJson: collectionToJson)
          required this.collection,
      @JsonKey(includeToJson: false)
          this.nft,
      @JsonKey(name: "smart_contract_uid")
          required this.smartContractUid,
      @JsonKey(name: "owner_address")
          required this.ownerAddress,
      @JsonKey(name: "winning_address")
          this.winningAddress,
      @JsonKey(name: "buy_now_price")
          this.buyNowPrice,
      @JsonKey(name: "floor_price")
          this.floorPrice,
      @JsonKey(name: "reserve_price")
          this.reservePrice,
      @JsonKey(name: "final_price")
          this.finalPrice = 0,
      @JsonKey(name: "start_date")
          required this.startDate,
      @JsonKey(name: "end_date")
          required this.endDate,
      @JsonKey(name: "is_visible_before_start_date")
          required this.isVisibleBeforeStartDate,
      @JsonKey(name: "is_visible_after_end_date")
          required this.isVisibleAfterEndDate,
      @JsonKey(name: "is_cancelled")
          this.isCancelled = false,
      @JsonKey(name: "has_started")
          this.isAuctionStarted = true,
      @JsonKey(name: "has_ended")
          this.isAuctionEnded = false,
      @JsonKey(name: "purchase_key")
          this.purchaseKey = "",
      @JsonKey(ignore: true)
          this.enableBuyNow = false,
      @JsonKey(ignore: true)
          this.enableAuction = false,
      @JsonKey(ignore: true)
          this.enableReservePrice = false,
      @JsonKey(ignore: true)
          this.galleryOnly = false,
      @JsonKey(defaultValue: [])
          required final List<String> thumbnails,
      this.auction = null,
      final List<WebBid> bids = const []})
      : _thumbnails = thumbnails,
        _bids = bids,
        super._();

  factory _$_WebListing.fromJson(Map<String, dynamic> json) =>
      _$$_WebListingFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(toJson: collectionToJson)
  final WebCollection collection;
  @override
  @JsonKey(includeToJson: false)
  final WebNft? nft;
  @override
  @JsonKey(name: "smart_contract_uid")
  final String smartContractUid;
  @override
  @JsonKey(name: "owner_address")
  final String ownerAddress;
  @override
  @JsonKey(name: "winning_address")
  final String? winningAddress;
  @override
  @JsonKey(name: "buy_now_price")
  final double? buyNowPrice;
  @override
  @JsonKey(name: "floor_price")
  final double? floorPrice;
  @override
  @JsonKey(name: "reserve_price")
  final double? reservePrice;
  @override
  @JsonKey(name: "final_price")
  final double? finalPrice;
  @override
  @JsonKey(name: "start_date")
  final DateTime startDate;
  @override
  @JsonKey(name: "end_date")
  final DateTime endDate;
  @override
  @JsonKey(name: "is_visible_before_start_date")
  final bool isVisibleBeforeStartDate;
  @override
  @JsonKey(name: "is_visible_after_end_date")
  final bool isVisibleAfterEndDate;
  @override
  @JsonKey(name: "is_cancelled")
  final bool isCancelled;
  @override
  @JsonKey(name: "has_started")
  final bool isAuctionStarted;
  @override
  @JsonKey(name: "has_ended")
  final bool isAuctionEnded;
  @override
  @JsonKey(name: "purchase_key")
  final String purchaseKey;
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
  final List<String> _thumbnails;
  @override
  @JsonKey(defaultValue: [])
  List<String> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  @override
  @JsonKey()
  final WebAuction? auction;
  final List<WebBid> _bids;
  @override
  @JsonKey()
  List<WebBid> get bids {
    if (_bids is EqualUnmodifiableListView) return _bids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bids);
  }

  @override
  String toString() {
    return 'WebListing(id: $id, collection: $collection, nft: $nft, smartContractUid: $smartContractUid, ownerAddress: $ownerAddress, winningAddress: $winningAddress, buyNowPrice: $buyNowPrice, floorPrice: $floorPrice, reservePrice: $reservePrice, finalPrice: $finalPrice, startDate: $startDate, endDate: $endDate, isVisibleBeforeStartDate: $isVisibleBeforeStartDate, isVisibleAfterEndDate: $isVisibleAfterEndDate, isCancelled: $isCancelled, isAuctionStarted: $isAuctionStarted, isAuctionEnded: $isAuctionEnded, purchaseKey: $purchaseKey, enableBuyNow: $enableBuyNow, enableAuction: $enableAuction, enableReservePrice: $enableReservePrice, galleryOnly: $galleryOnly, thumbnails: $thumbnails, auction: $auction, bids: $bids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebListing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.nft, nft) || other.nft == nft) &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.winningAddress, winningAddress) ||
                other.winningAddress == winningAddress) &&
            (identical(other.buyNowPrice, buyNowPrice) ||
                other.buyNowPrice == buyNowPrice) &&
            (identical(other.floorPrice, floorPrice) ||
                other.floorPrice == floorPrice) &&
            (identical(other.reservePrice, reservePrice) ||
                other.reservePrice == reservePrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(
                    other.isVisibleBeforeStartDate, isVisibleBeforeStartDate) ||
                other.isVisibleBeforeStartDate == isVisibleBeforeStartDate) &&
            (identical(other.isVisibleAfterEndDate, isVisibleAfterEndDate) ||
                other.isVisibleAfterEndDate == isVisibleAfterEndDate) &&
            (identical(other.isCancelled, isCancelled) ||
                other.isCancelled == isCancelled) &&
            (identical(other.isAuctionStarted, isAuctionStarted) ||
                other.isAuctionStarted == isAuctionStarted) &&
            (identical(other.isAuctionEnded, isAuctionEnded) ||
                other.isAuctionEnded == isAuctionEnded) &&
            (identical(other.purchaseKey, purchaseKey) ||
                other.purchaseKey == purchaseKey) &&
            (identical(other.enableBuyNow, enableBuyNow) ||
                other.enableBuyNow == enableBuyNow) &&
            (identical(other.enableAuction, enableAuction) ||
                other.enableAuction == enableAuction) &&
            (identical(other.enableReservePrice, enableReservePrice) ||
                other.enableReservePrice == enableReservePrice) &&
            (identical(other.galleryOnly, galleryOnly) ||
                other.galleryOnly == galleryOnly) &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails) &&
            (identical(other.auction, auction) || other.auction == auction) &&
            const DeepCollectionEquality().equals(other._bids, _bids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        collection,
        nft,
        smartContractUid,
        ownerAddress,
        winningAddress,
        buyNowPrice,
        floorPrice,
        reservePrice,
        finalPrice,
        startDate,
        endDate,
        isVisibleBeforeStartDate,
        isVisibleAfterEndDate,
        isCancelled,
        isAuctionStarted,
        isAuctionEnded,
        purchaseKey,
        enableBuyNow,
        enableAuction,
        enableReservePrice,
        galleryOnly,
        const DeepCollectionEquality().hash(_thumbnails),
        auction,
        const DeepCollectionEquality().hash(_bids)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebListingCopyWith<_$_WebListing> get copyWith =>
      __$$_WebListingCopyWithImpl<_$_WebListing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebListingToJson(
      this,
    );
  }
}

abstract class _WebListing extends WebListing {
  factory _WebListing(
      {required final int id,
      @JsonKey(toJson: collectionToJson)
          required final WebCollection collection,
      @JsonKey(includeToJson: false)
          final WebNft? nft,
      @JsonKey(name: "smart_contract_uid")
          required final String smartContractUid,
      @JsonKey(name: "owner_address")
          required final String ownerAddress,
      @JsonKey(name: "winning_address")
          final String? winningAddress,
      @JsonKey(name: "buy_now_price")
          final double? buyNowPrice,
      @JsonKey(name: "floor_price")
          final double? floorPrice,
      @JsonKey(name: "reserve_price")
          final double? reservePrice,
      @JsonKey(name: "final_price")
          final double? finalPrice,
      @JsonKey(name: "start_date")
          required final DateTime startDate,
      @JsonKey(name: "end_date")
          required final DateTime endDate,
      @JsonKey(name: "is_visible_before_start_date")
          required final bool isVisibleBeforeStartDate,
      @JsonKey(name: "is_visible_after_end_date")
          required final bool isVisibleAfterEndDate,
      @JsonKey(name: "is_cancelled")
          final bool isCancelled,
      @JsonKey(name: "has_started")
          final bool isAuctionStarted,
      @JsonKey(name: "has_ended")
          final bool isAuctionEnded,
      @JsonKey(name: "purchase_key")
          final String purchaseKey,
      @JsonKey(ignore: true)
          final bool enableBuyNow,
      @JsonKey(ignore: true)
          final bool enableAuction,
      @JsonKey(ignore: true)
          final bool enableReservePrice,
      @JsonKey(ignore: true)
          final bool galleryOnly,
      @JsonKey(defaultValue: [])
          required final List<String> thumbnails,
      final WebAuction? auction,
      final List<WebBid> bids}) = _$_WebListing;
  _WebListing._() : super._();

  factory _WebListing.fromJson(Map<String, dynamic> json) =
      _$_WebListing.fromJson;

  @override
  int get id;
  @override
  @JsonKey(toJson: collectionToJson)
  WebCollection get collection;
  @override
  @JsonKey(includeToJson: false)
  WebNft? get nft;
  @override
  @JsonKey(name: "smart_contract_uid")
  String get smartContractUid;
  @override
  @JsonKey(name: "owner_address")
  String get ownerAddress;
  @override
  @JsonKey(name: "winning_address")
  String? get winningAddress;
  @override
  @JsonKey(name: "buy_now_price")
  double? get buyNowPrice;
  @override
  @JsonKey(name: "floor_price")
  double? get floorPrice;
  @override
  @JsonKey(name: "reserve_price")
  double? get reservePrice;
  @override
  @JsonKey(name: "final_price")
  double? get finalPrice;
  @override
  @JsonKey(name: "start_date")
  DateTime get startDate;
  @override
  @JsonKey(name: "end_date")
  DateTime get endDate;
  @override
  @JsonKey(name: "is_visible_before_start_date")
  bool get isVisibleBeforeStartDate;
  @override
  @JsonKey(name: "is_visible_after_end_date")
  bool get isVisibleAfterEndDate;
  @override
  @JsonKey(name: "is_cancelled")
  bool get isCancelled;
  @override
  @JsonKey(name: "has_started")
  bool get isAuctionStarted;
  @override
  @JsonKey(name: "has_ended")
  bool get isAuctionEnded;
  @override
  @JsonKey(name: "purchase_key")
  String get purchaseKey;
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
  @JsonKey(defaultValue: [])
  List<String> get thumbnails;
  @override
  WebAuction? get auction;
  @override
  List<WebBid> get bids;
  @override
  @JsonKey(ignore: true)
  _$$_WebListingCopyWith<_$_WebListing> get copyWith =>
      throw _privateConstructorUsedError;
}
