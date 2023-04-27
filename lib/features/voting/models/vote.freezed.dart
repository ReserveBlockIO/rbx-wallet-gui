// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vote _$VoteFromJson(Map<String, dynamic> json) {
  return _Vote.fromJson(json);
}

/// @nodoc
mixin _$Vote {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicUID")
  String get topicUid => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
  VoteType get type => throw _privateConstructorUsedError;
  @JsonKey(name: "TransactionHash")
  String get transactionHash => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockHeight")
  int get blockHeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteCopyWith<Vote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteCopyWith<$Res> {
  factory $VoteCopyWith(Vote value, $Res Function(Vote) then) =
      _$VoteCopyWithImpl<$Res, Vote>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "TopicUID") String topicUid,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson) VoteType type,
      @JsonKey(name: "TransactionHash") String transactionHash,
      @JsonKey(name: "BlockHeight") int blockHeight});
}

/// @nodoc
class _$VoteCopyWithImpl<$Res, $Val extends Vote>
    implements $VoteCopyWith<$Res> {
  _$VoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topicUid = null,
    Object? address = null,
    Object? type = null,
    Object? transactionHash = null,
    Object? blockHeight = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VoteType,
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
abstract class _$$_VoteCopyWith<$Res> implements $VoteCopyWith<$Res> {
  factory _$$_VoteCopyWith(_$_Vote value, $Res Function(_$_Vote) then) =
      __$$_VoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "TopicUID") String topicUid,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson) VoteType type,
      @JsonKey(name: "TransactionHash") String transactionHash,
      @JsonKey(name: "BlockHeight") int blockHeight});
}

/// @nodoc
class __$$_VoteCopyWithImpl<$Res> extends _$VoteCopyWithImpl<$Res, _$_Vote>
    implements _$$_VoteCopyWith<$Res> {
  __$$_VoteCopyWithImpl(_$_Vote _value, $Res Function(_$_Vote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topicUid = null,
    Object? address = null,
    Object? type = null,
    Object? transactionHash = null,
    Object? blockHeight = null,
  }) {
    return _then(_$_Vote(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VoteType,
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
class _$_Vote extends _Vote {
  _$_Vote(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "TopicUID") required this.topicUid,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson) required this.type,
      @JsonKey(name: "TransactionHash") required this.transactionHash,
      @JsonKey(name: "BlockHeight") required this.blockHeight})
      : super._();

  factory _$_Vote.fromJson(Map<String, dynamic> json) => _$$_VoteFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "TopicUID")
  final String topicUid;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
  final VoteType type;
  @override
  @JsonKey(name: "TransactionHash")
  final String transactionHash;
  @override
  @JsonKey(name: "BlockHeight")
  final int blockHeight;

  @override
  String toString() {
    return 'Vote(id: $id, topicUid: $topicUid, address: $address, type: $type, transactionHash: $transactionHash, blockHeight: $blockHeight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vote &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topicUid, topicUid) ||
                other.topicUid == topicUid) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.transactionHash, transactionHash) ||
                other.transactionHash == transactionHash) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, topicUid, address, type, transactionHash, blockHeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoteCopyWith<_$_Vote> get copyWith =>
      __$$_VoteCopyWithImpl<_$_Vote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VoteToJson(
      this,
    );
  }
}

abstract class _Vote extends Vote {
  factory _Vote(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "TopicUID")
          required final String topicUid,
      @JsonKey(name: "Address")
          required final String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
          required final VoteType type,
      @JsonKey(name: "TransactionHash")
          required final String transactionHash,
      @JsonKey(name: "BlockHeight")
          required final int blockHeight}) = _$_Vote;
  _Vote._() : super._();

  factory _Vote.fromJson(Map<String, dynamic> json) = _$_Vote.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "TopicUID")
  String get topicUid;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
  VoteType get type;
  @override
  @JsonKey(name: "TransactionHash")
  String get transactionHash;
  @override
  @JsonKey(name: "BlockHeight")
  int get blockHeight;
  @override
  @JsonKey(ignore: true)
  _$$_VoteCopyWith<_$_Vote> get copyWith => throw _privateConstructorUsedError;
}
