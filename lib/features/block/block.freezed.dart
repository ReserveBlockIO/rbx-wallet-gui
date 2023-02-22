// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Block _$BlockFromJson(Map<String, dynamic> json) {
  return _Block.fromJson(json);
}

/// @nodoc
mixin _$Block {
  @JsonKey(name: "Height")
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: "ChainRefId")
  String get chainRefId => throw _privateConstructorUsedError;
  @JsonKey(name: "Timestamp")
  int get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: "Hash")
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: "PrevHash")
  String get prevHash => throw _privateConstructorUsedError;
  @JsonKey(name: "MerkleRoot")
  String get merkleRoot => throw _privateConstructorUsedError;
  @JsonKey(name: "StateRoot")
  String get stateRoot => throw _privateConstructorUsedError;
  @JsonKey(name: "Validator")
  String get validator => throw _privateConstructorUsedError;
  @JsonKey(name: "ValidatorSignature")
  String get validatorSignature => throw _privateConstructorUsedError;
  @JsonKey(name: "ValidatorAnswer")
  String get validatorAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalValidators")
  int get totalValidators => throw _privateConstructorUsedError;
  @JsonKey(name: "Version")
  int get version => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalAmount")
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalReward")
  double get totalReward => throw _privateConstructorUsedError;
  @JsonKey(name: "NumOfTx")
  int get numberOfTransactions => throw _privateConstructorUsedError;
  @JsonKey(name: "Size")
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: "BCraftTime")
  int get craftTime => throw _privateConstructorUsedError;
  @JsonKey(name: "Transactions")
  List<Transaction> get transactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockCopyWith<Block> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockCopyWith<$Res> {
  factory $BlockCopyWith(Block value, $Res Function(Block) then) =
      _$BlockCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Height") int height,
      @JsonKey(name: "ChainRefId") String chainRefId,
      @JsonKey(name: "Timestamp") int timestamp,
      @JsonKey(name: "Hash") String hash,
      @JsonKey(name: "PrevHash") String prevHash,
      @JsonKey(name: "MerkleRoot") String merkleRoot,
      @JsonKey(name: "StateRoot") String stateRoot,
      @JsonKey(name: "Validator") String validator,
      @JsonKey(name: "ValidatorSignature") String validatorSignature,
      @JsonKey(name: "ValidatorAnswer") String validatorAnswer,
      @JsonKey(name: "TotalValidators") int totalValidators,
      @JsonKey(name: "Version") int version,
      @JsonKey(name: "TotalAmount") double totalAmount,
      @JsonKey(name: "TotalReward") double totalReward,
      @JsonKey(name: "NumOfTx") int numberOfTransactions,
      @JsonKey(name: "Size") int size,
      @JsonKey(name: "BCraftTime") int craftTime,
      @JsonKey(name: "Transactions") List<Transaction> transactions});
}

/// @nodoc
class _$BlockCopyWithImpl<$Res> implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._value, this._then);

  final Block _value;
  // ignore: unused_field
  final $Res Function(Block) _then;

  @override
  $Res call({
    Object? height = freezed,
    Object? chainRefId = freezed,
    Object? timestamp = freezed,
    Object? hash = freezed,
    Object? prevHash = freezed,
    Object? merkleRoot = freezed,
    Object? stateRoot = freezed,
    Object? validator = freezed,
    Object? validatorSignature = freezed,
    Object? validatorAnswer = freezed,
    Object? totalValidators = freezed,
    Object? version = freezed,
    Object? totalAmount = freezed,
    Object? totalReward = freezed,
    Object? numberOfTransactions = freezed,
    Object? size = freezed,
    Object? craftTime = freezed,
    Object? transactions = freezed,
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
      prevHash: prevHash == freezed
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
      merkleRoot: merkleRoot == freezed
          ? _value.merkleRoot
          : merkleRoot // ignore: cast_nullable_to_non_nullable
              as String,
      stateRoot: stateRoot == freezed
          ? _value.stateRoot
          : stateRoot // ignore: cast_nullable_to_non_nullable
              as String,
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String,
      validatorSignature: validatorSignature == freezed
          ? _value.validatorSignature
          : validatorSignature // ignore: cast_nullable_to_non_nullable
              as String,
      validatorAnswer: validatorAnswer == freezed
          ? _value.validatorAnswer
          : validatorAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      totalValidators: totalValidators == freezed
          ? _value.totalValidators
          : totalValidators // ignore: cast_nullable_to_non_nullable
              as int,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
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
      transactions: transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
abstract class _$$_BlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory _$$_BlockCopyWith(_$_Block value, $Res Function(_$_Block) then) =
      __$$_BlockCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Height") int height,
      @JsonKey(name: "ChainRefId") String chainRefId,
      @JsonKey(name: "Timestamp") int timestamp,
      @JsonKey(name: "Hash") String hash,
      @JsonKey(name: "PrevHash") String prevHash,
      @JsonKey(name: "MerkleRoot") String merkleRoot,
      @JsonKey(name: "StateRoot") String stateRoot,
      @JsonKey(name: "Validator") String validator,
      @JsonKey(name: "ValidatorSignature") String validatorSignature,
      @JsonKey(name: "ValidatorAnswer") String validatorAnswer,
      @JsonKey(name: "TotalValidators") int totalValidators,
      @JsonKey(name: "Version") int version,
      @JsonKey(name: "TotalAmount") double totalAmount,
      @JsonKey(name: "TotalReward") double totalReward,
      @JsonKey(name: "NumOfTx") int numberOfTransactions,
      @JsonKey(name: "Size") int size,
      @JsonKey(name: "BCraftTime") int craftTime,
      @JsonKey(name: "Transactions") List<Transaction> transactions});
}

/// @nodoc
class __$$_BlockCopyWithImpl<$Res> extends _$BlockCopyWithImpl<$Res>
    implements _$$_BlockCopyWith<$Res> {
  __$$_BlockCopyWithImpl(_$_Block _value, $Res Function(_$_Block) _then)
      : super(_value, (v) => _then(v as _$_Block));

  @override
  _$_Block get _value => super._value as _$_Block;

  @override
  $Res call({
    Object? height = freezed,
    Object? chainRefId = freezed,
    Object? timestamp = freezed,
    Object? hash = freezed,
    Object? prevHash = freezed,
    Object? merkleRoot = freezed,
    Object? stateRoot = freezed,
    Object? validator = freezed,
    Object? validatorSignature = freezed,
    Object? validatorAnswer = freezed,
    Object? totalValidators = freezed,
    Object? version = freezed,
    Object? totalAmount = freezed,
    Object? totalReward = freezed,
    Object? numberOfTransactions = freezed,
    Object? size = freezed,
    Object? craftTime = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_$_Block(
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
      prevHash: prevHash == freezed
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
      merkleRoot: merkleRoot == freezed
          ? _value.merkleRoot
          : merkleRoot // ignore: cast_nullable_to_non_nullable
              as String,
      stateRoot: stateRoot == freezed
          ? _value.stateRoot
          : stateRoot // ignore: cast_nullable_to_non_nullable
              as String,
      validator: validator == freezed
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String,
      validatorSignature: validatorSignature == freezed
          ? _value.validatorSignature
          : validatorSignature // ignore: cast_nullable_to_non_nullable
              as String,
      validatorAnswer: validatorAnswer == freezed
          ? _value.validatorAnswer
          : validatorAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      totalValidators: totalValidators == freezed
          ? _value.totalValidators
          : totalValidators // ignore: cast_nullable_to_non_nullable
              as int,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
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
      transactions: transactions == freezed
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Block extends _Block {
  _$_Block(
      {@JsonKey(name: "Height")
          required this.height,
      @JsonKey(name: "ChainRefId")
          required this.chainRefId,
      @JsonKey(name: "Timestamp")
          required this.timestamp,
      @JsonKey(name: "Hash")
          required this.hash,
      @JsonKey(name: "PrevHash")
          required this.prevHash,
      @JsonKey(name: "MerkleRoot")
          required this.merkleRoot,
      @JsonKey(name: "StateRoot")
          required this.stateRoot,
      @JsonKey(name: "Validator")
          required this.validator,
      @JsonKey(name: "ValidatorSignature")
          required this.validatorSignature,
      @JsonKey(name: "ValidatorAnswer")
          required this.validatorAnswer,
      @JsonKey(name: "TotalValidators")
          required this.totalValidators,
      @JsonKey(name: "Version")
          required this.version,
      @JsonKey(name: "TotalAmount")
          required this.totalAmount,
      @JsonKey(name: "TotalReward")
          required this.totalReward,
      @JsonKey(name: "NumOfTx")
          required this.numberOfTransactions,
      @JsonKey(name: "Size")
          required this.size,
      @JsonKey(name: "BCraftTime")
          required this.craftTime,
      @JsonKey(name: "Transactions")
          required final List<Transaction> transactions})
      : _transactions = transactions,
        super._();

  factory _$_Block.fromJson(Map<String, dynamic> json) =>
      _$$_BlockFromJson(json);

  @override
  @JsonKey(name: "Height")
  final int height;
  @override
  @JsonKey(name: "ChainRefId")
  final String chainRefId;
  @override
  @JsonKey(name: "Timestamp")
  final int timestamp;
  @override
  @JsonKey(name: "Hash")
  final String hash;
  @override
  @JsonKey(name: "PrevHash")
  final String prevHash;
  @override
  @JsonKey(name: "MerkleRoot")
  final String merkleRoot;
  @override
  @JsonKey(name: "StateRoot")
  final String stateRoot;
  @override
  @JsonKey(name: "Validator")
  final String validator;
  @override
  @JsonKey(name: "ValidatorSignature")
  final String validatorSignature;
  @override
  @JsonKey(name: "ValidatorAnswer")
  final String validatorAnswer;
  @override
  @JsonKey(name: "TotalValidators")
  final int totalValidators;
  @override
  @JsonKey(name: "Version")
  final int version;
  @override
  @JsonKey(name: "TotalAmount")
  final double totalAmount;
  @override
  @JsonKey(name: "TotalReward")
  final double totalReward;
  @override
  @JsonKey(name: "NumOfTx")
  final int numberOfTransactions;
  @override
  @JsonKey(name: "Size")
  final int size;
  @override
  @JsonKey(name: "BCraftTime")
  final int craftTime;
  final List<Transaction> _transactions;
  @override
  @JsonKey(name: "Transactions")
  List<Transaction> get transactions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'Block(height: $height, chainRefId: $chainRefId, timestamp: $timestamp, hash: $hash, prevHash: $prevHash, merkleRoot: $merkleRoot, stateRoot: $stateRoot, validator: $validator, validatorSignature: $validatorSignature, validatorAnswer: $validatorAnswer, totalValidators: $totalValidators, version: $version, totalAmount: $totalAmount, totalReward: $totalReward, numberOfTransactions: $numberOfTransactions, size: $size, craftTime: $craftTime, transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Block &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality()
                .equals(other.chainRefId, chainRefId) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.hash, hash) &&
            const DeepCollectionEquality().equals(other.prevHash, prevHash) &&
            const DeepCollectionEquality()
                .equals(other.merkleRoot, merkleRoot) &&
            const DeepCollectionEquality().equals(other.stateRoot, stateRoot) &&
            const DeepCollectionEquality().equals(other.validator, validator) &&
            const DeepCollectionEquality()
                .equals(other.validatorSignature, validatorSignature) &&
            const DeepCollectionEquality()
                .equals(other.validatorAnswer, validatorAnswer) &&
            const DeepCollectionEquality()
                .equals(other.totalValidators, totalValidators) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalReward, totalReward) &&
            const DeepCollectionEquality()
                .equals(other.numberOfTransactions, numberOfTransactions) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.craftTime, craftTime) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(chainRefId),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(hash),
      const DeepCollectionEquality().hash(prevHash),
      const DeepCollectionEquality().hash(merkleRoot),
      const DeepCollectionEquality().hash(stateRoot),
      const DeepCollectionEquality().hash(validator),
      const DeepCollectionEquality().hash(validatorSignature),
      const DeepCollectionEquality().hash(validatorAnswer),
      const DeepCollectionEquality().hash(totalValidators),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(totalReward),
      const DeepCollectionEquality().hash(numberOfTransactions),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(craftTime),
      const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  _$$_BlockCopyWith<_$_Block> get copyWith =>
      __$$_BlockCopyWithImpl<_$_Block>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlockToJson(this);
  }
}

abstract class _Block extends Block {
  factory _Block(
      {@JsonKey(name: "Height")
          required final int height,
      @JsonKey(name: "ChainRefId")
          required final String chainRefId,
      @JsonKey(name: "Timestamp")
          required final int timestamp,
      @JsonKey(name: "Hash")
          required final String hash,
      @JsonKey(name: "PrevHash")
          required final String prevHash,
      @JsonKey(name: "MerkleRoot")
          required final String merkleRoot,
      @JsonKey(name: "StateRoot")
          required final String stateRoot,
      @JsonKey(name: "Validator")
          required final String validator,
      @JsonKey(name: "ValidatorSignature")
          required final String validatorSignature,
      @JsonKey(name: "ValidatorAnswer")
          required final String validatorAnswer,
      @JsonKey(name: "TotalValidators")
          required final int totalValidators,
      @JsonKey(name: "Version")
          required final int version,
      @JsonKey(name: "TotalAmount")
          required final double totalAmount,
      @JsonKey(name: "TotalReward")
          required final double totalReward,
      @JsonKey(name: "NumOfTx")
          required final int numberOfTransactions,
      @JsonKey(name: "Size")
          required final int size,
      @JsonKey(name: "BCraftTime")
          required final int craftTime,
      @JsonKey(name: "Transactions")
          required final List<Transaction> transactions}) = _$_Block;
  _Block._() : super._();

  factory _Block.fromJson(Map<String, dynamic> json) = _$_Block.fromJson;

  @override
  @JsonKey(name: "Height")
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ChainRefId")
  String get chainRefId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Timestamp")
  int get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Hash")
  String get hash => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "PrevHash")
  String get prevHash => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "MerkleRoot")
  String get merkleRoot => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "StateRoot")
  String get stateRoot => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Validator")
  String get validator => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ValidatorSignature")
  String get validatorSignature => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "ValidatorAnswer")
  String get validatorAnswer => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TotalValidators")
  int get totalValidators => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Version")
  int get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TotalAmount")
  double get totalAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TotalReward")
  double get totalReward => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "NumOfTx")
  int get numberOfTransactions => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Size")
  int get size => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "BCraftTime")
  int get craftTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Transactions")
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BlockCopyWith<_$_Block> get copyWith =>
      throw _privateConstructorUsedError;
}
