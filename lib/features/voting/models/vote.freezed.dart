// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  String get uid => throw _privateConstructorUsedError;
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
      _$VoteCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "TopicUID") String uid,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson) VoteType type,
      @JsonKey(name: "TransactionHash") String transactionHash,
      @JsonKey(name: "BlockHeight") int blockHeight});
}

/// @nodoc
class _$VoteCopyWithImpl<$Res> implements $VoteCopyWith<$Res> {
  _$VoteCopyWithImpl(this._value, this._then);

  final Vote _value;
  // ignore: unused_field
  final $Res Function(Vote) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? address = freezed,
    Object? type = freezed,
    Object? transactionHash = freezed,
    Object? blockHeight = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VoteType,
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: blockHeight == freezed
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_VoteCopyWith<$Res> implements $VoteCopyWith<$Res> {
  factory _$$_VoteCopyWith(_$_Vote value, $Res Function(_$_Vote) then) =
      __$$_VoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "TopicUID") String uid,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "VoteType", fromJson: voteTypeFromJson) VoteType type,
      @JsonKey(name: "TransactionHash") String transactionHash,
      @JsonKey(name: "BlockHeight") int blockHeight});
}

/// @nodoc
class __$$_VoteCopyWithImpl<$Res> extends _$VoteCopyWithImpl<$Res>
    implements _$$_VoteCopyWith<$Res> {
  __$$_VoteCopyWithImpl(_$_Vote _value, $Res Function(_$_Vote) _then)
      : super(_value, (v) => _then(v as _$_Vote));

  @override
  _$_Vote get _value => super._value as _$_Vote;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? address = freezed,
    Object? type = freezed,
    Object? transactionHash = freezed,
    Object? blockHeight = freezed,
  }) {
    return _then(_$_Vote(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VoteType,
      transactionHash: transactionHash == freezed
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: blockHeight == freezed
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
      @JsonKey(name: "TopicUID") required this.uid,
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
  final String uid;
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
    return 'Vote(id: $id, uid: $uid, address: $address, type: $type, transactionHash: $transactionHash, blockHeight: $blockHeight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vote &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.transactionHash, transactionHash) &&
            const DeepCollectionEquality()
                .equals(other.blockHeight, blockHeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(transactionHash),
      const DeepCollectionEquality().hash(blockHeight));

  @JsonKey(ignore: true)
  @override
  _$$_VoteCopyWith<_$_Vote> get copyWith =>
      __$$_VoteCopyWithImpl<_$_Vote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VoteToJson(this);
  }
}

abstract class _Vote extends Vote {
  factory _Vote(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "TopicUID")
          required final String uid,
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
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TopicUID")
  String get uid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "VoteType", fromJson: voteTypeFromJson)
  VoteType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "TransactionHash")
  String get transactionHash => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "BlockHeight")
  int get blockHeight => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_VoteCopyWith<_$_Vote> get copyWith => throw _privateConstructorUsedError;
}
