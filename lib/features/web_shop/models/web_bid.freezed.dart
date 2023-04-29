// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_bid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebBid _$WebBidFromJson(Map<String, dynamic> json) {
  return _WebBid.fromJson(json);
}

/// @nodoc
mixin _$WebBid {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "bid_id")
  String get bidId => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "send_time")
  int get sendTime => throw _privateConstructorUsedError;
  @JsonKey(name: "is_buy_now")
  bool get isBuyNow => throw _privateConstructorUsedError;
  @JsonKey(name: "is_processed")
  bool get isProcessed => throw _privateConstructorUsedError;
  @JsonKey(name: "purchase_key")
  String? get purchaseKey => throw _privateConstructorUsedError;
  @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
  BidStatus get bidStatus => throw _privateConstructorUsedError;
  @JsonKey(
      name: "send_receive",
      fromJson: bidSendReceiveFromJson,
      toJson: bidSendReveiveToJson)
  BidSendReceive get bidSendReceive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebBidCopyWith<WebBid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebBidCopyWith<$Res> {
  factory $WebBidCopyWith(WebBid value, $Res Function(WebBid) then) =
      _$WebBidCopyWithImpl<$Res, WebBid>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "bid_id")
          String bidId,
      String address,
      String signature,
      double amount,
      @JsonKey(name: "send_time")
          int sendTime,
      @JsonKey(name: "is_buy_now")
          bool isBuyNow,
      @JsonKey(name: "is_processed")
          bool isProcessed,
      @JsonKey(name: "purchase_key")
          String? purchaseKey,
      @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          BidStatus bidStatus,
      @JsonKey(name: "send_receive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          BidSendReceive bidSendReceive});
}

/// @nodoc
class _$WebBidCopyWithImpl<$Res, $Val extends WebBid>
    implements $WebBidCopyWith<$Res> {
  _$WebBidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bidId = null,
    Object? address = null,
    Object? signature = null,
    Object? amount = null,
    Object? sendTime = null,
    Object? isBuyNow = null,
    Object? isProcessed = null,
    Object? purchaseKey = freezed,
    Object? bidStatus = null,
    Object? bidSendReceive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bidId: null == bidId
          ? _value.bidId
          : bidId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      sendTime: null == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as int,
      isBuyNow: null == isBuyNow
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessed: null == isProcessed
          ? _value.isProcessed
          : isProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseKey: freezed == purchaseKey
          ? _value.purchaseKey
          : purchaseKey // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_WebBidCopyWith<$Res> implements $WebBidCopyWith<$Res> {
  factory _$$_WebBidCopyWith(_$_WebBid value, $Res Function(_$_WebBid) then) =
      __$$_WebBidCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "bid_id")
          String bidId,
      String address,
      String signature,
      double amount,
      @JsonKey(name: "send_time")
          int sendTime,
      @JsonKey(name: "is_buy_now")
          bool isBuyNow,
      @JsonKey(name: "is_processed")
          bool isProcessed,
      @JsonKey(name: "purchase_key")
          String? purchaseKey,
      @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          BidStatus bidStatus,
      @JsonKey(name: "send_receive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          BidSendReceive bidSendReceive});
}

/// @nodoc
class __$$_WebBidCopyWithImpl<$Res>
    extends _$WebBidCopyWithImpl<$Res, _$_WebBid>
    implements _$$_WebBidCopyWith<$Res> {
  __$$_WebBidCopyWithImpl(_$_WebBid _value, $Res Function(_$_WebBid) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bidId = null,
    Object? address = null,
    Object? signature = null,
    Object? amount = null,
    Object? sendTime = null,
    Object? isBuyNow = null,
    Object? isProcessed = null,
    Object? purchaseKey = freezed,
    Object? bidStatus = null,
    Object? bidSendReceive = null,
  }) {
    return _then(_$_WebBid(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bidId: null == bidId
          ? _value.bidId
          : bidId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      sendTime: null == sendTime
          ? _value.sendTime
          : sendTime // ignore: cast_nullable_to_non_nullable
              as int,
      isBuyNow: null == isBuyNow
          ? _value.isBuyNow
          : isBuyNow // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessed: null == isProcessed
          ? _value.isProcessed
          : isProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      purchaseKey: freezed == purchaseKey
          ? _value.purchaseKey
          : purchaseKey // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_WebBid extends _WebBid {
  _$_WebBid(
      {required this.id,
      @JsonKey(name: "bid_id")
          required this.bidId,
      required this.address,
      required this.signature,
      required this.amount,
      @JsonKey(name: "send_time")
          required this.sendTime,
      @JsonKey(name: "is_buy_now")
          this.isBuyNow = false,
      @JsonKey(name: "is_processed")
          this.isProcessed = false,
      @JsonKey(name: "purchase_key")
          this.purchaseKey,
      @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          required this.bidStatus,
      @JsonKey(name: "send_receive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          required this.bidSendReceive})
      : super._();

  factory _$_WebBid.fromJson(Map<String, dynamic> json) =>
      _$$_WebBidFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "bid_id")
  final String bidId;
  @override
  final String address;
  @override
  final String signature;
  @override
  final double amount;
  @override
  @JsonKey(name: "send_time")
  final int sendTime;
  @override
  @JsonKey(name: "is_buy_now")
  final bool isBuyNow;
  @override
  @JsonKey(name: "is_processed")
  final bool isProcessed;
  @override
  @JsonKey(name: "purchase_key")
  final String? purchaseKey;
  @override
  @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
  final BidStatus bidStatus;
  @override
  @JsonKey(
      name: "send_receive",
      fromJson: bidSendReceiveFromJson,
      toJson: bidSendReveiveToJson)
  final BidSendReceive bidSendReceive;

  @override
  String toString() {
    return 'WebBid(id: $id, bidId: $bidId, address: $address, signature: $signature, amount: $amount, sendTime: $sendTime, isBuyNow: $isBuyNow, isProcessed: $isProcessed, purchaseKey: $purchaseKey, bidStatus: $bidStatus, bidSendReceive: $bidSendReceive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebBid &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bidId, bidId) || other.bidId == bidId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.sendTime, sendTime) ||
                other.sendTime == sendTime) &&
            (identical(other.isBuyNow, isBuyNow) ||
                other.isBuyNow == isBuyNow) &&
            (identical(other.isProcessed, isProcessed) ||
                other.isProcessed == isProcessed) &&
            (identical(other.purchaseKey, purchaseKey) ||
                other.purchaseKey == purchaseKey) &&
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
      bidId,
      address,
      signature,
      amount,
      sendTime,
      isBuyNow,
      isProcessed,
      purchaseKey,
      bidStatus,
      bidSendReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebBidCopyWith<_$_WebBid> get copyWith =>
      __$$_WebBidCopyWithImpl<_$_WebBid>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebBidToJson(
      this,
    );
  }
}

abstract class _WebBid extends WebBid {
  factory _WebBid(
      {required final int id,
      @JsonKey(name: "bid_id")
          required final String bidId,
      required final String address,
      required final String signature,
      required final double amount,
      @JsonKey(name: "send_time")
          required final int sendTime,
      @JsonKey(name: "is_buy_now")
          final bool isBuyNow,
      @JsonKey(name: "is_processed")
          final bool isProcessed,
      @JsonKey(name: "purchase_key")
          final String? purchaseKey,
      @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
          required final BidStatus bidStatus,
      @JsonKey(name: "send_receive", fromJson: bidSendReceiveFromJson, toJson: bidSendReveiveToJson)
          required final BidSendReceive bidSendReceive}) = _$_WebBid;
  _WebBid._() : super._();

  factory _WebBid.fromJson(Map<String, dynamic> json) = _$_WebBid.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "bid_id")
  String get bidId;
  @override
  String get address;
  @override
  String get signature;
  @override
  double get amount;
  @override
  @JsonKey(name: "send_time")
  int get sendTime;
  @override
  @JsonKey(name: "is_buy_now")
  bool get isBuyNow;
  @override
  @JsonKey(name: "is_processed")
  bool get isProcessed;
  @override
  @JsonKey(name: "purchase_key")
  String? get purchaseKey;
  @override
  @JsonKey(name: "status", fromJson: bidStatusFromJson, toJson: bidStatusToJson)
  BidStatus get bidStatus;
  @override
  @JsonKey(
      name: "send_receive",
      fromJson: bidSendReceiveFromJson,
      toJson: bidSendReveiveToJson)
  BidSendReceive get bidSendReceive;
  @override
  @JsonKey(ignore: true)
  _$$_WebBidCopyWith<_$_WebBid> get copyWith =>
      throw _privateConstructorUsedError;
}
