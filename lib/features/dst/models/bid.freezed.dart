// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bid _$BidFromJson(Map<String, dynamic> json) {
  return _Bid.fromJson(json);
}

/// @nodoc
mixin _$Bid {
  @JsonKey(name: "Id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "BidAddress")
  String get bidAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "BidSignature")
  String get bidSignature => throw _privateConstructorUsedError;
  @JsonKey(name: "BidAmount")
  double get bidAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "MaxBidAmount")
  double get maxBidAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "BidSendTime")
  int get bidSendTime => throw _privateConstructorUsedError;
  @JsonKey(name: "IsBuyNow")
  bool get isBuyNow => throw _privateConstructorUsedError;
  @JsonKey(name: "IsAutoBid")
  bool get isAutoBid => throw _privateConstructorUsedError;
  @JsonKey(name: "IsProcessed")
  bool? get isProcessed => throw _privateConstructorUsedError;
  @JsonKey(name: "ListingId")
  int get listingId => throw _privateConstructorUsedError;
  @JsonKey(name: "CollectionId")
  int get collectionId => throw _privateConstructorUsedError;
  @JsonKey(
      name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
  BidStatus get bidStatus => throw _privateConstructorUsedError;
  @JsonKey(
      name: "BidSendReceive",
      fromJson: bidSendReceiveFromJson,
      toJson: bidSendReveiveToJson)
  BidSendReceive get bidSendReceive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BidCopyWith<Bid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidCopyWith<$Res> {
  factory $BidCopyWith(Bid value, $Res Function(Bid) then) =
      _$BidCopyWithImpl<$Res, Bid>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id")
          String id,
      @JsonKey(name: "BidAddress")
          String bidAddress,
      @JsonKey(name: "BidSignature")
          String bidSignature,
      @JsonKey(name: "BidAmount")
          double bidAmount,
      @JsonKey(name: "MaxBidAmount")
          double maxBidAmount,
      @JsonKey(name: "BidSendTime")
          int bidSendTime,
      @JsonKey(name: "IsBuyNow")
          bool isBuyNow,
      @JsonKey(name: "IsAutoBid")
          bool isAutoBid,
      @JsonKey(name: "IsProcessed")
          bool? isProcessed,
      @JsonKey(name: "ListingId")
          int listingId,
      @JsonKey(name: "CollectionId")
          int collectionId,
      @JsonKey(name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          BidStatus bidStatus,
      @JsonKey(name: "BidSendReceive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          BidSendReceive bidSendReceive});
}

/// @nodoc
class _$BidCopyWithImpl<$Res, $Val extends Bid> implements $BidCopyWith<$Res> {
  _$BidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bidAddress = null,
    Object? bidSignature = null,
    Object? bidAmount = null,
    Object? maxBidAmount = null,
    Object? bidSendTime = null,
    Object? isBuyNow = null,
    Object? isAutoBid = null,
    Object? isProcessed = freezed,
    Object? listingId = null,
    Object? collectionId = null,
    Object? bidStatus = null,
    Object? bidSendReceive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bidAddress: null == bidAddress
          ? _value.bidAddress
          : bidAddress // ignore: cast_nullable_to_non_nullable
              as String,
      bidSignature: null == bidSignature
          ? _value.bidSignature
          : bidSignature // ignore: cast_nullable_to_non_nullable
              as String,
      bidAmount: null == bidAmount
          ? _value.bidAmount
          : bidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxBidAmount: null == maxBidAmount
          ? _value.maxBidAmount
          : maxBidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      bidSendTime: null == bidSendTime
          ? _value.bidSendTime
          : bidSendTime // ignore: cast_nullable_to_non_nullable
              as int,
      isBuyNow: null == isBuyNow
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      isAutoBid: null == isAutoBid
          ? _value.isAutoBid
          : isAutoBid // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessed: freezed == isProcessed
          ? _value.isProcessed
          : isProcessed // ignore: cast_nullable_to_non_nullable
              as bool?,
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      bidStatus: null == bidStatus
          ? _value.bidStatus
          : bidStatus // ignore: cast_nullable_to_non_nullable
              as BidStatus,
      bidSendReceive: null == bidSendReceive
          ? _value.bidSendReceive
          : bidSendReceive // ignore: cast_nullable_to_non_nullable
              as BidSendReceive,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BidCopyWith<$Res> implements $BidCopyWith<$Res> {
  factory _$$_BidCopyWith(_$_Bid value, $Res Function(_$_Bid) then) =
      __$$_BidCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id")
          String id,
      @JsonKey(name: "BidAddress")
          String bidAddress,
      @JsonKey(name: "BidSignature")
          String bidSignature,
      @JsonKey(name: "BidAmount")
          double bidAmount,
      @JsonKey(name: "MaxBidAmount")
          double maxBidAmount,
      @JsonKey(name: "BidSendTime")
          int bidSendTime,
      @JsonKey(name: "IsBuyNow")
          bool isBuyNow,
      @JsonKey(name: "IsAutoBid")
          bool isAutoBid,
      @JsonKey(name: "IsProcessed")
          bool? isProcessed,
      @JsonKey(name: "ListingId")
          int listingId,
      @JsonKey(name: "CollectionId")
          int collectionId,
      @JsonKey(name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          BidStatus bidStatus,
      @JsonKey(name: "BidSendReceive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          BidSendReceive bidSendReceive});
}

/// @nodoc
class __$$_BidCopyWithImpl<$Res> extends _$BidCopyWithImpl<$Res, _$_Bid>
    implements _$$_BidCopyWith<$Res> {
  __$$_BidCopyWithImpl(_$_Bid _value, $Res Function(_$_Bid) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bidAddress = null,
    Object? bidSignature = null,
    Object? bidAmount = null,
    Object? maxBidAmount = null,
    Object? bidSendTime = null,
    Object? isBuyNow = null,
    Object? isAutoBid = null,
    Object? isProcessed = freezed,
    Object? listingId = null,
    Object? collectionId = null,
    Object? bidStatus = null,
    Object? bidSendReceive = null,
  }) {
    return _then(_$_Bid(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bidAddress: null == bidAddress
          ? _value.bidAddress
          : bidAddress // ignore: cast_nullable_to_non_nullable
              as String,
      bidSignature: null == bidSignature
          ? _value.bidSignature
          : bidSignature // ignore: cast_nullable_to_non_nullable
              as String,
      bidAmount: null == bidAmount
          ? _value.bidAmount
          : bidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      maxBidAmount: null == maxBidAmount
          ? _value.maxBidAmount
          : maxBidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      bidSendTime: null == bidSendTime
          ? _value.bidSendTime
          : bidSendTime // ignore: cast_nullable_to_non_nullable
              as int,
      isBuyNow: null == isBuyNow
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      isAutoBid: null == isAutoBid
          ? _value.isAutoBid
          : isAutoBid // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessed: freezed == isProcessed
          ? _value.isProcessed
          : isProcessed // ignore: cast_nullable_to_non_nullable
              as bool?,
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      bidStatus: null == bidStatus
          ? _value.bidStatus
          : bidStatus // ignore: cast_nullable_to_non_nullable
              as BidStatus,
      bidSendReceive: null == bidSendReceive
          ? _value.bidSendReceive
          : bidSendReceive // ignore: cast_nullable_to_non_nullable
              as BidSendReceive,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bid extends _Bid {
  _$_Bid(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "BidAddress")
          required this.bidAddress,
      @JsonKey(name: "BidSignature")
          required this.bidSignature,
      @JsonKey(name: "BidAmount")
          required this.bidAmount,
      @JsonKey(name: "MaxBidAmount")
          required this.maxBidAmount,
      @JsonKey(name: "BidSendTime")
          required this.bidSendTime,
      @JsonKey(name: "IsBuyNow")
          required this.isBuyNow,
      @JsonKey(name: "IsAutoBid")
          required this.isAutoBid,
      @JsonKey(name: "IsProcessed")
          this.isProcessed,
      @JsonKey(name: "ListingId")
          required this.listingId,
      @JsonKey(name: "CollectionId")
          required this.collectionId,
      @JsonKey(name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          required this.bidStatus,
      @JsonKey(name: "BidSendReceive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          required this.bidSendReceive})
      : super._();

  factory _$_Bid.fromJson(Map<String, dynamic> json) => _$$_BidFromJson(json);

  @override
  @JsonKey(name: "Id")
  final String id;
  @override
  @JsonKey(name: "BidAddress")
  final String bidAddress;
  @override
  @JsonKey(name: "BidSignature")
  final String bidSignature;
  @override
  @JsonKey(name: "BidAmount")
  final double bidAmount;
  @override
  @JsonKey(name: "MaxBidAmount")
  final double maxBidAmount;
  @override
  @JsonKey(name: "BidSendTime")
  final int bidSendTime;
  @override
  @JsonKey(name: "IsBuyNow")
  final bool isBuyNow;
  @override
  @JsonKey(name: "IsAutoBid")
  final bool isAutoBid;
  @override
  @JsonKey(name: "IsProcessed")
  final bool? isProcessed;
  @override
  @JsonKey(name: "ListingId")
  final int listingId;
  @override
  @JsonKey(name: "CollectionId")
  final int collectionId;
  @override
  @JsonKey(
      name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
  final BidStatus bidStatus;
  @override
  @JsonKey(
      name: "BidSendReceive",
      fromJson: bidSendReceiveFromJson,
      toJson: bidSendReveiveToJson)
  final BidSendReceive bidSendReceive;

  @override
  String toString() {
    return 'Bid(id: $id, bidAddress: $bidAddress, bidSignature: $bidSignature, bidAmount: $bidAmount, maxBidAmount: $maxBidAmount, bidSendTime: $bidSendTime, isBuyNow: $isBuyNow, isAutoBid: $isAutoBid, isProcessed: $isProcessed, listingId: $listingId, collectionId: $collectionId, bidStatus: $bidStatus, bidSendReceive: $bidSendReceive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bid &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bidAddress, bidAddress) ||
                other.bidAddress == bidAddress) &&
            (identical(other.bidSignature, bidSignature) ||
                other.bidSignature == bidSignature) &&
            (identical(other.bidAmount, bidAmount) ||
                other.bidAmount == bidAmount) &&
            (identical(other.maxBidAmount, maxBidAmount) ||
                other.maxBidAmount == maxBidAmount) &&
            (identical(other.bidSendTime, bidSendTime) ||
                other.bidSendTime == bidSendTime) &&
            (identical(other.isBuyNow, isBuyNow) ||
                other.isBuyNow == isBuyNow) &&
            (identical(other.isAutoBid, isAutoBid) ||
                other.isAutoBid == isAutoBid) &&
            (identical(other.isProcessed, isProcessed) ||
                other.isProcessed == isProcessed) &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.bidStatus, bidStatus) ||
                other.bidStatus == bidStatus) &&
            (identical(other.bidSendReceive, bidSendReceive) ||
                other.bidSendReceive == bidSendReceive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bidAddress,
      bidSignature,
      bidAmount,
      maxBidAmount,
      bidSendTime,
      isBuyNow,
      isAutoBid,
      isProcessed,
      listingId,
      collectionId,
      bidStatus,
      bidSendReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BidCopyWith<_$_Bid> get copyWith =>
      __$$_BidCopyWithImpl<_$_Bid>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BidToJson(
      this,
    );
  }
}

abstract class _Bid extends Bid {
  factory _Bid(
      {@JsonKey(name: "Id")
          required final String id,
      @JsonKey(name: "BidAddress")
          required final String bidAddress,
      @JsonKey(name: "BidSignature")
          required final String bidSignature,
      @JsonKey(name: "BidAmount")
          required final double bidAmount,
      @JsonKey(name: "MaxBidAmount")
          required final double maxBidAmount,
      @JsonKey(name: "BidSendTime")
          required final int bidSendTime,
      @JsonKey(name: "IsBuyNow")
          required final bool isBuyNow,
      @JsonKey(name: "IsAutoBid")
          required final bool isAutoBid,
      @JsonKey(name: "IsProcessed")
          final bool? isProcessed,
      @JsonKey(name: "ListingId")
          required final int listingId,
      @JsonKey(name: "CollectionId")
          required final int collectionId,
      @JsonKey(name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          required final BidStatus bidStatus,
      @JsonKey(name: "BidSendReceive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          required final BidSendReceive bidSendReceive}) = _$_Bid;
  _Bid._() : super._();

  factory _Bid.fromJson(Map<String, dynamic> json) = _$_Bid.fromJson;

  @override
  @JsonKey(name: "Id")
  String get id;
  @override
  @JsonKey(name: "BidAddress")
  String get bidAddress;
  @override
  @JsonKey(name: "BidSignature")
  String get bidSignature;
  @override
  @JsonKey(name: "BidAmount")
  double get bidAmount;
  @override
  @JsonKey(name: "MaxBidAmount")
  double get maxBidAmount;
  @override
  @JsonKey(name: "BidSendTime")
  int get bidSendTime;
  @override
  @JsonKey(name: "IsBuyNow")
  bool get isBuyNow;
  @override
  @JsonKey(name: "IsAutoBid")
  bool get isAutoBid;
  @override
  @JsonKey(name: "IsProcessed")
  bool? get isProcessed;
  @override
  @JsonKey(name: "ListingId")
  int get listingId;
  @override
  @JsonKey(name: "CollectionId")
  int get collectionId;
  @override
  @JsonKey(
      name: "BidStatus", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
  BidStatus get bidStatus;
  @override
  @JsonKey(
      name: "BidSendReceive",
      fromJson: bidSendReceiveFromJson,
      toJson: bidSendReveiveToJson)
  BidSendReceive get bidSendReceive;
  @override
  @JsonKey(ignore: true)
  _$$_BidCopyWith<_$_Bid> get copyWith => throw _privateConstructorUsedError;
}
