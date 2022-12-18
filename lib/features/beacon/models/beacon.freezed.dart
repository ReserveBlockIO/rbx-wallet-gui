// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beacon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Beacon _$BeaconFromJson(Map<String, dynamic> json) {
  return _Beacon.fromJson(json);
}

/// @nodoc
mixin _$Beacon {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "IPAddress")
  String get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "Port")
  int get port => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "BeaconUID")
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "SelfBeacon")
  bool get selfBeacon => throw _privateConstructorUsedError;
  @JsonKey(name: "SelfBeaconActive")
  bool get selfBeaconActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeaconCopyWith<Beacon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeaconCopyWith<$Res> {
  factory $BeaconCopyWith(Beacon value, $Res Function(Beacon) then) =
      _$BeaconCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "IPAddress") String ipAddress,
      @JsonKey(name: "Port") int port,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "BeaconUID") String uid,
      @JsonKey(name: "SelfBeacon") bool selfBeacon,
      @JsonKey(name: "SelfBeaconActive") bool selfBeaconActive});
}

/// @nodoc
class _$BeaconCopyWithImpl<$Res> implements $BeaconCopyWith<$Res> {
  _$BeaconCopyWithImpl(this._value, this._then);

  final Beacon _value;
  // ignore: unused_field
  final $Res Function(Beacon) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? ipAddress = freezed,
    Object? port = freezed,
    Object? name = freezed,
    Object? uid = freezed,
    Object? selfBeacon = freezed,
    Object? selfBeaconActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selfBeacon: selfBeacon == freezed
          ? _value.selfBeacon
          : selfBeacon // ignore: cast_nullable_to_non_nullable
              as bool,
      selfBeaconActive: selfBeaconActive == freezed
          ? _value.selfBeaconActive
          : selfBeaconActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_BeaconCopyWith<$Res> implements $BeaconCopyWith<$Res> {
  factory _$$_BeaconCopyWith(_$_Beacon value, $Res Function(_$_Beacon) then) =
      __$$_BeaconCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "IPAddress") String ipAddress,
      @JsonKey(name: "Port") int port,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "BeaconUID") String uid,
      @JsonKey(name: "SelfBeacon") bool selfBeacon,
      @JsonKey(name: "SelfBeaconActive") bool selfBeaconActive});
}

/// @nodoc
class __$$_BeaconCopyWithImpl<$Res> extends _$BeaconCopyWithImpl<$Res>
    implements _$$_BeaconCopyWith<$Res> {
  __$$_BeaconCopyWithImpl(_$_Beacon _value, $Res Function(_$_Beacon) _then)
      : super(_value, (v) => _then(v as _$_Beacon));

  @override
  _$_Beacon get _value => super._value as _$_Beacon;

  @override
  $Res call({
    Object? id = freezed,
    Object? ipAddress = freezed,
    Object? port = freezed,
    Object? name = freezed,
    Object? uid = freezed,
    Object? selfBeacon = freezed,
    Object? selfBeaconActive = freezed,
  }) {
    return _then(_$_Beacon(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ipAddress: ipAddress == freezed
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selfBeacon: selfBeacon == freezed
          ? _value.selfBeacon
          : selfBeacon // ignore: cast_nullable_to_non_nullable
              as bool,
      selfBeaconActive: selfBeaconActive == freezed
          ? _value.selfBeaconActive
          : selfBeaconActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Beacon extends _Beacon {
  _$_Beacon(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "IPAddress") required this.ipAddress,
      @JsonKey(name: "Port") required this.port,
      @JsonKey(name: "Name") required this.name,
      @JsonKey(name: "BeaconUID") required this.uid,
      @JsonKey(name: "SelfBeacon") required this.selfBeacon,
      @JsonKey(name: "SelfBeaconActive") required this.selfBeaconActive})
      : super._();

  factory _$_Beacon.fromJson(Map<String, dynamic> json) =>
      _$$_BeaconFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "IPAddress")
  final String ipAddress;
  @override
  @JsonKey(name: "Port")
  final int port;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "BeaconUID")
  final String uid;
  @override
  @JsonKey(name: "SelfBeacon")
  final bool selfBeacon;
  @override
  @JsonKey(name: "SelfBeaconActive")
  final bool selfBeaconActive;

  @override
  String toString() {
    return 'Beacon(id: $id, ipAddress: $ipAddress, port: $port, name: $name, uid: $uid, selfBeacon: $selfBeacon, selfBeaconActive: $selfBeaconActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Beacon &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.ipAddress, ipAddress) &&
            const DeepCollectionEquality().equals(other.port, port) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.selfBeacon, selfBeacon) &&
            const DeepCollectionEquality()
                .equals(other.selfBeaconActive, selfBeaconActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(ipAddress),
      const DeepCollectionEquality().hash(port),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(selfBeacon),
      const DeepCollectionEquality().hash(selfBeaconActive));

  @JsonKey(ignore: true)
  @override
  _$$_BeaconCopyWith<_$_Beacon> get copyWith =>
      __$$_BeaconCopyWithImpl<_$_Beacon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeaconToJson(this);
  }
}

abstract class _Beacon extends Beacon {
  factory _Beacon(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "IPAddress")
          required final String ipAddress,
      @JsonKey(name: "Port")
          required final int port,
      @JsonKey(name: "Name")
          required final String name,
      @JsonKey(name: "BeaconUID")
          required final String uid,
      @JsonKey(name: "SelfBeacon")
          required final bool selfBeacon,
      @JsonKey(name: "SelfBeaconActive")
          required final bool selfBeaconActive}) = _$_Beacon;
  _Beacon._() : super._();

  factory _Beacon.fromJson(Map<String, dynamic> json) = _$_Beacon.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IPAddress")
  String get ipAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Port")
  int get port => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "BeaconUID")
  String get uid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "SelfBeacon")
  bool get selfBeacon => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "SelfBeaconActive")
  bool get selfBeaconActive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BeaconCopyWith<_$_Beacon> get copyWith =>
      throw _privateConstructorUsedError;
}
