// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'masternode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Masternode _$MasternodeFromJson(Map<String, dynamic> json) {
  return _Masternode.fromJson(json);
}

/// @nodoc
class _$MasternodeTearOff {
  const _$MasternodeTearOff();

  _Masternode call(
      {required String address,
      @JsonKey(name: 'unique_name') required String uniqueName,
      @JsonKey(name: 'connect_date') required DateTime connectDate,
      @JsonKey(name: 'is_active') required bool isActive,
      @JsonKey(name: 'block_count') required int blockCount,
      required dynamic location}) {
    return _Masternode(
      address: address,
      uniqueName: uniqueName,
      connectDate: connectDate,
      isActive: isActive,
      blockCount: blockCount,
      location: location,
    );
  }

  Masternode fromJson(Map<String, Object?> json) {
    return Masternode.fromJson(json);
  }
}

/// @nodoc
const $Masternode = _$MasternodeTearOff();

/// @nodoc
mixin _$Masternode {
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'unique_name')
  String get uniqueName => throw _privateConstructorUsedError;
  @JsonKey(name: 'connect_date')
  DateTime get connectDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_count')
  int get blockCount => throw _privateConstructorUsedError;
  dynamic get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MasternodeCopyWith<Masternode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasternodeCopyWith<$Res> {
  factory $MasternodeCopyWith(
          Masternode value, $Res Function(Masternode) then) =
      _$MasternodeCopyWithImpl<$Res>;
  $Res call(
      {String address,
      @JsonKey(name: 'unique_name') String uniqueName,
      @JsonKey(name: 'connect_date') DateTime connectDate,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'block_count') int blockCount,
      dynamic location});
}

/// @nodoc
class _$MasternodeCopyWithImpl<$Res> implements $MasternodeCopyWith<$Res> {
  _$MasternodeCopyWithImpl(this._value, this._then);

  final Masternode _value;
  // ignore: unused_field
  final $Res Function(Masternode) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? uniqueName = freezed,
    Object? connectDate = freezed,
    Object? isActive = freezed,
    Object? blockCount = freezed,
    Object? location = freezed,
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
      connectDate: connectDate == freezed
          ? _value.connectDate
          : connectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      blockCount: blockCount == freezed
          ? _value.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$MasternodeCopyWith<$Res> implements $MasternodeCopyWith<$Res> {
  factory _$MasternodeCopyWith(
          _Masternode value, $Res Function(_Masternode) then) =
      __$MasternodeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String address,
      @JsonKey(name: 'unique_name') String uniqueName,
      @JsonKey(name: 'connect_date') DateTime connectDate,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'block_count') int blockCount,
      dynamic location});
}

/// @nodoc
class __$MasternodeCopyWithImpl<$Res> extends _$MasternodeCopyWithImpl<$Res>
    implements _$MasternodeCopyWith<$Res> {
  __$MasternodeCopyWithImpl(
      _Masternode _value, $Res Function(_Masternode) _then)
      : super(_value, (v) => _then(v as _Masternode));

  @override
  _Masternode get _value => super._value as _Masternode;

  @override
  $Res call({
    Object? address = freezed,
    Object? uniqueName = freezed,
    Object? connectDate = freezed,
    Object? isActive = freezed,
    Object? blockCount = freezed,
    Object? location = freezed,
  }) {
    return _then(_Masternode(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueName: uniqueName == freezed
          ? _value.uniqueName
          : uniqueName // ignore: cast_nullable_to_non_nullable
              as String,
      connectDate: connectDate == freezed
          ? _value.connectDate
          : connectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      blockCount: blockCount == freezed
          ? _value.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Masternode extends _Masternode {
  _$_Masternode(
      {required this.address,
      @JsonKey(name: 'unique_name') required this.uniqueName,
      @JsonKey(name: 'connect_date') required this.connectDate,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'block_count') required this.blockCount,
      required this.location})
      : super._();

  factory _$_Masternode.fromJson(Map<String, dynamic> json) =>
      _$$_MasternodeFromJson(json);

  @override
  final String address;
  @override
  @JsonKey(name: 'unique_name')
  final String uniqueName;
  @override
  @JsonKey(name: 'connect_date')
  final DateTime connectDate;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'block_count')
  final int blockCount;
  @override
  final dynamic location;

  @override
  String toString() {
    return 'Masternode(address: $address, uniqueName: $uniqueName, connectDate: $connectDate, isActive: $isActive, blockCount: $blockCount, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Masternode &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.uniqueName, uniqueName) &&
            const DeepCollectionEquality()
                .equals(other.connectDate, connectDate) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality()
                .equals(other.blockCount, blockCount) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(uniqueName),
      const DeepCollectionEquality().hash(connectDate),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(blockCount),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$MasternodeCopyWith<_Masternode> get copyWith =>
      __$MasternodeCopyWithImpl<_Masternode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MasternodeToJson(this);
  }
}

abstract class _Masternode extends Masternode {
  factory _Masternode(
      {required String address,
      @JsonKey(name: 'unique_name') required String uniqueName,
      @JsonKey(name: 'connect_date') required DateTime connectDate,
      @JsonKey(name: 'is_active') required bool isActive,
      @JsonKey(name: 'block_count') required int blockCount,
      required dynamic location}) = _$_Masternode;
  _Masternode._() : super._();

  factory _Masternode.fromJson(Map<String, dynamic> json) =
      _$_Masternode.fromJson;

  @override
  String get address;
  @override
  @JsonKey(name: 'unique_name')
  String get uniqueName;
  @override
  @JsonKey(name: 'connect_date')
  DateTime get connectDate;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'block_count')
  int get blockCount;
  @override
  dynamic get location;
  @override
  @JsonKey(ignore: true)
  _$MasternodeCopyWith<_Masternode> get copyWith =>
      throw _privateConstructorUsedError;
}
