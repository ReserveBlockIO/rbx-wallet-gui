// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keypair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Keypair _$KeypairFromJson(Map<String, dynamic> json) {
  return _Keypair.fromJson(json);
}

/// @nodoc
mixin _$Keypair {
  String get private => throw _privateConstructorUsedError;
  String get public => throw _privateConstructorUsedError;
  String get publicInflated => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError; // @JsonKey(toJson: null) ECPrivateKey? ecPrivateKey,
  String? get mneumonic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeypairCopyWith<Keypair> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeypairCopyWith<$Res> {
  factory $KeypairCopyWith(Keypair value, $Res Function(Keypair) then) = _$KeypairCopyWithImpl<$Res>;
  $Res call({String private, String public, String publicInflated, String email, String? mneumonic});
}

/// @nodoc
class _$KeypairCopyWithImpl<$Res> implements $KeypairCopyWith<$Res> {
  _$KeypairCopyWithImpl(this._value, this._then);

  final Keypair _value;
  // ignore: unused_field
  final $Res Function(Keypair) _then;

  @override
  $Res call({
    Object? private = freezed,
    Object? public = freezed,
    Object? publicInflated = freezed,
    Object? email = freezed,
    Object? mneumonic = freezed,
  }) {
    return _then(_value.copyWith(
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String,
      publicInflated: publicInflated == freezed
          ? _value.publicInflated
          : publicInflated // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mneumonic: mneumonic == freezed
          ? _value.mneumonic
          : mneumonic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_KeypairCopyWith<$Res> implements $KeypairCopyWith<$Res> {
  factory _$$_KeypairCopyWith(_$_Keypair value, $Res Function(_$_Keypair) then) = __$$_KeypairCopyWithImpl<$Res>;
  @override
  $Res call({String private, String public, String publicInflated, String email, String? mneumonic});
}

/// @nodoc
class __$$_KeypairCopyWithImpl<$Res> extends _$KeypairCopyWithImpl<$Res> implements _$$_KeypairCopyWith<$Res> {
  __$$_KeypairCopyWithImpl(_$_Keypair _value, $Res Function(_$_Keypair) _then) : super(_value, (v) => _then(v as _$_Keypair));

  @override
  _$_Keypair get _value => super._value as _$_Keypair;

  @override
  $Res call({
    Object? private = freezed,
    Object? public = freezed,
    Object? publicInflated = freezed,
    Object? email = freezed,
    Object? mneumonic = freezed,
  }) {
    return _then(_$_Keypair(
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as String,
      public: public == freezed
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String,
      publicInflated: publicInflated == freezed
          ? _value.publicInflated
          : publicInflated // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mneumonic: mneumonic == freezed
          ? _value.mneumonic
          : mneumonic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Keypair extends _Keypair {
  _$_Keypair({required this.private, required this.public, required this.publicInflated, required this.email, this.mneumonic}) : super._();

  factory _$_Keypair.fromJson(Map<String, dynamic> json) => _$$_KeypairFromJson(json);

  @override
  final String private;
  @override
  final String public;
  @override
  final String publicInflated;
  @override
  final String email;
// @JsonKey(toJson: null) ECPrivateKey? ecPrivateKey,
  @override
  final String? mneumonic;

  @override
  String toString() {
    return 'Keypair(private: $private, public: $public, publicInflated: $publicInflated, email: $email, mneumonic: $mneumonic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Keypair &&
            const DeepCollectionEquality().equals(other.private, private) &&
            const DeepCollectionEquality().equals(other.public, public) &&
            const DeepCollectionEquality().equals(other.publicInflated, publicInflated) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.mneumonic, mneumonic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(private),
      const DeepCollectionEquality().hash(public),
      const DeepCollectionEquality().hash(publicInflated),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(mneumonic));

  @JsonKey(ignore: true)
  @override
  _$$_KeypairCopyWith<_$_Keypair> get copyWith => __$$_KeypairCopyWithImpl<_$_Keypair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeypairToJson(this);
  }
}

abstract class _Keypair extends Keypair {
  factory _Keypair(
      {required final String private,
      required final String public,
      required final String publicInflated,
      required final String email,
      final String? mneumonic}) = _$_Keypair;
  _Keypair._() : super._();

  factory _Keypair.fromJson(Map<String, dynamic> json) = _$_Keypair.fromJson;

  @override
  String get private => throw _privateConstructorUsedError;
  @override
  String get public => throw _privateConstructorUsedError;
  @override
  String get publicInflated => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override // @JsonKey(toJson: null) ECPrivateKey? ecPrivateKey,
  String? get mneumonic => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_KeypairCopyWith<_$_Keypair> get copyWith => throw _privateConstructorUsedError;
}
