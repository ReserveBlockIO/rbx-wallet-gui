// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soul_bound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SoulBound _$SoulBoundFromJson(Map<String, dynamic> json) {
  return _SoulBound.fromJson(json);
}

/// @nodoc
mixin _$SoulBound {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get ownerAddress => throw _privateConstructorUsedError;
  String? get beneficiaryAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoulBoundCopyWith<SoulBound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoulBoundCopyWith<$Res> {
  factory $SoulBoundCopyWith(SoulBound value, $Res Function(SoulBound) then) =
      _$SoulBoundCopyWithImpl<$Res, SoulBound>;
  @useResult
  $Res call(
      {String id,
      double amount,
      String ownerAddress,
      String? beneficiaryAddress});
}

/// @nodoc
class _$SoulBoundCopyWithImpl<$Res, $Val extends SoulBound>
    implements $SoulBoundCopyWith<$Res> {
  _$SoulBoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? ownerAddress = null,
    Object? beneficiaryAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryAddress: freezed == beneficiaryAddress
          ? _value.beneficiaryAddress
          : beneficiaryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SoulBoundCopyWith<$Res> implements $SoulBoundCopyWith<$Res> {
  factory _$$_SoulBoundCopyWith(
          _$_SoulBound value, $Res Function(_$_SoulBound) then) =
      __$$_SoulBoundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      String ownerAddress,
      String? beneficiaryAddress});
}

/// @nodoc
class __$$_SoulBoundCopyWithImpl<$Res>
    extends _$SoulBoundCopyWithImpl<$Res, _$_SoulBound>
    implements _$$_SoulBoundCopyWith<$Res> {
  __$$_SoulBoundCopyWithImpl(
      _$_SoulBound _value, $Res Function(_$_SoulBound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? ownerAddress = null,
    Object? beneficiaryAddress = freezed,
  }) {
    return _then(_$_SoulBound(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryAddress: freezed == beneficiaryAddress
          ? _value.beneficiaryAddress
          : beneficiaryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SoulBound extends _SoulBound {
  const _$_SoulBound(
      {this.id = "",
      this.amount = 0,
      this.ownerAddress = "",
      this.beneficiaryAddress})
      : super._();

  factory _$_SoulBound.fromJson(Map<String, dynamic> json) =>
      _$$_SoulBoundFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final String ownerAddress;
  @override
  final String? beneficiaryAddress;

  @override
  String toString() {
    return 'SoulBound(id: $id, amount: $amount, ownerAddress: $ownerAddress, beneficiaryAddress: $beneficiaryAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SoulBound &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.beneficiaryAddress, beneficiaryAddress) ||
                other.beneficiaryAddress == beneficiaryAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, amount, ownerAddress, beneficiaryAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SoulBoundCopyWith<_$_SoulBound> get copyWith =>
      __$$_SoulBoundCopyWithImpl<_$_SoulBound>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SoulBoundToJson(
      this,
    );
  }
}

abstract class _SoulBound extends SoulBound {
  const factory _SoulBound(
      {final String id,
      final double amount,
      final String ownerAddress,
      final String? beneficiaryAddress}) = _$_SoulBound;
  const _SoulBound._() : super._();

  factory _SoulBound.fromJson(Map<String, dynamic> json) =
      _$_SoulBound.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  String get ownerAddress;
  @override
  String? get beneficiaryAddress;
  @override
  @JsonKey(ignore: true)
  _$$_SoulBoundCopyWith<_$_SoulBound> get copyWith =>
      throw _privateConstructorUsedError;
}
