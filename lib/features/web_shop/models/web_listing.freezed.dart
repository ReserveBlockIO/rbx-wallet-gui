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
  WebCollection get collection => throw _privateConstructorUsedError;
  WebNft get nft => throw _privateConstructorUsedError;
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
  @JsonKey(name: "thumbnails_fetched")
  bool get thumbnailsFetched => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<String> get thumbnails => throw _privateConstructorUsedError;

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
      WebCollection collection,
      WebNft nft,
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
      @JsonKey(name: "thumbnails_fetched")
          bool thumbnailsFetched,
      @JsonKey(defaultValue: [])
          List<String> thumbnails});

  $WebCollectionCopyWith<$Res> get collection;
  $WebNftCopyWith<$Res> get nft;
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
    Object? nft = null,
    Object? smartContractUid = null,
    Object? ownerAddress = null,
    Object? winningAddress = freezed,
    Object? buyNowPrice = freezed,
    Object? floorPrice = freezed,
    Object? finalPrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? thumbnailsFetched = null,
    Object? thumbnails = null,
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
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as WebNft,
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
      thumbnailsFetched: null == thumbnailsFetched
          ? _value.thumbnailsFetched
          : thumbnailsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnails: null == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $WebNftCopyWith<$Res> get nft {
    return $WebNftCopyWith<$Res>(_value.nft, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
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
      WebCollection collection,
      WebNft nft,
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
      @JsonKey(name: "thumbnails_fetched")
          bool thumbnailsFetched,
      @JsonKey(defaultValue: [])
          List<String> thumbnails});

  @override
  $WebCollectionCopyWith<$Res> get collection;
  @override
  $WebNftCopyWith<$Res> get nft;
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
    Object? nft = null,
    Object? smartContractUid = null,
    Object? ownerAddress = null,
    Object? winningAddress = freezed,
    Object? buyNowPrice = freezed,
    Object? floorPrice = freezed,
    Object? finalPrice = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? isVisibleBeforeStartDate = null,
    Object? isVisibleAfterEndDate = null,
    Object? thumbnailsFetched = null,
    Object? thumbnails = null,
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
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as WebNft,
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
      thumbnailsFetched: null == thumbnailsFetched
          ? _value.thumbnailsFetched
          : thumbnailsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnails: null == thumbnails
          ? _value._thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebListing extends _WebListing {
  _$_WebListing(
      {required this.id,
      required this.collection,
      required this.nft,
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
      @JsonKey(name: "final_price")
          this.finalPrice,
      @JsonKey(name: "start_date")
          required this.startDate,
      @JsonKey(name: "end_date")
          required this.endDate,
      @JsonKey(name: "is_visible_before_start_date")
          required this.isVisibleBeforeStartDate,
      @JsonKey(name: "is_visible_after_end_date")
          required this.isVisibleAfterEndDate,
      @JsonKey(name: "thumbnails_fetched")
          required this.thumbnailsFetched,
      @JsonKey(defaultValue: [])
          required final List<String> thumbnails})
      : _thumbnails = thumbnails,
        super._();

  factory _$_WebListing.fromJson(Map<String, dynamic> json) =>
      _$$_WebListingFromJson(json);

  @override
  final int id;
  @override
  final WebCollection collection;
  @override
  final WebNft nft;
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
  @JsonKey(name: "thumbnails_fetched")
  final bool thumbnailsFetched;
  final List<String> _thumbnails;
  @override
  @JsonKey(defaultValue: [])
  List<String> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  @override
  String toString() {
    return 'WebListing(id: $id, collection: $collection, nft: $nft, smartContractUid: $smartContractUid, ownerAddress: $ownerAddress, winningAddress: $winningAddress, buyNowPrice: $buyNowPrice, floorPrice: $floorPrice, finalPrice: $finalPrice, startDate: $startDate, endDate: $endDate, isVisibleBeforeStartDate: $isVisibleBeforeStartDate, isVisibleAfterEndDate: $isVisibleAfterEndDate, thumbnailsFetched: $thumbnailsFetched, thumbnails: $thumbnails)';
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
            (identical(other.thumbnailsFetched, thumbnailsFetched) ||
                other.thumbnailsFetched == thumbnailsFetched) &&
            const DeepCollectionEquality()
                .equals(other._thumbnails, _thumbnails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      collection,
      nft,
      smartContractUid,
      ownerAddress,
      winningAddress,
      buyNowPrice,
      floorPrice,
      finalPrice,
      startDate,
      endDate,
      isVisibleBeforeStartDate,
      isVisibleAfterEndDate,
      thumbnailsFetched,
      const DeepCollectionEquality().hash(_thumbnails));

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
      required final WebCollection collection,
      required final WebNft nft,
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
      @JsonKey(name: "thumbnails_fetched")
          required final bool thumbnailsFetched,
      @JsonKey(defaultValue: [])
          required final List<String> thumbnails}) = _$_WebListing;
  _WebListing._() : super._();

  factory _WebListing.fromJson(Map<String, dynamic> json) =
      _$_WebListing.fromJson;

  @override
  int get id;
  @override
  WebCollection get collection;
  @override
  WebNft get nft;
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
  @JsonKey(name: "thumbnails_fetched")
  bool get thumbnailsFetched;
  @override
  @JsonKey(defaultValue: [])
  List<String> get thumbnails;
  @override
  @JsonKey(ignore: true)
  _$$_WebListingCopyWith<_$_WebListing> get copyWith =>
      throw _privateConstructorUsedError;
}
