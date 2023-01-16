// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  $SoulBoundCopyWith<SoulBound> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoulBoundCopyWith<$Res> {
  factory $SoulBoundCopyWith(SoulBound value, $Res Function(SoulBound) then) = _$SoulBoundCopyWithImpl<$Res>;
  $Res call({String id, double amount, String ownerAddress, String? beneficiaryAddress});
}

/// @nodoc
class _$SoulBoundCopyWithImpl<$Res> implements $SoulBoundCopyWith<$Res> {
  _$SoulBoundCopyWithImpl(this._value, this._then);

  final SoulBound _value;
  // ignore: unused_field
  final $Res Function(SoulBound) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? ownerAddress = freezed,
    Object? beneficiaryAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      ownerAddress: ownerAddress == freezed
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryAddress: beneficiaryAddress == freezed
          ? _value.beneficiaryAddress
          : beneficiaryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SoulBoundCopyWith<$Res> implements $SoulBoundCopyWith<$Res> {
  factory _$$_SoulBoundCopyWith(_$_SoulBound value, $Res Function(_$_SoulBound) then) = __$$_SoulBoundCopyWithImpl<$Res>;
  @override
  $Res call({String id, double amount, String ownerAddress, String? beneficiaryAddress});
}

/// @nodoc
class __$$_SoulBoundCopyWithImpl<$Res> extends _$SoulBoundCopyWithImpl<$Res> implements _$$_SoulBoundCopyWith<$Res> {
  __$$_SoulBoundCopyWithImpl(_$_SoulBound _value, $Res Function(_$_SoulBound) _then) : super(_value, (v) => _then(v as _$_SoulBound));

  @override
  _$_SoulBound get _value => super._value as _$_SoulBound;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? ownerAddress = freezed,
    Object? beneficiaryAddress = freezed,
  }) {
    return _then(_$_SoulBound(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      ownerAddress: ownerAddress == freezed
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryAddress: beneficiaryAddress == freezed
          ? _value.beneficiaryAddress
          : beneficiaryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SoulBound extends _SoulBound {
  const _$_SoulBound({this.id = "", this.amount = 0, this.ownerAddress = "", this.beneficiaryAddress}) : super._();

  factory _$_SoulBound.fromJson(Map<String, dynamic> json) => _$$_SoulBoundFromJson(json);

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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.ownerAddress, ownerAddress) &&
            const DeepCollectionEquality().equals(other.beneficiaryAddress, beneficiaryAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(id), const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(ownerAddress), const DeepCollectionEquality().hash(beneficiaryAddress));

  @JsonKey(ignore: true)
  @override
  _$$_SoulBoundCopyWith<_$_SoulBound> get copyWith => __$$_SoulBoundCopyWithImpl<_$_SoulBound>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SoulBoundToJson(this);
  }
}

abstract class _SoulBound extends SoulBound {
  const factory _SoulBound({final String id, final double amount, final String ownerAddress, final String? beneficiaryAddress}) = _$_SoulBound;
  const _SoulBound._() : super._();

  factory _SoulBound.fromJson(Map<String, dynamic> json) = _$_SoulBound.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  double get amount => throw _privateConstructorUsedError;
  @override
  String get ownerAddress => throw _privateConstructorUsedError;
  @override
  String? get beneficiaryAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SoulBoundCopyWith<_$_SoulBound> get copyWith => throw _privateConstructorUsedError;
}
