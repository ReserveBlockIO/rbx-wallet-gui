// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$DetailedNftCopyWithImpl<$Res, DetailedNft>;
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContract") Nft nft,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  $NftCopyWith<$Res> get nft;
}

/// @nodoc
class _$DetailedNftCopyWithImpl<$Res, $Val extends DetailedNft>
    implements $DetailedNftCopyWith<$Res> {
  _$DetailedNftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nft = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NftCopyWith<$Res> get nft {
    return $NftCopyWith<$Res>(_value.nft, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
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
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContract") Nft nft,
      @JsonKey(name: "SmartContractCode", defaultValue: "") String code});

  @override
  $NftCopyWith<$Res> get nft;
}

/// @nodoc
class __$$_DetailedNftCopyWithImpl<$Res>
    extends _$DetailedNftCopyWithImpl<$Res, _$_DetailedNft>
    implements _$$_DetailedNftCopyWith<$Res> {
  __$$_DetailedNftCopyWithImpl(
      _$_DetailedNft _value, $Res Function(_$_DetailedNft) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nft = null,
    Object? code = null,
  }) {
    return _then(_$_DetailedNft(
      nft: null == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as Nft,
      code: null == code
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
            (identical(other.nft, nft) || other.nft == nft) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nft, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailedNftCopyWith<_$_DetailedNft> get copyWith =>
      __$$_DetailedNftCopyWithImpl<_$_DetailedNft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailedNftToJson(
      this,
    );
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
  Nft get nft;
  @override
  @JsonKey(name: "SmartContractCode", defaultValue: "")
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_DetailedNftCopyWith<_$_DetailedNft> get copyWith =>
      throw _privateConstructorUsedError;
}
