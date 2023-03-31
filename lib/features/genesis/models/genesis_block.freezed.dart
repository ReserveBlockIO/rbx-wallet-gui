// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genesis_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenesisBlock _$GenesisBlockFromJson(Map<String, dynamic> json) {
  return _GenesisBlock.fromJson(json);
}

/// @nodoc
mixin _$GenesisBlock {
  @JsonKey(name: 'Height')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChainRefId')
  String get chainRefId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timestamp')
  int get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalAmount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalReward')
  double get totalReward => throw _privateConstructorUsedError;
  @JsonKey(name: 'Size')
  double get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'BCraftTime')
  int get bCraftTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenesisBlockCopyWith<GenesisBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenesisBlockCopyWith<$Res> {
  factory $GenesisBlockCopyWith(
          GenesisBlock value, $Res Function(GenesisBlock) then) =
      _$GenesisBlockCopyWithImpl<$Res, GenesisBlock>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Height') int height,
      @JsonKey(name: 'ChainRefId') String chainRefId,
      @JsonKey(name: 'Timestamp') int timestamp,
      @JsonKey(name: 'Hash') String hash,
      @JsonKey(name: 'TotalAmount') double totalAmount,
      @JsonKey(name: 'TotalReward') double totalReward,
      @JsonKey(name: 'Size') double size,
      @JsonKey(name: 'BCraftTime') int bCraftTime});
}

/// @nodoc
class _$GenesisBlockCopyWithImpl<$Res, $Val extends GenesisBlock>
    implements $GenesisBlockCopyWith<$Res> {
  _$GenesisBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? chainRefId = null,
    Object? timestamp = null,
    Object? hash = null,
    Object? totalAmount = null,
    Object? totalReward = null,
    Object? size = null,
    Object? bCraftTime = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      chainRefId: null == chainRefId
          ? _value.chainRefId
          : chainRefId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: null == totalReward
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      bCraftTime: null == bCraftTime
          ? _value.bCraftTime
          : bCraftTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenesisBlockCopyWith<$Res>
    implements $GenesisBlockCopyWith<$Res> {
  factory _$$_GenesisBlockCopyWith(
          _$_GenesisBlock value, $Res Function(_$_GenesisBlock) then) =
      __$$_GenesisBlockCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Height') int height,
      @JsonKey(name: 'ChainRefId') String chainRefId,
      @JsonKey(name: 'Timestamp') int timestamp,
      @JsonKey(name: 'Hash') String hash,
      @JsonKey(name: 'TotalAmount') double totalAmount,
      @JsonKey(name: 'TotalReward') double totalReward,
      @JsonKey(name: 'Size') double size,
      @JsonKey(name: 'BCraftTime') int bCraftTime});
}

/// @nodoc
class __$$_GenesisBlockCopyWithImpl<$Res>
    extends _$GenesisBlockCopyWithImpl<$Res, _$_GenesisBlock>
    implements _$$_GenesisBlockCopyWith<$Res> {
  __$$_GenesisBlockCopyWithImpl(
      _$_GenesisBlock _value, $Res Function(_$_GenesisBlock) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? chainRefId = null,
    Object? timestamp = null,
    Object? hash = null,
    Object? totalAmount = null,
    Object? totalReward = null,
    Object? size = null,
    Object? bCraftTime = null,
  }) {
    return _then(_$_GenesisBlock(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      chainRefId: null == chainRefId
          ? _value.chainRefId
          : chainRefId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: null == totalReward
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      bCraftTime: null == bCraftTime
          ? _value.bCraftTime
          : bCraftTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenesisBlock extends _GenesisBlock {
  _$_GenesisBlock(
      {@JsonKey(name: 'Height') required this.height,
      @JsonKey(name: 'ChainRefId') required this.chainRefId,
      @JsonKey(name: 'Timestamp') required this.timestamp,
      @JsonKey(name: 'Hash') required this.hash,
      @JsonKey(name: 'TotalAmount') required this.totalAmount,
      @JsonKey(name: 'TotalReward') required this.totalReward,
      @JsonKey(name: 'Size') required this.size,
      @JsonKey(name: 'BCraftTime') required this.bCraftTime})
      : super._();

  factory _$_GenesisBlock.fromJson(Map<String, dynamic> json) =>
      _$$_GenesisBlockFromJson(json);

  @override
  @JsonKey(name: 'Height')
  final int height;
  @override
  @JsonKey(name: 'ChainRefId')
  final String chainRefId;
  @override
  @JsonKey(name: 'Timestamp')
  final int timestamp;
  @override
  @JsonKey(name: 'Hash')
  final String hash;
  @override
  @JsonKey(name: 'TotalAmount')
  final double totalAmount;
  @override
  @JsonKey(name: 'TotalReward')
  final double totalReward;
  @override
  @JsonKey(name: 'Size')
  final double size;
  @override
  @JsonKey(name: 'BCraftTime')
  final int bCraftTime;

  @override
  String toString() {
    return 'GenesisBlock(height: $height, chainRefId: $chainRefId, timestamp: $timestamp, hash: $hash, totalAmount: $totalAmount, totalReward: $totalReward, size: $size, bCraftTime: $bCraftTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenesisBlock &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.chainRefId, chainRefId) ||
                other.chainRefId == chainRefId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalReward, totalReward) ||
                other.totalReward == totalReward) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.bCraftTime, bCraftTime) ||
                other.bCraftTime == bCraftTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, height, chainRefId, timestamp,
      hash, totalAmount, totalReward, size, bCraftTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenesisBlockCopyWith<_$_GenesisBlock> get copyWith =>
      __$$_GenesisBlockCopyWithImpl<_$_GenesisBlock>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenesisBlockToJson(
      this,
    );
  }
}

abstract class _GenesisBlock extends GenesisBlock {
  factory _GenesisBlock(
          {@JsonKey(name: 'Height') required final int height,
          @JsonKey(name: 'ChainRefId') required final String chainRefId,
          @JsonKey(name: 'Timestamp') required final int timestamp,
          @JsonKey(name: 'Hash') required final String hash,
          @JsonKey(name: 'TotalAmount') required final double totalAmount,
          @JsonKey(name: 'TotalReward') required final double totalReward,
          @JsonKey(name: 'Size') required final double size,
          @JsonKey(name: 'BCraftTime') required final int bCraftTime}) =
      _$_GenesisBlock;
  _GenesisBlock._() : super._();

  factory _GenesisBlock.fromJson(Map<String, dynamic> json) =
      _$_GenesisBlock.fromJson;

  @override
  @JsonKey(name: 'Height')
  int get height;
  @override
  @JsonKey(name: 'ChainRefId')
  String get chainRefId;
  @override
  @JsonKey(name: 'Timestamp')
  int get timestamp;
  @override
  @JsonKey(name: 'Hash')
  String get hash;
  @override
  @JsonKey(name: 'TotalAmount')
  double get totalAmount;
  @override
  @JsonKey(name: 'TotalReward')
  double get totalReward;
  @override
  @JsonKey(name: 'Size')
  double get size;
  @override
  @JsonKey(name: 'BCraftTime')
  int get bCraftTime;
  @override
  @JsonKey(ignore: true)
  _$$_GenesisBlockCopyWith<_$_GenesisBlock> get copyWith =>
      throw _privateConstructorUsedError;
}
