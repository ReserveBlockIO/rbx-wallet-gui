// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebSessionModel _$WebSessionModelFromJson(Map<String, dynamic> json) {
  return _WebSessionModel.fromJson(json);
}

/// @nodoc
mixin _$WebSessionModel {
  Keypair? get keypair => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;
  String? get adnr => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  String get timezoneName => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebSessionModelCopyWith<WebSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSessionModelCopyWith<$Res> {
  factory $WebSessionModelCopyWith(
          WebSessionModel value, $Res Function(WebSessionModel) then) =
      _$WebSessionModelCopyWithImpl<$Res>;
  $Res call(
      {Keypair? keypair,
      double? balance,
      String? adnr,
      bool isAuthenticated,
      String timezoneName,
      bool rememberMe});

  $KeypairCopyWith<$Res>? get keypair;
}

/// @nodoc
class _$WebSessionModelCopyWithImpl<$Res>
    implements $WebSessionModelCopyWith<$Res> {
  _$WebSessionModelCopyWithImpl(this._value, this._then);

  final WebSessionModel _value;
  // ignore: unused_field
  final $Res Function(WebSessionModel) _then;

  @override
  $Res call({
    Object? keypair = freezed,
    Object? balance = freezed,
    Object? adnr = freezed,
    Object? isAuthenticated = freezed,
    Object? timezoneName = freezed,
    Object? rememberMe = freezed,
  }) {
    return _then(_value.copyWith(
      keypair: keypair == freezed
          ? _value.keypair
          : keypair // ignore: cast_nullable_to_non_nullable
              as Keypair?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      adnr: adnr == freezed
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      timezoneName: timezoneName == freezed
          ? _value.timezoneName
          : timezoneName // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: rememberMe == freezed
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $KeypairCopyWith<$Res>? get keypair {
    if (_value.keypair == null) {
      return null;
    }

    return $KeypairCopyWith<$Res>(_value.keypair!, (value) {
      return _then(_value.copyWith(keypair: value));
    });
  }
}

/// @nodoc
abstract class _$$_WebSessionModelCopyWith<$Res>
    implements $WebSessionModelCopyWith<$Res> {
  factory _$$_WebSessionModelCopyWith(
          _$_WebSessionModel value, $Res Function(_$_WebSessionModel) then) =
      __$$_WebSessionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {Keypair? keypair,
      double? balance,
      String? adnr,
      bool isAuthenticated,
      String timezoneName,
      bool rememberMe});

  @override
  $KeypairCopyWith<$Res>? get keypair;
}

/// @nodoc
class __$$_WebSessionModelCopyWithImpl<$Res>
    extends _$WebSessionModelCopyWithImpl<$Res>
    implements _$$_WebSessionModelCopyWith<$Res> {
  __$$_WebSessionModelCopyWithImpl(
      _$_WebSessionModel _value, $Res Function(_$_WebSessionModel) _then)
      : super(_value, (v) => _then(v as _$_WebSessionModel));

  @override
  _$_WebSessionModel get _value => super._value as _$_WebSessionModel;

  @override
  $Res call({
    Object? keypair = freezed,
    Object? balance = freezed,
    Object? adnr = freezed,
    Object? isAuthenticated = freezed,
    Object? timezoneName = freezed,
    Object? rememberMe = freezed,
  }) {
    return _then(_$_WebSessionModel(
      keypair: keypair == freezed
          ? _value.keypair
          : keypair // ignore: cast_nullable_to_non_nullable
              as Keypair?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      adnr: adnr == freezed
          ? _value.adnr
          : adnr // ignore: cast_nullable_to_non_nullable
              as String?,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      timezoneName: timezoneName == freezed
          ? _value.timezoneName
          : timezoneName // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: rememberMe == freezed
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebSessionModel extends _WebSessionModel {
  _$_WebSessionModel(
      {this.keypair,
      this.balance,
      this.adnr,
      this.isAuthenticated = false,
      this.timezoneName = "America/Los_Angeles",
      this.rememberMe = false})
      : super._();

  factory _$_WebSessionModel.fromJson(Map<String, dynamic> json) =>
      _$$_WebSessionModelFromJson(json);

  @override
  final Keypair? keypair;
  @override
  final double? balance;
  @override
  final String? adnr;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  @JsonKey()
  final String timezoneName;
  @override
  @JsonKey()
  final bool rememberMe;

  @override
  String toString() {
    return 'WebSessionModel(keypair: $keypair, balance: $balance, adnr: $adnr, isAuthenticated: $isAuthenticated, timezoneName: $timezoneName, rememberMe: $rememberMe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebSessionModel &&
            const DeepCollectionEquality().equals(other.keypair, keypair) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality().equals(other.adnr, adnr) &&
            const DeepCollectionEquality()
                .equals(other.isAuthenticated, isAuthenticated) &&
            const DeepCollectionEquality()
                .equals(other.timezoneName, timezoneName) &&
            const DeepCollectionEquality()
                .equals(other.rememberMe, rememberMe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(keypair),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(adnr),
      const DeepCollectionEquality().hash(isAuthenticated),
      const DeepCollectionEquality().hash(timezoneName),
      const DeepCollectionEquality().hash(rememberMe));

  @JsonKey(ignore: true)
  @override
  _$$_WebSessionModelCopyWith<_$_WebSessionModel> get copyWith =>
      __$$_WebSessionModelCopyWithImpl<_$_WebSessionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebSessionModelToJson(this);
  }
}

abstract class _WebSessionModel extends WebSessionModel {
  factory _WebSessionModel(
      {final Keypair? keypair,
      final double? balance,
      final String? adnr,
      final bool isAuthenticated,
      final String timezoneName,
      final bool rememberMe}) = _$_WebSessionModel;
  _WebSessionModel._() : super._();

  factory _WebSessionModel.fromJson(Map<String, dynamic> json) =
      _$_WebSessionModel.fromJson;

  @override
  Keypair? get keypair => throw _privateConstructorUsedError;
  @override
  double? get balance => throw _privateConstructorUsedError;
  @override
  String? get adnr => throw _privateConstructorUsedError;
  @override
  bool get isAuthenticated => throw _privateConstructorUsedError;
  @override
  String get timezoneName => throw _privateConstructorUsedError;
  @override
  bool get rememberMe => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WebSessionModelCopyWith<_$_WebSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
