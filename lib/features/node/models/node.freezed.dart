// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Node _$NodeFromJson(Map<String, dynamic> json) {
  return _Node.fromJson(json);
}

/// @nodoc
class _$NodeTearOff {
  const _$NodeTearOff();

  _Node call(
      {@JsonKey(name: 'Id') required int id,
      @JsonKey(name: 'Address') required String address,
      @JsonKey(name: 'UniqueName') required String uniqueName,
      @JsonKey(name: 'Position') required int position,
      @JsonKey(name: 'Amount') required double amount,
      @JsonKey(name: 'Signature') required String signature,
      @JsonKey(name: 'IsActive') required bool isActive,
      @JsonKey(name: 'FailCount') required int failCount,
      @JsonKey(name: 'NodeIP') required String nodeIp,
      @JsonKey(name: 'NodeReferenceId') required String nodeReferenceId}) {
    return _Node(
      id: id,
      address: address,
      uniqueName: uniqueName,
      position: position,
      amount: amount,
      signature: signature,
      isActive: isActive,
      failCount: failCount,
      nodeIp: nodeIp,
      nodeReferenceId: nodeReferenceId,
    );
  }

  Node fromJson(Map<String, Object?> json) {
    return Node.fromJson(json);
  }
}

/// @nodoc
const $Node = _$NodeTearOff();

/// @nodoc
mixin _$Node {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'UniqueName')
  String get uniqueName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Position')
  int get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'Amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Signature')
  String get signature => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'FailCount')
  int get failCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'NodeIP')
  String get nodeIp => throw _privateConstructorUsedError;
  @JsonKey(name: 'NodeReferenceId')
  String get nodeReferenceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'Address') String address,
      @JsonKey(name: 'UniqueName') String uniqueName,
      @JsonKey(name: 'Position') int position,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'Signature') String signature,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'FailCount') int failCount,
      @JsonKey(name: 'NodeIP') String nodeIp,
      @JsonKey(name: 'NodeReferenceId') String nodeReferenceId});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res> implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  final Node _value;
  // ignore: unused_field
  final $Res Function(Node) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? uniqueName = freezed,
    Object? position = freezed,
    Object? amount = freezed,
    Object? signature = freezed,
    Object? isActive = freezed,
    Object? failCount = freezed,
    Object? nodeIp = freezed,
    Object? nodeReferenceId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueName: uniqueName == freezed
          ? _value.uniqueName
          : uniqueName // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      failCount: failCount == freezed
          ? _value.failCount
          : failCount // ignore: cast_nullable_to_non_nullable
              as int,
      nodeIp: nodeIp == freezed
          ? _value.nodeIp
          : nodeIp // ignore: cast_nullable_to_non_nullable
              as String,
      nodeReferenceId: nodeReferenceId == freezed
          ? _value.nodeReferenceId
          : nodeReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$NodeCopyWith(_Node value, $Res Function(_Node) then) =
      __$NodeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'Address') String address,
      @JsonKey(name: 'UniqueName') String uniqueName,
      @JsonKey(name: 'Position') int position,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'Signature') String signature,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'FailCount') int failCount,
      @JsonKey(name: 'NodeIP') String nodeIp,
      @JsonKey(name: 'NodeReferenceId') String nodeReferenceId});
}

/// @nodoc
class __$NodeCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res>
    implements _$NodeCopyWith<$Res> {
  __$NodeCopyWithImpl(_Node _value, $Res Function(_Node) _then)
      : super(_value, (v) => _then(v as _Node));

  @override
  _Node get _value => super._value as _Node;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? uniqueName = freezed,
    Object? position = freezed,
    Object? amount = freezed,
    Object? signature = freezed,
    Object? isActive = freezed,
    Object? failCount = freezed,
    Object? nodeIp = freezed,
    Object? nodeReferenceId = freezed,
  }) {
    return _then(_Node(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueName: uniqueName == freezed
          ? _value.uniqueName
          : uniqueName // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      failCount: failCount == freezed
          ? _value.failCount
          : failCount // ignore: cast_nullable_to_non_nullable
              as int,
      nodeIp: nodeIp == freezed
          ? _value.nodeIp
          : nodeIp // ignore: cast_nullable_to_non_nullable
              as String,
      nodeReferenceId: nodeReferenceId == freezed
          ? _value.nodeReferenceId
          : nodeReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Node extends _Node {
  _$_Node(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'Address') required this.address,
      @JsonKey(name: 'UniqueName') required this.uniqueName,
      @JsonKey(name: 'Position') required this.position,
      @JsonKey(name: 'Amount') required this.amount,
      @JsonKey(name: 'Signature') required this.signature,
      @JsonKey(name: 'IsActive') required this.isActive,
      @JsonKey(name: 'FailCount') required this.failCount,
      @JsonKey(name: 'NodeIP') required this.nodeIp,
      @JsonKey(name: 'NodeReferenceId') required this.nodeReferenceId})
      : super._();

  factory _$_Node.fromJson(Map<String, dynamic> json) => _$$_NodeFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'Address')
  final String address;
  @override
  @JsonKey(name: 'UniqueName')
  final String uniqueName;
  @override
  @JsonKey(name: 'Position')
  final int position;
  @override
  @JsonKey(name: 'Amount')
  final double amount;
  @override
  @JsonKey(name: 'Signature')
  final String signature;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @override
  @JsonKey(name: 'FailCount')
  final int failCount;
  @override
  @JsonKey(name: 'NodeIP')
  final String nodeIp;
  @override
  @JsonKey(name: 'NodeReferenceId')
  final String nodeReferenceId;

  @override
  String toString() {
    return 'Node(id: $id, address: $address, uniqueName: $uniqueName, position: $position, amount: $amount, signature: $signature, isActive: $isActive, failCount: $failCount, nodeIp: $nodeIp, nodeReferenceId: $nodeReferenceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Node &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.uniqueName, uniqueName) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.failCount, failCount) &&
            const DeepCollectionEquality().equals(other.nodeIp, nodeIp) &&
            const DeepCollectionEquality()
                .equals(other.nodeReferenceId, nodeReferenceId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(uniqueName),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(failCount),
      const DeepCollectionEquality().hash(nodeIp),
      const DeepCollectionEquality().hash(nodeReferenceId));

  @JsonKey(ignore: true)
  @override
  _$NodeCopyWith<_Node> get copyWith =>
      __$NodeCopyWithImpl<_Node>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NodeToJson(this);
  }
}

abstract class _Node extends Node {
  factory _Node(
          {@JsonKey(name: 'Id') required int id,
          @JsonKey(name: 'Address') required String address,
          @JsonKey(name: 'UniqueName') required String uniqueName,
          @JsonKey(name: 'Position') required int position,
          @JsonKey(name: 'Amount') required double amount,
          @JsonKey(name: 'Signature') required String signature,
          @JsonKey(name: 'IsActive') required bool isActive,
          @JsonKey(name: 'FailCount') required int failCount,
          @JsonKey(name: 'NodeIP') required String nodeIp,
          @JsonKey(name: 'NodeReferenceId') required String nodeReferenceId}) =
      _$_Node;
  _Node._() : super._();

  factory _Node.fromJson(Map<String, dynamic> json) = _$_Node.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'Address')
  String get address;
  @override
  @JsonKey(name: 'UniqueName')
  String get uniqueName;
  @override
  @JsonKey(name: 'Position')
  int get position;
  @override
  @JsonKey(name: 'Amount')
  double get amount;
  @override
  @JsonKey(name: 'Signature')
  String get signature;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'FailCount')
  int get failCount;
  @override
  @JsonKey(name: 'NodeIP')
  String get nodeIp;
  @override
  @JsonKey(name: 'NodeReferenceId')
  String get nodeReferenceId;
  @override
  @JsonKey(ignore: true)
  _$NodeCopyWith<_Node> get copyWith => throw _privateConstructorUsedError;
}
