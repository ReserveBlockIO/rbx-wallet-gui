// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genesis_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenesisBlock _$GenesisBlockFromJson(Map<String, dynamic> json) {
  return _GenesisBlock.fromJson(json);
}

/// @nodoc
class _$GenesisBlockTearOff {
  const _$GenesisBlockTearOff();

  _GenesisBlock call(
      {@JsonKey(name: 'Height') required int height,
      @JsonKey(name: 'ChainRefId') required String chainRefId,
      @JsonKey(name: 'Timestamp') required int timestamp,
      @JsonKey(name: 'Hash') required String hash,
      @JsonKey(name: 'TotalAmount') required double totalAmount,
      @JsonKey(name: 'TotalReward') required double totalReward,
      @JsonKey(name: 'Size') required double size,
      @JsonKey(name: 'BCraftTime') required int bCraftTime}) {
    return _GenesisBlock(
      height: height,
      chainRefId: chainRefId,
      timestamp: timestamp,
      hash: hash,
      totalAmount: totalAmount,
      totalReward: totalReward,
      size: size,
      bCraftTime: bCraftTime,
    );
  }

  GenesisBlock fromJson(Map<String, Object?> json) {
    return GenesisBlock.fromJson(json);
  }
}

/// @nodoc
const $GenesisBlock = _$GenesisBlockTearOff();

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
      _$GenesisBlockCopyWithImpl<$Res>;
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
class _$GenesisBlockCopyWithImpl<$Res> implements $GenesisBlockCopyWith<$Res> {
  _$GenesisBlockCopyWithImpl(this._value, this._then);

  final GenesisBlock _value;
  // ignore: unused_field
  final $Res Function(GenesisBlock) _then;

  @override
  $Res call({
    Object? height = freezed,
    Object? chainRefId = freezed,
    Object? timestamp = freezed,
    Object? hash = freezed,
    Object? totalAmount = freezed,
    Object? totalReward = freezed,
    Object? size = freezed,
    Object? bCraftTime = freezed,
  }) {
    return _then(_value.copyWith(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      chainRefId: chainRefId == freezed
          ? _value.chainRefId
          : chainRefId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: totalReward == freezed
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      bCraftTime: bCraftTime == freezed
          ? _value.bCraftTime
          : bCraftTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GenesisBlockCopyWith<$Res>
    implements $GenesisBlockCopyWith<$Res> {
  factory _$GenesisBlockCopyWith(
          _GenesisBlock value, $Res Function(_GenesisBlock) then) =
      __$GenesisBlockCopyWithImpl<$Res>;
  @override
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
class __$GenesisBlockCopyWithImpl<$Res> extends _$GenesisBlockCopyWithImpl<$Res>
    implements _$GenesisBlockCopyWith<$Res> {
  __$GenesisBlockCopyWithImpl(
      _GenesisBlock _value, $Res Function(_GenesisBlock) _then)
      : super(_value, (v) => _then(v as _GenesisBlock));

  @override
  _GenesisBlock get _value => super._value as _GenesisBlock;

  @override
  $Res call({
    Object? height = freezed,
    Object? chainRefId = freezed,
    Object? timestamp = freezed,
    Object? hash = freezed,
    Object? totalAmount = freezed,
    Object? totalReward = freezed,
    Object? size = freezed,
    Object? bCraftTime = freezed,
  }) {
    return _then(_GenesisBlock(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      chainRefId: chainRefId == freezed
          ? _value.chainRefId
          : chainRefId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: totalReward == freezed
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      bCraftTime: bCraftTime == freezed
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
            other is _GenesisBlock &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality()
                .equals(other.chainRefId, chainRefId) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalReward, totalReward) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality()
                .equals(other.bCraftTime, bCraftTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(chainRefId),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalReward),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(bCraftTime));

  @JsonKey(ignore: true)
  @override
  _$GenesisBlockCopyWith<_GenesisBlock> get copyWith =>
      __$GenesisBlockCopyWithImpl<_GenesisBlock>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenesisBlockToJson(this);
  }
}

abstract class _GenesisBlock extends GenesisBlock {
  factory _GenesisBlock(
      {@JsonKey(name: 'Height') required int height,
      @JsonKey(name: 'ChainRefId') required String chainRefId,
      @JsonKey(name: 'Timestamp') required int timestamp,
      @JsonKey(name: 'Hash') required String hash,
      @JsonKey(name: 'TotalAmount') required double totalAmount,
      @JsonKey(name: 'TotalReward') required double totalReward,
      @JsonKey(name: 'Size') required double size,
      @JsonKey(name: 'BCraftTime') required int bCraftTime}) = _$_GenesisBlock;
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
  _$GenesisBlockCopyWith<_GenesisBlock> get copyWith =>
      throw _privateConstructorUsedError;
}
