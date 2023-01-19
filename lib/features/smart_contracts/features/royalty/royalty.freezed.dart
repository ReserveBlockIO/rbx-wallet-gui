// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'royalty.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Royalty _$RoyaltyFromJson(Map<String, dynamic> json) {
  return _Royalty.fromJson(json);
}

/// @nodoc
mixin _$Royalty {
  String get id => throw _privateConstructorUsedError;
  RoyaltyType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoyaltyCopyWith<Royalty> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoyaltyCopyWith<$Res> {
  factory $RoyaltyCopyWith(Royalty value, $Res Function(Royalty) then) = _$RoyaltyCopyWithImpl<$Res>;
  $Res call({String id, RoyaltyType type, double amount, String address});
}

/// @nodoc
class _$RoyaltyCopyWithImpl<$Res> implements $RoyaltyCopyWith<$Res> {
  _$RoyaltyCopyWithImpl(this._value, this._then);

  final Royalty _value;
  // ignore: unused_field
  final $Res Function(Royalty) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoyaltyType,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RoyaltyCopyWith<$Res> implements $RoyaltyCopyWith<$Res> {
  factory _$$_RoyaltyCopyWith(_$_Royalty value, $Res Function(_$_Royalty) then) = __$$_RoyaltyCopyWithImpl<$Res>;
  @override
  $Res call({String id, RoyaltyType type, double amount, String address});
}

/// @nodoc
class __$$_RoyaltyCopyWithImpl<$Res> extends _$RoyaltyCopyWithImpl<$Res> implements _$$_RoyaltyCopyWith<$Res> {
  __$$_RoyaltyCopyWithImpl(_$_Royalty _value, $Res Function(_$_Royalty) _then) : super(_value, (v) => _then(v as _$_Royalty));

  @override
  _$_Royalty get _value => super._value as _$_Royalty;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? amount = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_Royalty(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoyaltyType,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Royalty extends _Royalty {
  const _$_Royalty({this.id = "", this.type = RoyaltyType.percent, this.amount = 0, this.address = ""}) : super._();

  factory _$_Royalty.fromJson(Map<String, dynamic> json) => _$$_RoyaltyFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final RoyaltyType type;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final String address;

  @override
  String toString() {
    return 'Royalty(id: $id, type: $type, amount: $amount, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Royalty &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(id), const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(amount), const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_RoyaltyCopyWith<_$_Royalty> get copyWith => __$$_RoyaltyCopyWithImpl<_$_Royalty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoyaltyToJson(this);
  }
}

abstract class _Royalty extends Royalty {
  const factory _Royalty({final String id, final RoyaltyType type, final double amount, final String address}) = _$_Royalty;
  const _Royalty._() : super._();

  factory _Royalty.fromJson(Map<String, dynamic> json) = _$_Royalty.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  RoyaltyType get type => throw _privateConstructorUsedError;
  @override
  double get amount => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RoyaltyCopyWith<_$_Royalty> get copyWith => throw _privateConstructorUsedError;
}
