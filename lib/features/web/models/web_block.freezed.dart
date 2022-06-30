// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebBlock _$WebBlockFromJson(Map<String, dynamic> json) {
  return _WebBlock.fromJson(json);
}

/// @nodoc
class _$WebBlockTearOff {
  const _$WebBlockTearOff();

  _WebBlock call(
      {required int height,
      required int timestamp,
      required String hash,
      required String validator,
      @JsonKey(name: "total_amount")
          required double totalAmount,
      @JsonKey(name: "total_reward")
          required double totalReward,
      @JsonKey(name: "number_of_transactions")
          required int numberOfTransactions,
      required int size,
      @JsonKey(name: "craft_time")
          required int craftTime,
      @JsonKey(name: "prev_hash")
          required String prevHash}) {
    return _WebBlock(
      height: height,
      timestamp: timestamp,
      hash: hash,
      validator: validator,
      totalAmount: totalAmount,
      totalReward: totalReward,
      numberOfTransactions: numberOfTransactions,
      size: size,
      craftTime: craftTime,
      prevHash: prevHash,
    );
  }

  WebBlock fromJson(Map<String, Object?> json) {
    return WebBlock.fromJson(json);
  }
}

/// @nodoc
const $WebBlock = _$WebBlockTearOff();

/// @nodoc
mixin _$WebBlock {
  int get height => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get validator => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "total_reward")
  double get totalReward => throw _privateConstructorUsedError;
  @JsonKey(name: "number_of_transactions")
  int get numberOfTransactions => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: "craft_time")
  int get craftTime => throw _privateConstructorUsedError;
  @JsonKey(name: "prev_hash")
  String get prevHash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebBlockCopyWith<WebBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebBlockCopyWith<$Res> {
  factory $WebBlockCopyWith(WebBlock value, $Res Function(WebBlock) then) =
      _$WebBlockCopyWithImpl<$Res>;
  $Res call(
      {int height,
      int timestamp,
      String hash,
      String validator,
      @JsonKey(name: "total_amount") double totalAmount,
      @JsonKey(name: "total_reward") double totalReward,
      @JsonKey(name: "number_of_transactions") int numberOfTransactions,
      int size,
      @JsonKey(name: "craft_time") int craftTime,
      @JsonKey(name: "prev_hash") String prevHash});
}

/// @nodoc
class _$WebBlockCopyWithImpl<$Res> implements $WebBlockCopyWith<$Res> {
  _$WebBlockCopyWithImpl(this._value, this._then);

  final WebBlock _value;
  // ignore: unused_field
  final $Res Function(WebBlock) _then;

  @override
  $Res call({
    Object? height = freezed,
    Object? timestamp = freezed,
    Object? hash = freezed,
    Object? validator = freezed,
    Object? totalAmount = freezed,
    Object? totalReward = freezed,
    Object? numberOfTransactions = freezed,
    Object? size = freezed,
    Object? craftTime = freezed,
    Object? prevHash = freezed,
  }) {
    return _then(_value.copyWith(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: totalReward == freezed
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfTransactions: numberOfTransactions == freezed
          ? _value.numberOfTransactions
          : numberOfTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      craftTime: craftTime == freezed
          ? _value.craftTime
          : craftTime // ignore: cast_nullable_to_non_nullable
              as int,
      prevHash: prevHash == freezed
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WebBlockCopyWith<$Res> implements $WebBlockCopyWith<$Res> {
  factory _$WebBlockCopyWith(_WebBlock value, $Res Function(_WebBlock) then) =
      __$WebBlockCopyWithImpl<$Res>;
  @override
  $Res call(
      {int height,
      int timestamp,
      String hash,
      String validator,
      @JsonKey(name: "total_amount") double totalAmount,
      @JsonKey(name: "total_reward") double totalReward,
      @JsonKey(name: "number_of_transactions") int numberOfTransactions,
      int size,
      @JsonKey(name: "craft_time") int craftTime,
      @JsonKey(name: "prev_hash") String prevHash});
}

/// @nodoc
class __$WebBlockCopyWithImpl<$Res> extends _$WebBlockCopyWithImpl<$Res>
    implements _$WebBlockCopyWith<$Res> {
  __$WebBlockCopyWithImpl(_WebBlock _value, $Res Function(_WebBlock) _then)
      : super(_value, (v) => _then(v as _WebBlock));

  @override
  _WebBlock get _value => super._value as _WebBlock;

  @override
  $Res call({
    Object? height = freezed,
    Object? timestamp = freezed,
    Object? hash = freezed,
    Object? validator = freezed,
    Object? totalAmount = freezed,
    Object? totalReward = freezed,
    Object? numberOfTransactions = freezed,
    Object? size = freezed,
    Object? craftTime = freezed,
    Object? prevHash = freezed,
  }) {
    return _then(_WebBlock(
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      hash: hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: totalReward == freezed
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfTransactions: numberOfTransactions == freezed
          ? _value.numberOfTransactions
          : numberOfTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      craftTime: craftTime == freezed
          ? _value.craftTime
          : craftTime // ignore: cast_nullable_to_non_nullable
              as int,
      prevHash: prevHash == freezed
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebBlock extends _WebBlock {
  _$_WebBlock(
      {required this.height,
      required this.timestamp,
      required this.hash,
      required this.validator,
      @JsonKey(name: "total_amount")
          required this.totalAmount,
      @JsonKey(name: "total_reward")
          required this.totalReward,
      @JsonKey(name: "number_of_transactions")
          required this.numberOfTransactions,
      required this.size,
      @JsonKey(name: "craft_time")
          required this.craftTime,
      @JsonKey(name: "prev_hash")
          required this.prevHash})
      : super._();

  factory _$_WebBlock.fromJson(Map<String, dynamic> json) =>
      _$$_WebBlockFromJson(json);

  @override
  final int height;
  @override
  final int timestamp;
  @override
  final String hash;
  @override
  final String validator;
  @override
  @JsonKey(name: "total_amount")
  final double totalAmount;
  @override
  @JsonKey(name: "total_reward")
  final double totalReward;
  @override
  @JsonKey(name: "number_of_transactions")
  final int numberOfTransactions;
  @override
  final int size;
  @override
  @JsonKey(name: "craft_time")
  final int craftTime;
  @override
  @JsonKey(name: "prev_hash")
  final String prevHash;

  @override
  String toString() {
    return 'WebBlock(height: $height, timestamp: $timestamp, hash: $hash, validator: $validator, totalAmount: $totalAmount, totalReward: $totalReward, numberOfTransactions: $numberOfTransactions, size: $size, craftTime: $craftTime, prevHash: $prevHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WebBlock &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality().equals(other.validator, validator) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalReward, totalReward) &&
            const DeepCollectionEquality()
                .equals(other.numberOfTransactions, numberOfTransactions) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.craftTime, craftTime) &&
            const DeepCollectionEquality().equals(other.prevHash, prevHash));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(validator),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalReward),
      const DeepCollectionEquality().hash(numberOfTransactions),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(craftTime),
      const DeepCollectionEquality().hash(prevHash));

  @JsonKey(ignore: true)
  @override
  _$WebBlockCopyWith<_WebBlock> get copyWith =>
      __$WebBlockCopyWithImpl<_WebBlock>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebBlockToJson(this);
  }
}

abstract class _WebBlock extends WebBlock {
  factory _WebBlock(
      {required int height,
      required int timestamp,
      required String hash,
      required String validator,
      @JsonKey(name: "total_amount")
          required double totalAmount,
      @JsonKey(name: "total_reward")
          required double totalReward,
      @JsonKey(name: "number_of_transactions")
          required int numberOfTransactions,
      required int size,
      @JsonKey(name: "craft_time")
          required int craftTime,
      @JsonKey(name: "prev_hash")
          required String prevHash}) = _$_WebBlock;
  _WebBlock._() : super._();

  factory _WebBlock.fromJson(Map<String, dynamic> json) = _$_WebBlock.fromJson;

  @override
  int get height;
  @override
  int get timestamp;
  @override
  String get hash;
  @override
  String get validator;
  @override
  @JsonKey(name: "total_amount")
  double get totalAmount;
  @override
  @JsonKey(name: "total_reward")
  double get totalReward;
  @override
  @JsonKey(name: "number_of_transactions")
  int get numberOfTransactions;
  @override
  int get size;
  @override
  @JsonKey(name: "craft_time")
  int get craftTime;
  @override
  @JsonKey(name: "prev_hash")
  String get prevHash;
  @override
  @JsonKey(ignore: true)
  _$WebBlockCopyWith<_WebBlock> get copyWith =>
      throw _privateConstructorUsedError;
}
