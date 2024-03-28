// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'btc_utxo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BtcUtxo _$BtcUtxoFromJson(Map<String, dynamic> json) {
  return _BtcUtxo.fromJson(json);
}

/// @nodoc
mixin _$BtcUtxo {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "TxId")
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: "Value")
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: "Vout")
  int get vout => throw _privateConstructorUsedError;
  @JsonKey(name: "IsUsed")
  bool get isUsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BtcUtxoCopyWith<BtcUtxo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BtcUtxoCopyWith<$Res> {
  factory $BtcUtxoCopyWith(BtcUtxo value, $Res Function(BtcUtxo) then) =
      _$BtcUtxoCopyWithImpl<$Res, BtcUtxo>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "TxId") String hash,
      @JsonKey(name: "Value") int value,
      @JsonKey(name: "Vout") int vout,
      @JsonKey(name: "IsUsed") bool isUsed});
}

/// @nodoc
class _$BtcUtxoCopyWithImpl<$Res, $Val extends BtcUtxo>
    implements $BtcUtxoCopyWith<$Res> {
  _$BtcUtxoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? hash = null,
    Object? value = null,
    Object? vout = null,
    Object? isUsed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BtcUtxoCopyWith<$Res> implements $BtcUtxoCopyWith<$Res> {
  factory _$$_BtcUtxoCopyWith(
          _$_BtcUtxo value, $Res Function(_$_BtcUtxo) then) =
      __$$_BtcUtxoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "TxId") String hash,
      @JsonKey(name: "Value") int value,
      @JsonKey(name: "Vout") int vout,
      @JsonKey(name: "IsUsed") bool isUsed});
}

/// @nodoc
class __$$_BtcUtxoCopyWithImpl<$Res>
    extends _$BtcUtxoCopyWithImpl<$Res, _$_BtcUtxo>
    implements _$$_BtcUtxoCopyWith<$Res> {
  __$$_BtcUtxoCopyWithImpl(_$_BtcUtxo _value, $Res Function(_$_BtcUtxo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? hash = null,
    Object? value = null,
    Object? vout = null,
    Object? isUsed = null,
  }) {
    return _then(_$_BtcUtxo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BtcUtxo extends _BtcUtxo {
  _$_BtcUtxo(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "TxId") required this.hash,
      @JsonKey(name: "Value") required this.value,
      @JsonKey(name: "Vout") required this.vout,
      @JsonKey(name: "IsUsed") required this.isUsed})
      : super._();

  factory _$_BtcUtxo.fromJson(Map<String, dynamic> json) =>
      _$$_BtcUtxoFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "TxId")
  final String hash;
  @override
  @JsonKey(name: "Value")
  final int value;
  @override
  @JsonKey(name: "Vout")
  final int vout;
  @override
  @JsonKey(name: "IsUsed")
  final bool isUsed;

  @override
  String toString() {
    return 'BtcUtxo(id: $id, address: $address, hash: $hash, value: $value, vout: $vout, isUsed: $isUsed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BtcUtxo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.vout, vout) || other.vout == vout) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, address, hash, value, vout, isUsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BtcUtxoCopyWith<_$_BtcUtxo> get copyWith =>
      __$$_BtcUtxoCopyWithImpl<_$_BtcUtxo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BtcUtxoToJson(
      this,
    );
  }
}

abstract class _BtcUtxo extends BtcUtxo {
  factory _BtcUtxo(
      {@JsonKey(name: "Id") required final int id,
      @JsonKey(name: "Address") required final String address,
      @JsonKey(name: "TxId") required final String hash,
      @JsonKey(name: "Value") required final int value,
      @JsonKey(name: "Vout") required final int vout,
      @JsonKey(name: "IsUsed") required final bool isUsed}) = _$_BtcUtxo;
  _BtcUtxo._() : super._();

  factory _BtcUtxo.fromJson(Map<String, dynamic> json) = _$_BtcUtxo.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "TxId")
  String get hash;
  @override
  @JsonKey(name: "Value")
  int get value;
  @override
  @JsonKey(name: "Vout")
  int get vout;
  @override
  @JsonKey(name: "IsUsed")
  bool get isUsed;
  @override
  @JsonKey(ignore: true)
  _$$_BtcUtxoCopyWith<_$_BtcUtxo> get copyWith =>
      throw _privateConstructorUsedError;
}
