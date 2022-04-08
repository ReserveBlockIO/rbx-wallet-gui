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
      {@JsonKey(name: 'Address') required String address,
      @JsonKey(name: 'UniqueName') required String uniqueName,
      @JsonKey(name: 'ConnectionId') required String connectionId,
      @JsonKey(name: 'IpAddress') required String ipAddress,
      @JsonKey(name: 'WalletVersion') required String? walletVersion,
      @JsonKey(name: 'ConnectDate') required DateTime connectDate}) {
    return _Node(
      address: address,
      uniqueName: uniqueName,
      connectionId: connectionId,
      ipAddress: ipAddress,
      walletVersion: walletVersion,
      connectDate: connectDate,
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
  @JsonKey(name: 'Address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'UniqueName')
  String get uniqueName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConnectionId')
  String get connectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IpAddress')
  String get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'WalletVersion')
  String? get walletVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConnectDate')
  DateTime get connectDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Address') String address,
      @JsonKey(name: 'UniqueName') String uniqueName,
      @JsonKey(name: 'ConnectionId') String connectionId,
      @JsonKey(name: 'IpAddress') String ipAddress,
      @JsonKey(name: 'WalletVersion') String? walletVersion,
      @JsonKey(name: 'ConnectDate') DateTime connectDate});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res> implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  final Node _value;
  // ignore: unused_field
  final $Res Function(Node) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? uniqueName = freezed,
    Object? connectionId = freezed,
    Object? ipAddress = freezed,
    Object? walletVersion = freezed,
    Object? connectDate = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueName: uniqueName == freezed
          ? _value.uniqueName
          : uniqueName // ignore: cast_nullable_to_non_nullable
              as String,
      connectionId: connectionId == freezed
          ? _value.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      walletVersion: walletVersion == freezed
          ? _value.walletVersion
          : walletVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      connectDate: connectDate == freezed
          ? _value.connectDate
          : connectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$NodeCopyWith(_Node value, $Res Function(_Node) then) =
      __$NodeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Address') String address,
      @JsonKey(name: 'UniqueName') String uniqueName,
      @JsonKey(name: 'ConnectionId') String connectionId,
      @JsonKey(name: 'IpAddress') String ipAddress,
      @JsonKey(name: 'WalletVersion') String? walletVersion,
      @JsonKey(name: 'ConnectDate') DateTime connectDate});
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
    Object? address = freezed,
    Object? uniqueName = freezed,
    Object? connectionId = freezed,
    Object? ipAddress = freezed,
    Object? walletVersion = freezed,
    Object? connectDate = freezed,
  }) {
    return _then(_Node(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueName: uniqueName == freezed
          ? _value.uniqueName
          : uniqueName // ignore: cast_nullable_to_non_nullable
              as String,
      connectionId: connectionId == freezed
          ? _value.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      walletVersion: walletVersion == freezed
          ? _value.walletVersion
          : walletVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      connectDate: connectDate == freezed
          ? _value.connectDate
          : connectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Node extends _Node {
  _$_Node(
      {@JsonKey(name: 'Address') required this.address,
      @JsonKey(name: 'UniqueName') required this.uniqueName,
      @JsonKey(name: 'ConnectionId') required this.connectionId,
      @JsonKey(name: 'IpAddress') required this.ipAddress,
      @JsonKey(name: 'WalletVersion') required this.walletVersion,
      @JsonKey(name: 'ConnectDate') required this.connectDate})
      : super._();

  factory _$_Node.fromJson(Map<String, dynamic> json) => _$$_NodeFromJson(json);

  @override
  @JsonKey(name: 'Address')
  final String address;
  @override
  @JsonKey(name: 'UniqueName')
  final String uniqueName;
  @override
  @JsonKey(name: 'ConnectionId')
  final String connectionId;
  @override
  @JsonKey(name: 'IpAddress')
  final String ipAddress;
  @override
  @JsonKey(name: 'WalletVersion')
  final String? walletVersion;
  @override
  @JsonKey(name: 'ConnectDate')
  final DateTime connectDate;

  @override
  String toString() {
    return 'Node(address: $address, uniqueName: $uniqueName, connectionId: $connectionId, ipAddress: $ipAddress, walletVersion: $walletVersion, connectDate: $connectDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Node &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.uniqueName, uniqueName) &&
            const DeepCollectionEquality()
                .equals(other.connectionId, connectionId) &&
            const DeepCollectionEquality().equals(other.ipAddress, ipAddress) &&
            const DeepCollectionEquality()
                .equals(other.walletVersion, walletVersion) &&
            const DeepCollectionEquality()
                .equals(other.connectDate, connectDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(uniqueName),
      const DeepCollectionEquality().hash(connectionId),
      const DeepCollectionEquality().hash(ipAddress),
      const DeepCollectionEquality().hash(walletVersion),
      const DeepCollectionEquality().hash(connectDate));

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
      {@JsonKey(name: 'Address') required String address,
      @JsonKey(name: 'UniqueName') required String uniqueName,
      @JsonKey(name: 'ConnectionId') required String connectionId,
      @JsonKey(name: 'IpAddress') required String ipAddress,
      @JsonKey(name: 'WalletVersion') required String? walletVersion,
      @JsonKey(name: 'ConnectDate') required DateTime connectDate}) = _$_Node;
  _Node._() : super._();

  factory _Node.fromJson(Map<String, dynamic> json) = _$_Node.fromJson;

  @override
  @JsonKey(name: 'Address')
  String get address;
  @override
  @JsonKey(name: 'UniqueName')
  String get uniqueName;
  @override
  @JsonKey(name: 'ConnectionId')
  String get connectionId;
  @override
  @JsonKey(name: 'IpAddress')
  String get ipAddress;
  @override
  @JsonKey(name: 'WalletVersion')
  String? get walletVersion;
  @override
  @JsonKey(name: 'ConnectDate')
  DateTime get connectDate;
  @override
  @JsonKey(ignore: true)
  _$NodeCopyWith<_Node> get copyWith => throw _privateConstructorUsedError;
}
