// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenVote _$TokenVoteFromJson(Map<String, dynamic> json) {
  return _TokenVote.fromJson(json);
}

/// @nodoc
mixin _$TokenVote {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicUID")
  String get topicUid => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
  TokenVoteType get voteType => throw _privateConstructorUsedError;
  @JsonKey(name: "TransactionHash")
  String get transactionHash => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockHeight")
  int get blockHeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenVoteCopyWith<TokenVote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenVoteCopyWith<$Res> {
  factory $TokenVoteCopyWith(TokenVote value, $Res Function(TokenVote) then) =
      _$TokenVoteCopyWithImpl<$Res, TokenVote>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id")
          int id,
      @JsonKey(name: "SmartContractUID")
          String smartContractUid,
      @JsonKey(name: "TopicUID")
          String topicUid,
      @JsonKey(name: "Address")
          String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
          TokenVoteType voteType,
      @JsonKey(name: "TransactionHash")
          String transactionHash,
      @JsonKey(name: "BlockHeight")
          int blockHeight});
}

/// @nodoc
class _$TokenVoteCopyWithImpl<$Res, $Val extends TokenVote>
    implements $TokenVoteCopyWith<$Res> {
  _$TokenVoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? address = null,
    Object? voteType = null,
    Object? transactionHash = null,
    Object? blockHeight = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      voteType: null == voteType
          ? _value.voteType
          : voteType // ignore: cast_nullable_to_non_nullable
              as TokenVoteType,
      transactionHash: null == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenVoteCopyWith<$Res> implements $TokenVoteCopyWith<$Res> {
  factory _$$_TokenVoteCopyWith(
          _$_TokenVote value, $Res Function(_$_TokenVote) then) =
      __$$_TokenVoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id")
          int id,
      @JsonKey(name: "SmartContractUID")
          String smartContractUid,
      @JsonKey(name: "TopicUID")
          String topicUid,
      @JsonKey(name: "Address")
          String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
          TokenVoteType voteType,
      @JsonKey(name: "TransactionHash")
          String transactionHash,
      @JsonKey(name: "BlockHeight")
          int blockHeight});
}

/// @nodoc
class __$$_TokenVoteCopyWithImpl<$Res>
    extends _$TokenVoteCopyWithImpl<$Res, _$_TokenVote>
    implements _$$_TokenVoteCopyWith<$Res> {
  __$$_TokenVoteCopyWithImpl(
      _$_TokenVote _value, $Res Function(_$_TokenVote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? address = null,
    Object? voteType = null,
    Object? transactionHash = null,
    Object? blockHeight = null,
  }) {
    return _then(_$_TokenVote(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      voteType: null == voteType
          ? _value.voteType
          : voteType // ignore: cast_nullable_to_non_nullable
              as TokenVoteType,
      transactionHash: null == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenVote extends _TokenVote {
  const _$_TokenVote(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "SmartContractUID")
          required this.smartContractUid,
      @JsonKey(name: "TopicUID")
          required this.topicUid,
      @JsonKey(name: "Address")
          required this.address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
          required this.voteType,
      @JsonKey(name: "TransactionHash")
          required this.transactionHash,
      @JsonKey(name: "BlockHeight")
          required this.blockHeight})
      : super._();

  factory _$_TokenVote.fromJson(Map<String, dynamic> json) =>
      _$$_TokenVoteFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractUid;
  @override
  @JsonKey(name: "TopicUID")
  final String topicUid;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
  final TokenVoteType voteType;
  @override
  @JsonKey(name: "TransactionHash")
  final String transactionHash;
  @override
  @JsonKey(name: "BlockHeight")
  final int blockHeight;

  @override
  String toString() {
    return 'TokenVote(id: $id, smartContractUid: $smartContractUid, topicUid: $topicUid, address: $address, voteType: $voteType, transactionHash: $transactionHash, blockHeight: $blockHeight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenVote &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.topicUid, topicUid) ||
                other.topicUid == topicUid) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.voteType, voteType) ||
                other.voteType == voteType) &&
            (identical(other.transactionHash, transactionHash) ||
                other.transactionHash == transactionHash) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, smartContractUid, topicUid,
      address, voteType, transactionHash, blockHeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenVoteCopyWith<_$_TokenVote> get copyWith =>
      __$$_TokenVoteCopyWithImpl<_$_TokenVote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenVoteToJson(
      this,
    );
  }
}

abstract class _TokenVote extends TokenVote {
  const factory _TokenVote(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "SmartContractUID")
          required final String smartContractUid,
      @JsonKey(name: "TopicUID")
          required final String topicUid,
      @JsonKey(name: "Address")
          required final String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
          required final TokenVoteType voteType,
      @JsonKey(name: "TransactionHash")
          required final String transactionHash,
      @JsonKey(name: "BlockHeight")
          required final int blockHeight}) = _$_TokenVote;
  const _TokenVote._() : super._();

  factory _TokenVote.fromJson(Map<String, dynamic> json) =
      _$_TokenVote.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid;
  @override
  @JsonKey(name: "TopicUID")
  String get topicUid;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
  TokenVoteType get voteType;
  @override
  @JsonKey(name: "TransactionHash")
  String get transactionHash;
  @override
  @JsonKey(name: "BlockHeight")
  int get blockHeight;
  @override
  @JsonKey(ignore: true)
  _$$_TokenVoteCopyWith<_$_TokenVote> get copyWith =>
      throw _privateConstructorUsedError;
}
