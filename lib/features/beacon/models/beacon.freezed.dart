// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: "IsPrivateBeacon")
  bool get isBeaconPrivate => throw _privateConstructorUsedError;
  @JsonKey(name: "AutoDeleteAfterDownload")
  bool get autoDeleteAfterDownload => throw _privateConstructorUsedError;
  @JsonKey(name: "FileCachePeriodDays")
  int get fileCachePeriodDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeaconCopyWith<Beacon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeaconCopyWith<$Res> {
  factory $BeaconCopyWith(Beacon value, $Res Function(Beacon) then) =
      _$BeaconCopyWithImpl<$Res, Beacon>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "IPAddress") String ipAddress,
      @JsonKey(name: "Port") int port,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "BeaconUID") String uid,
      @JsonKey(name: "SelfBeacon") bool selfBeacon,
      @JsonKey(name: "SelfBeaconActive") bool selfBeaconActive,
      @JsonKey(name: "IsPrivateBeacon") bool isBeaconPrivate,
      @JsonKey(name: "AutoDeleteAfterDownload") bool autoDeleteAfterDownload,
      @JsonKey(name: "FileCachePeriodDays") int fileCachePeriodDays});
}

/// @nodoc
class _$BeaconCopyWithImpl<$Res, $Val extends Beacon>
    implements $BeaconCopyWith<$Res> {
  _$BeaconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ipAddress = null,
    Object? port = null,
    Object? name = null,
    Object? uid = null,
    Object? selfBeacon = null,
    Object? selfBeaconActive = null,
    Object? isBeaconPrivate = null,
    Object? autoDeleteAfterDownload = null,
    Object? fileCachePeriodDays = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selfBeacon: null == selfBeacon
          ? _value.selfBeacon
          : selfBeacon // ignore: cast_nullable_to_non_nullable
              as bool,
      selfBeaconActive: null == selfBeaconActive
          ? _value.selfBeaconActive
          : selfBeaconActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeaconPrivate: null == isBeaconPrivate
          ? _value.isBeaconPrivate
          : isBeaconPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      autoDeleteAfterDownload: null == autoDeleteAfterDownload
          ? _value.autoDeleteAfterDownload
          : autoDeleteAfterDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      fileCachePeriodDays: null == fileCachePeriodDays
          ? _value.fileCachePeriodDays
          : fileCachePeriodDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeaconCopyWith<$Res> implements $BeaconCopyWith<$Res> {
  factory _$$_BeaconCopyWith(_$_Beacon value, $Res Function(_$_Beacon) then) =
      __$$_BeaconCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "IPAddress") String ipAddress,
      @JsonKey(name: "Port") int port,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "BeaconUID") String uid,
      @JsonKey(name: "SelfBeacon") bool selfBeacon,
      @JsonKey(name: "SelfBeaconActive") bool selfBeaconActive,
      @JsonKey(name: "IsPrivateBeacon") bool isBeaconPrivate,
      @JsonKey(name: "AutoDeleteAfterDownload") bool autoDeleteAfterDownload,
      @JsonKey(name: "FileCachePeriodDays") int fileCachePeriodDays});
}

/// @nodoc
class __$$_BeaconCopyWithImpl<$Res>
    extends _$BeaconCopyWithImpl<$Res, _$_Beacon>
    implements _$$_BeaconCopyWith<$Res> {
  __$$_BeaconCopyWithImpl(_$_Beacon _value, $Res Function(_$_Beacon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ipAddress = null,
    Object? port = null,
    Object? name = null,
    Object? uid = null,
    Object? selfBeacon = null,
    Object? selfBeaconActive = null,
    Object? isBeaconPrivate = null,
    Object? autoDeleteAfterDownload = null,
    Object? fileCachePeriodDays = null,
  }) {
    return _then(_$_Beacon(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      selfBeacon: null == selfBeacon
          ? _value.selfBeacon
          : selfBeacon // ignore: cast_nullable_to_non_nullable
              as bool,
      selfBeaconActive: null == selfBeaconActive
          ? _value.selfBeaconActive
          : selfBeaconActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isBeaconPrivate: null == isBeaconPrivate
          ? _value.isBeaconPrivate
          : isBeaconPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      autoDeleteAfterDownload: null == autoDeleteAfterDownload
          ? _value.autoDeleteAfterDownload
          : autoDeleteAfterDownload // ignore: cast_nullable_to_non_nullable
              as bool,
      fileCachePeriodDays: null == fileCachePeriodDays
          ? _value.fileCachePeriodDays
          : fileCachePeriodDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Beacon extends _Beacon {
  _$_Beacon(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "IPAddress")
          required this.ipAddress,
      @JsonKey(name: "Port")
          required this.port,
      @JsonKey(name: "Name")
          required this.name,
      @JsonKey(name: "BeaconUID")
          required this.uid,
      @JsonKey(name: "SelfBeacon")
          required this.selfBeacon,
      @JsonKey(name: "SelfBeaconActive")
          required this.selfBeaconActive,
      @JsonKey(name: "IsPrivateBeacon")
          required this.isBeaconPrivate,
      @JsonKey(name: "AutoDeleteAfterDownload")
          required this.autoDeleteAfterDownload,
      @JsonKey(name: "FileCachePeriodDays")
          required this.fileCachePeriodDays})
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
  @JsonKey(name: "IsPrivateBeacon")
  final bool isBeaconPrivate;
  @override
  @JsonKey(name: "AutoDeleteAfterDownload")
  final bool autoDeleteAfterDownload;
  @override
  @JsonKey(name: "FileCachePeriodDays")
  final int fileCachePeriodDays;

  @override
  String toString() {
    return 'Beacon(id: $id, ipAddress: $ipAddress, port: $port, name: $name, uid: $uid, selfBeacon: $selfBeacon, selfBeaconActive: $selfBeaconActive, isBeaconPrivate: $isBeaconPrivate, autoDeleteAfterDownload: $autoDeleteAfterDownload, fileCachePeriodDays: $fileCachePeriodDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Beacon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.selfBeacon, selfBeacon) ||
                other.selfBeacon == selfBeacon) &&
            (identical(other.selfBeaconActive, selfBeaconActive) ||
                other.selfBeaconActive == selfBeaconActive) &&
            (identical(other.isBeaconPrivate, isBeaconPrivate) ||
                other.isBeaconPrivate == isBeaconPrivate) &&
            (identical(
                    other.autoDeleteAfterDownload, autoDeleteAfterDownload) ||
                other.autoDeleteAfterDownload == autoDeleteAfterDownload) &&
            (identical(other.fileCachePeriodDays, fileCachePeriodDays) ||
                other.fileCachePeriodDays == fileCachePeriodDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ipAddress,
      port,
      name,
      uid,
      selfBeacon,
      selfBeaconActive,
      isBeaconPrivate,
      autoDeleteAfterDownload,
      fileCachePeriodDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeaconCopyWith<_$_Beacon> get copyWith =>
      __$$_BeaconCopyWithImpl<_$_Beacon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeaconToJson(
      this,
    );
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
          required final bool selfBeaconActive,
      @JsonKey(name: "IsPrivateBeacon")
          required final bool isBeaconPrivate,
      @JsonKey(name: "AutoDeleteAfterDownload")
          required final bool autoDeleteAfterDownload,
      @JsonKey(name: "FileCachePeriodDays")
          required final int fileCachePeriodDays}) = _$_Beacon;
  _Beacon._() : super._();

  factory _Beacon.fromJson(Map<String, dynamic> json) = _$_Beacon.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "IPAddress")
  String get ipAddress;
  @override
  @JsonKey(name: "Port")
  int get port;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "BeaconUID")
  String get uid;
  @override
  @JsonKey(name: "SelfBeacon")
  bool get selfBeacon;
  @override
  @JsonKey(name: "SelfBeaconActive")
  bool get selfBeaconActive;
  @override
  @JsonKey(name: "IsPrivateBeacon")
  bool get isBeaconPrivate;
  @override
  @JsonKey(name: "AutoDeleteAfterDownload")
  bool get autoDeleteAfterDownload;
  @override
  @JsonKey(name: "FileCachePeriodDays")
  int get fileCachePeriodDays;
  @override
  @JsonKey(ignore: true)
  _$$_BeaconCopyWith<_$_Beacon> get copyWith =>
      throw _privateConstructorUsedError;
}
