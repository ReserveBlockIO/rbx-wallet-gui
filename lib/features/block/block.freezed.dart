// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$BlockCopyWithImpl<$Res, Block>;
  @useResult
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
class _$BlockCopyWithImpl<$Res, $Val extends Block>
    implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._value, this._then);

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
    Object? prevHash = null,
    Object? merkleRoot = null,
    Object? stateRoot = null,
    Object? validator = null,
    Object? validatorSignature = null,
    Object? validatorAnswer = null,
    Object? totalValidators = null,
    Object? version = null,
    Object? totalAmount = null,
    Object? totalReward = null,
    Object? numberOfTransactions = null,
    Object? size = null,
    Object? craftTime = null,
    Object? transactions = null,
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
      prevHash: null == prevHash
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
      merkleRoot: null == merkleRoot
          ? _value.merkleRoot
          : merkleRoot // ignore: cast_nullable_to_non_nullable
              as String,
      stateRoot: null == stateRoot
          ? _value.stateRoot
          : stateRoot // ignore: cast_nullable_to_non_nullable
              as String,
      validator: null == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String,
      validatorSignature: null == validatorSignature
          ? _value.validatorSignature
          : validatorSignature // ignore: cast_nullable_to_non_nullable
              as String,
      validatorAnswer: null == validatorAnswer
          ? _value.validatorAnswer
          : validatorAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      totalValidators: null == totalValidators
          ? _value.totalValidators
          : totalValidators // ignore: cast_nullable_to_non_nullable
              as int,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: null == totalReward
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfTransactions: null == numberOfTransactions
          ? _value.numberOfTransactions
          : numberOfTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      craftTime: null == craftTime
          ? _value.craftTime
          : craftTime // ignore: cast_nullable_to_non_nullable
              as int,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory _$$_BlockCopyWith(_$_Block value, $Res Function(_$_Block) then) =
      __$$_BlockCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_BlockCopyWithImpl<$Res> extends _$BlockCopyWithImpl<$Res, _$_Block>
    implements _$$_BlockCopyWith<$Res> {
  __$$_BlockCopyWithImpl(_$_Block _value, $Res Function(_$_Block) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? chainRefId = null,
    Object? timestamp = null,
    Object? hash = null,
    Object? prevHash = null,
    Object? merkleRoot = null,
    Object? stateRoot = null,
    Object? validator = null,
    Object? validatorSignature = null,
    Object? validatorAnswer = null,
    Object? totalValidators = null,
    Object? version = null,
    Object? totalAmount = null,
    Object? totalReward = null,
    Object? numberOfTransactions = null,
    Object? size = null,
    Object? craftTime = null,
    Object? transactions = null,
  }) {
    return _then(_$_Block(
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
      prevHash: null == prevHash
          ? _value.prevHash
          : prevHash // ignore: cast_nullable_to_non_nullable
              as String,
      merkleRoot: null == merkleRoot
          ? _value.merkleRoot
          : merkleRoot // ignore: cast_nullable_to_non_nullable
              as String,
      stateRoot: null == stateRoot
          ? _value.stateRoot
          : stateRoot // ignore: cast_nullable_to_non_nullable
              as String,
      validator: null == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String,
      validatorSignature: null == validatorSignature
          ? _value.validatorSignature
          : validatorSignature // ignore: cast_nullable_to_non_nullable
              as String,
      validatorAnswer: null == validatorAnswer
          ? _value.validatorAnswer
          : validatorAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      totalValidators: null == totalValidators
          ? _value.totalValidators
          : totalValidators // ignore: cast_nullable_to_non_nullable
              as int,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalReward: null == totalReward
          ? _value.totalReward
          : totalReward // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfTransactions: null == numberOfTransactions
          ? _value.numberOfTransactions
          : numberOfTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      craftTime: null == craftTime
          ? _value.craftTime
          : craftTime // ignore: cast_nullable_to_non_nullable
              as int,
      transactions: null == transactions
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
    if (_transactions is EqualUnmodifiableListView) return _transactions;
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
            (identical(other.height, height) || other.height == height) &&
            (identical(other.chainRefId, chainRefId) ||
                other.chainRefId == chainRefId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.prevHash, prevHash) ||
                other.prevHash == prevHash) &&
            (identical(other.merkleRoot, merkleRoot) ||
                other.merkleRoot == merkleRoot) &&
            (identical(other.stateRoot, stateRoot) ||
                other.stateRoot == stateRoot) &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.validatorSignature, validatorSignature) ||
                other.validatorSignature == validatorSignature) &&
            (identical(other.validatorAnswer, validatorAnswer) ||
                other.validatorAnswer == validatorAnswer) &&
            (identical(other.totalValidators, totalValidators) ||
                other.totalValidators == totalValidators) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalReward, totalReward) ||
                other.totalReward == totalReward) &&
            (identical(other.numberOfTransactions, numberOfTransactions) ||
                other.numberOfTransactions == numberOfTransactions) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.craftTime, craftTime) ||
                other.craftTime == craftTime) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      height,
      chainRefId,
      timestamp,
      hash,
      prevHash,
      merkleRoot,
      stateRoot,
      validator,
      validatorSignature,
      validatorAnswer,
      totalValidators,
      version,
      totalAmount,
      totalReward,
      numberOfTransactions,
      size,
      craftTime,
      const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockCopyWith<_$_Block> get copyWith =>
      __$$_BlockCopyWithImpl<_$_Block>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlockToJson(
      this,
    );
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
  int get height;
  @override
  @JsonKey(name: "ChainRefId")
  String get chainRefId;
  @override
  @JsonKey(name: "Timestamp")
  int get timestamp;
  @override
  @JsonKey(name: "Hash")
  String get hash;
  @override
  @JsonKey(name: "PrevHash")
  String get prevHash;
  @override
  @JsonKey(name: "MerkleRoot")
  String get merkleRoot;
  @override
  @JsonKey(name: "StateRoot")
  String get stateRoot;
  @override
  @JsonKey(name: "Validator")
  String get validator;
  @override
  @JsonKey(name: "ValidatorSignature")
  String get validatorSignature;
  @override
  @JsonKey(name: "ValidatorAnswer")
  String get validatorAnswer;
  @override
  @JsonKey(name: "TotalValidators")
  int get totalValidators;
  @override
  @JsonKey(name: "Version")
  int get version;
  @override
  @JsonKey(name: "TotalAmount")
  double get totalAmount;
  @override
  @JsonKey(name: "TotalReward")
  double get totalReward;
  @override
  @JsonKey(name: "NumOfTx")
  int get numberOfTransactions;
  @override
  @JsonKey(name: "Size")
  int get size;
  @override
  @JsonKey(name: "BCraftTime")
  int get craftTime;
  @override
  @JsonKey(name: "Transactions")
  List<Transaction> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$_BlockCopyWith<_$_Block> get copyWith =>
      throw _privateConstructorUsedError;
}
