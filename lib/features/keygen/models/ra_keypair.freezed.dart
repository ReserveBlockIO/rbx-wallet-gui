// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ra_keypair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RaKeypair _$RaKeypairFromJson(Map<String, dynamic> json) {
  return _RaKeypair.fromJson(json);
}

/// @nodoc
mixin _$RaKeypair {
  String get private => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get public => throw _privateConstructorUsedError;
  String get recoveryPrivate => throw _privateConstructorUsedError;
  String get recoveryAddress => throw _privateConstructorUsedError;
  String get recoveryPublic => throw _privateConstructorUsedError;
  String get restoreCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RaKeypairCopyWith<RaKeypair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RaKeypairCopyWith<$Res> {
  factory $RaKeypairCopyWith(RaKeypair value, $Res Function(RaKeypair) then) =
      _$RaKeypairCopyWithImpl<$Res, RaKeypair>;
  @useResult
  $Res call(
      {String private,
      String address,
      String public,
      String recoveryPrivate,
      String recoveryAddress,
      String recoveryPublic,
      String restoreCode});
}

/// @nodoc
class _$RaKeypairCopyWithImpl<$Res, $Val extends RaKeypair>
    implements $RaKeypairCopyWith<$Res> {
  _$RaKeypairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = null,
    Object? address = null,
    Object? public = null,
    Object? recoveryPrivate = null,
    Object? recoveryAddress = null,
    Object? recoveryPublic = null,
    Object? restoreCode = null,
  }) {
    return _then(_value.copyWith(
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryPrivate: null == recoveryPrivate
          ? _value.recoveryPrivate
          : recoveryPrivate // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryAddress: null == recoveryAddress
          ? _value.recoveryAddress
          : recoveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryPublic: null == recoveryPublic
          ? _value.recoveryPublic
          : recoveryPublic // ignore: cast_nullable_to_non_nullable
              as String,
      restoreCode: null == restoreCode
          ? _value.restoreCode
          : restoreCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RaKeypairCopyWith<$Res> implements $RaKeypairCopyWith<$Res> {
  factory _$$_RaKeypairCopyWith(
          _$_RaKeypair value, $Res Function(_$_RaKeypair) then) =
      __$$_RaKeypairCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String private,
      String address,
      String public,
      String recoveryPrivate,
      String recoveryAddress,
      String recoveryPublic,
      String restoreCode});
}

/// @nodoc
class __$$_RaKeypairCopyWithImpl<$Res>
    extends _$RaKeypairCopyWithImpl<$Res, _$_RaKeypair>
    implements _$$_RaKeypairCopyWith<$Res> {
  __$$_RaKeypairCopyWithImpl(
      _$_RaKeypair _value, $Res Function(_$_RaKeypair) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private = null,
    Object? address = null,
    Object? public = null,
    Object? recoveryPrivate = null,
    Object? recoveryAddress = null,
    Object? recoveryPublic = null,
    Object? restoreCode = null,
  }) {
    return _then(_$_RaKeypair(
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryPrivate: null == recoveryPrivate
          ? _value.recoveryPrivate
          : recoveryPrivate // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryAddress: null == recoveryAddress
          ? _value.recoveryAddress
          : recoveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      recoveryPublic: null == recoveryPublic
          ? _value.recoveryPublic
          : recoveryPublic // ignore: cast_nullable_to_non_nullable
              as String,
      restoreCode: null == restoreCode
          ? _value.restoreCode
          : restoreCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RaKeypair extends _RaKeypair {
  _$_RaKeypair(
      {required this.private,
      required this.address,
      required this.public,
      required this.recoveryPrivate,
      required this.recoveryAddress,
      required this.recoveryPublic,
      required this.restoreCode})
      : super._();

  factory _$_RaKeypair.fromJson(Map<String, dynamic> json) =>
      _$$_RaKeypairFromJson(json);

  @override
  final String private;
  @override
  final String address;
  @override
  final String public;
  @override
  final String recoveryPrivate;
  @override
  final String recoveryAddress;
  @override
  final String recoveryPublic;
  @override
  final String restoreCode;

  @override
  String toString() {
    return 'RaKeypair(private: $private, address: $address, public: $public, recoveryPrivate: $recoveryPrivate, recoveryAddress: $recoveryAddress, recoveryPublic: $recoveryPublic, restoreCode: $restoreCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RaKeypair &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.public, public) || other.public == public) &&
            (identical(other.recoveryPrivate, recoveryPrivate) ||
                other.recoveryPrivate == recoveryPrivate) &&
            (identical(other.recoveryAddress, recoveryAddress) ||
                other.recoveryAddress == recoveryAddress) &&
            (identical(other.recoveryPublic, recoveryPublic) ||
                other.recoveryPublic == recoveryPublic) &&
            (identical(other.restoreCode, restoreCode) ||
                other.restoreCode == restoreCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private, address, public,
      recoveryPrivate, recoveryAddress, recoveryPublic, restoreCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RaKeypairCopyWith<_$_RaKeypair> get copyWith =>
      __$$_RaKeypairCopyWithImpl<_$_RaKeypair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RaKeypairToJson(
      this,
    );
  }
}

abstract class _RaKeypair extends RaKeypair {
  factory _RaKeypair(
      {required final String private,
      required final String address,
      required final String public,
      required final String recoveryPrivate,
      required final String recoveryAddress,
      required final String recoveryPublic,
      required final String restoreCode}) = _$_RaKeypair;
  _RaKeypair._() : super._();

  factory _RaKeypair.fromJson(Map<String, dynamic> json) =
      _$_RaKeypair.fromJson;

  @override
  String get private;
  @override
  String get address;
  @override
  String get public;
  @override
  String get recoveryPrivate;
  @override
  String get recoveryAddress;
  @override
  String get recoveryPublic;
  @override
  String get restoreCode;
  @override
  @JsonKey(ignore: true)
  _$$_RaKeypairCopyWith<_$_RaKeypair> get copyWith =>
      throw _privateConstructorUsedError;
}
