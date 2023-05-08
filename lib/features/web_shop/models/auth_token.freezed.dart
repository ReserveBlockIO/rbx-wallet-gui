// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) {
  return _AuthToken.fromJson(json);
}

/// @nodoc
mixin _$AuthToken {
  String get message => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "expires_at")
  DateTime get expiresAt => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenCopyWith<AuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenCopyWith<$Res> {
  factory $AuthTokenCopyWith(AuthToken value, $Res Function(AuthToken) then) =
      _$AuthTokenCopyWithImpl<$Res, AuthToken>;
  @useResult
  $Res call(
      {String message,
      String token,
      String address,
      @JsonKey(name: "expires_at") DateTime expiresAt,
      String signature,
      String? email});
}

/// @nodoc
class _$AuthTokenCopyWithImpl<$Res, $Val extends AuthToken>
    implements $AuthTokenCopyWith<$Res> {
  _$AuthTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? token = null,
    Object? address = null,
    Object? expiresAt = null,
    Object? signature = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthTokenCopyWith<$Res> implements $AuthTokenCopyWith<$Res> {
  factory _$$_AuthTokenCopyWith(
          _$_AuthToken value, $Res Function(_$_AuthToken) then) =
      __$$_AuthTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String token,
      String address,
      @JsonKey(name: "expires_at") DateTime expiresAt,
      String signature,
      String? email});
}

/// @nodoc
class __$$_AuthTokenCopyWithImpl<$Res>
    extends _$AuthTokenCopyWithImpl<$Res, _$_AuthToken>
    implements _$$_AuthTokenCopyWith<$Res> {
  __$$_AuthTokenCopyWithImpl(
      _$_AuthToken _value, $Res Function(_$_AuthToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? token = null,
    Object? address = null,
    Object? expiresAt = null,
    Object? signature = null,
    Object? email = freezed,
  }) {
    return _then(_$_AuthToken(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthToken extends _AuthToken {
  _$_AuthToken(
      {required this.message,
      required this.token,
      required this.address,
      @JsonKey(name: "expires_at") required this.expiresAt,
      required this.signature,
      this.email})
      : super._();

  factory _$_AuthToken.fromJson(Map<String, dynamic> json) =>
      _$$_AuthTokenFromJson(json);

  @override
  final String message;
  @override
  final String token;
  @override
  final String address;
  @override
  @JsonKey(name: "expires_at")
  final DateTime expiresAt;
  @override
  final String signature;
  @override
  final String? email;

  @override
  String toString() {
    return 'AuthToken(message: $message, token: $token, address: $address, expiresAt: $expiresAt, signature: $signature, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthToken &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, token, address, expiresAt, signature, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthTokenCopyWith<_$_AuthToken> get copyWith =>
      __$$_AuthTokenCopyWithImpl<_$_AuthToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthTokenToJson(
      this,
    );
  }
}

abstract class _AuthToken extends AuthToken {
  factory _AuthToken(
      {required final String message,
      required final String token,
      required final String address,
      @JsonKey(name: "expires_at") required final DateTime expiresAt,
      required final String signature,
      final String? email}) = _$_AuthToken;
  _AuthToken._() : super._();

  factory _AuthToken.fromJson(Map<String, dynamic> json) =
      _$_AuthToken.fromJson;

  @override
  String get message;
  @override
  String get token;
  @override
  String get address;
  @override
  @JsonKey(name: "expires_at")
  DateTime get expiresAt;
  @override
  String get signature;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_AuthTokenCopyWith<_$_AuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}
