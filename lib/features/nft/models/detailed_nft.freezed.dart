// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'detailed_nft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailedNft _$DetailedNftFromJson(Map<String, dynamic> json) {
  return _DetailedNft.fromJson(json);
}

/// @nodoc
mixin _$DetailedNft {
  @JsonKey(name: "SmartContract")
  Nft get nft => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractCode", defaultValue: "")
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedNftCopyWith<DetailedNft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedNftCopyWith<$Res> {
  factory $DetailedNftCopyWith(
          DetailedNft value, $Res Function(DetailedNft) then) =
      _$DetailedNftCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "SmartContract") Nft nft,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  $NftCopyWith<$Res> get nft;
}

/// @nodoc
class _$DetailedNftCopyWithImpl<$Res> implements $DetailedNftCopyWith<$Res> {
  _$DetailedNftCopyWithImpl(this._value, this._then);

  final DetailedNft _value;
  // ignore: unused_field
  final $Res Function(DetailedNft) _then;

  @override
  $Res call({
    Object? nft = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      nft: nft == freezed
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $NftCopyWith<$Res> get nft {
    return $NftCopyWith<$Res>(_value.nft, (value) {
      return _then(_value.copyWith(nft: value));
    });
  }
}

/// @nodoc
abstract class _$$_DetailedNftCopyWith<$Res>
    implements $DetailedNftCopyWith<$Res> {
  factory _$$_DetailedNftCopyWith(
          _$_DetailedNft value, $Res Function(_$_DetailedNft) then) =
      __$$_DetailedNftCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "SmartContract") Nft nft,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  @override
  $NftCopyWith<$Res> get nft;
}

/// @nodoc
class __$$_DetailedNftCopyWithImpl<$Res> extends _$DetailedNftCopyWithImpl<$Res>
    implements _$$_DetailedNftCopyWith<$Res> {
  __$$_DetailedNftCopyWithImpl(
      _$_DetailedNft _value, $Res Function(_$_DetailedNft) _then)
      : super(_value, (v) => _then(v as _$_DetailedNft));

  @override
  _$_DetailedNft get _value => super._value as _$_DetailedNft;

  @override
  $Res call({
    Object? nft = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_DetailedNft(
      nft: nft == freezed
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailedNft extends _DetailedNft {
  _$_DetailedNft(
      {@JsonKey(name: "SmartContract") required this.nft,
      @JsonKey(name: "SmartContractCode", defaultValue: "") required this.code})
      : super._();

  factory _$_DetailedNft.fromJson(Map<String, dynamic> json) =>
      _$$_DetailedNftFromJson(json);

  @override
  @JsonKey(name: "SmartContract")
  final Nft nft;
  @override
  @JsonKey(name: "SmartContractCode", defaultValue: "")
  final String code;

  @override
  String toString() {
    return 'DetailedNft(nft: $nft, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailedNft &&
            const DeepCollectionEquality().equals(other.nft, nft) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nft),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$$_DetailedNftCopyWith<_$_DetailedNft> get copyWith =>
      __$$_DetailedNftCopyWithImpl<_$_DetailedNft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailedNftToJson(this);
  }
}

abstract class _DetailedNft extends DetailedNft {
  factory _DetailedNft(
      {@JsonKey(name: "SmartContract")
          required final Nft nft,
      @JsonKey(name: "SmartContractCode", defaultValue: "")
          required final String code}) = _$_DetailedNft;
  _DetailedNft._() : super._();

  factory _DetailedNft.fromJson(Map<String, dynamic> json) =
      _$_DetailedNft.fromJson;

  @override
  @JsonKey(name: "SmartContract")
  Nft get nft => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "SmartContractCode", defaultValue: "")
  String get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DetailedNftCopyWith<_$_DetailedNft> get copyWith =>
      throw _privateConstructorUsedError;
}
