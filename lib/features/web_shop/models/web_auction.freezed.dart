// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_auction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebAuction _$WebAuctionFromJson(Map<String, dynamic> json) {
  return _WebAuction.fromJson(json);
}

/// @nodoc
mixin _$WebAuction {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "current_bid_price")
  double? get currentBidPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "increment_amount")
  double get incrementAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "is_reserve_met")
  bool get isReserveMet => throw _privateConstructorUsedError;
  @JsonKey(name: "is_auction_over")
  bool get isAuctionOver => throw _privateConstructorUsedError;
  @JsonKey(name: "current_winning_address")
  String? get currentWinningAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebAuctionCopyWith<WebAuction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebAuctionCopyWith<$Res> {
  factory $WebAuctionCopyWith(
          WebAuction value, $Res Function(WebAuction) then) =
      _$WebAuctionCopyWithImpl<$Res, WebAuction>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "current_bid_price") double? currentBidPrice,
      @JsonKey(name: "increment_amount") double incrementAmount,
      @JsonKey(name: "is_reserve_met") bool isReserveMet,
      @JsonKey(name: "is_auction_over") bool isAuctionOver,
      @JsonKey(name: "current_winning_address") String? currentWinningAddress});
}

/// @nodoc
class _$WebAuctionCopyWithImpl<$Res, $Val extends WebAuction>
    implements $WebAuctionCopyWith<$Res> {
  _$WebAuctionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentBidPrice = freezed,
    Object? incrementAmount = null,
    Object? isReserveMet = null,
    Object? isAuctionOver = null,
    Object? currentWinningAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currentBidPrice: freezed == currentBidPrice
          ? _value.currentBidPrice
          : currentBidPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      incrementAmount: null == incrementAmount
          ? _value.incrementAmount
          : incrementAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isReserveMet: null == isReserveMet
          ? _value.isReserveMet
          : isReserveMet // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionOver: null == isAuctionOver
          ? _value.isAuctionOver
          : isAuctionOver // ignore: cast_nullable_to_non_nullable
              as bool,
      currentWinningAddress: freezed == currentWinningAddress
          ? _value.currentWinningAddress
          : currentWinningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebAuctionCopyWith<$Res>
    implements $WebAuctionCopyWith<$Res> {
  factory _$$_WebAuctionCopyWith(
          _$_WebAuction value, $Res Function(_$_WebAuction) then) =
      __$$_WebAuctionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "current_bid_price") double? currentBidPrice,
      @JsonKey(name: "increment_amount") double incrementAmount,
      @JsonKey(name: "is_reserve_met") bool isReserveMet,
      @JsonKey(name: "is_auction_over") bool isAuctionOver,
      @JsonKey(name: "current_winning_address") String? currentWinningAddress});
}

/// @nodoc
class __$$_WebAuctionCopyWithImpl<$Res>
    extends _$WebAuctionCopyWithImpl<$Res, _$_WebAuction>
    implements _$$_WebAuctionCopyWith<$Res> {
  __$$_WebAuctionCopyWithImpl(
      _$_WebAuction _value, $Res Function(_$_WebAuction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currentBidPrice = freezed,
    Object? incrementAmount = null,
    Object? isReserveMet = null,
    Object? isAuctionOver = null,
    Object? currentWinningAddress = freezed,
  }) {
    return _then(_$_WebAuction(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currentBidPrice: freezed == currentBidPrice
          ? _value.currentBidPrice
          : currentBidPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      incrementAmount: null == incrementAmount
          ? _value.incrementAmount
          : incrementAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isReserveMet: null == isReserveMet
          ? _value.isReserveMet
          : isReserveMet // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuctionOver: null == isAuctionOver
          ? _value.isAuctionOver
          : isAuctionOver // ignore: cast_nullable_to_non_nullable
              as bool,
      currentWinningAddress: freezed == currentWinningAddress
          ? _value.currentWinningAddress
          : currentWinningAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebAuction extends _WebAuction {
  _$_WebAuction(
      {required this.id,
      @JsonKey(name: "current_bid_price") this.currentBidPrice,
      @JsonKey(name: "increment_amount") required this.incrementAmount,
      @JsonKey(name: "is_reserve_met") this.isReserveMet = false,
      @JsonKey(name: "is_auction_over") this.isAuctionOver = false,
      @JsonKey(name: "current_winning_address") this.currentWinningAddress})
      : super._();

  factory _$_WebAuction.fromJson(Map<String, dynamic> json) =>
      _$$_WebAuctionFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "current_bid_price")
  final double? currentBidPrice;
  @override
  @JsonKey(name: "increment_amount")
  final double incrementAmount;
  @override
  @JsonKey(name: "is_reserve_met")
  final bool isReserveMet;
  @override
  @JsonKey(name: "is_auction_over")
  final bool isAuctionOver;
  @override
  @JsonKey(name: "current_winning_address")
  final String? currentWinningAddress;

  @override
  String toString() {
    return 'WebAuction(id: $id, currentBidPrice: $currentBidPrice, incrementAmount: $incrementAmount, isReserveMet: $isReserveMet, isAuctionOver: $isAuctionOver, currentWinningAddress: $currentWinningAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebAuction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentBidPrice, currentBidPrice) ||
                other.currentBidPrice == currentBidPrice) &&
            (identical(other.incrementAmount, incrementAmount) ||
                other.incrementAmount == incrementAmount) &&
            (identical(other.isReserveMet, isReserveMet) ||
                other.isReserveMet == isReserveMet) &&
            (identical(other.isAuctionOver, isAuctionOver) ||
                other.isAuctionOver == isAuctionOver) &&
            (identical(other.currentWinningAddress, currentWinningAddress) ||
                other.currentWinningAddress == currentWinningAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, currentBidPrice,
      incrementAmount, isReserveMet, isAuctionOver, currentWinningAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebAuctionCopyWith<_$_WebAuction> get copyWith =>
      __$$_WebAuctionCopyWithImpl<_$_WebAuction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebAuctionToJson(
      this,
    );
  }
}

abstract class _WebAuction extends WebAuction {
  factory _WebAuction(
      {required final int id,
      @JsonKey(name: "current_bid_price")
          final double? currentBidPrice,
      @JsonKey(name: "increment_amount")
          required final double incrementAmount,
      @JsonKey(name: "is_reserve_met")
          final bool isReserveMet,
      @JsonKey(name: "is_auction_over")
          final bool isAuctionOver,
      @JsonKey(name: "current_winning_address")
          final String? currentWinningAddress}) = _$_WebAuction;
  _WebAuction._() : super._();

  factory _WebAuction.fromJson(Map<String, dynamic> json) =
      _$_WebAuction.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "current_bid_price")
  double? get currentBidPrice;
  @override
  @JsonKey(name: "increment_amount")
  double get incrementAmount;
  @override
  @JsonKey(name: "is_reserve_met")
  bool get isReserveMet;
  @override
  @JsonKey(name: "is_auction_over")
  bool get isAuctionOver;
  @override
  @JsonKey(name: "current_winning_address")
  String? get currentWinningAddress;
  @override
  @JsonKey(ignore: true)
  _$$_WebAuctionCopyWith<_$_WebAuction> get copyWith =>
      throw _privateConstructorUsedError;
}
