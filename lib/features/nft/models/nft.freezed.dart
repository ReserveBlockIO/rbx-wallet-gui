// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Nft _$NftFromJson(Map<String, dynamic> json) {
  return _Nft.fromJson(json);
}

/// @nodoc
class _$NftTearOff {
  const _$NftTearOff();

  _Nft call(
      {@JsonKey(name: "Name")
          required String name,
      @JsonKey(name: "Description")
          required String description,
      @JsonKey(name: "Address")
          required String address,
      @JsonKey(name: "MinterAddress")
          String minterAddress = "",
      @JsonKey(name: "MinterName")
          String minterName = "",
      @JsonKey(name: "SmartContractUID")
          required String id,
      @JsonKey(name: "Signature")
          String? signature,
      @JsonKey(name: "SmartContractAsset")
          required Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          required bool isPublic,
      @JsonKey(name: "IsMinter")
          required bool isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          required List<Map<String, dynamic>> features,
      String? code}) {
    return _Nft(
      name: name,
      description: description,
      address: address,
      minterAddress: minterAddress,
      minterName: minterName,
      id: id,
      signature: signature,
      primaryAsset: primaryAsset,
      isPublic: isPublic,
      isMinter: isMinter,
      features: features,
      code: code,
    );
  }

  Nft fromJson(Map<String, Object?> json) {
    return Nft.fromJson(json);
  }
}

/// @nodoc
const $Nft = _$NftTearOff();

/// @nodoc
mixin _$Nft {
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "MinterAddress")
  String get minterAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "MinterName")
  String get minterName => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractUID")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Signature")
  String? get signature => throw _privateConstructorUsedError;
  @JsonKey(name: "SmartContractAsset")
  Asset get primaryAsset => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPublic")
  bool get isPublic => throw _privateConstructorUsedError;
  @JsonKey(name: "IsMinter")
  bool get isMinter => throw _privateConstructorUsedError;
  @JsonKey(name: "Features", defaultValue: [])
  List<Map<String, dynamic>> get features => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NftCopyWith<Nft> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftCopyWith<$Res> {
  factory $NftCopyWith(Nft value, $Res Function(Nft) then) =
      _$NftCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Name")
          String name,
      @JsonKey(name: "Description")
          String description,
      @JsonKey(name: "Address")
          String address,
      @JsonKey(name: "MinterAddress")
          String minterAddress,
      @JsonKey(name: "MinterName")
          String minterName,
      @JsonKey(name: "SmartContractUID")
          String id,
      @JsonKey(name: "Signature")
          String? signature,
      @JsonKey(name: "SmartContractAsset")
          Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          bool isPublic,
      @JsonKey(name: "IsMinter")
          bool isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          List<Map<String, dynamic>> features,
      String? code});

  $AssetCopyWith<$Res> get primaryAsset;
}

/// @nodoc
class _$NftCopyWithImpl<$Res> implements $NftCopyWith<$Res> {
  _$NftCopyWithImpl(this._value, this._then);

  final Nft _value;
  // ignore: unused_field
  final $Res Function(Nft) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? minterAddress = freezed,
    Object? minterName = freezed,
    Object? id = freezed,
    Object? signature = freezed,
    Object? primaryAsset = freezed,
    Object? isPublic = freezed,
    Object? isMinter = freezed,
    Object? features = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      minterAddress: minterAddress == freezed
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isMinter: isMinter == freezed
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $AssetCopyWith<$Res> get primaryAsset {
    return $AssetCopyWith<$Res>(_value.primaryAsset, (value) {
      return _then(_value.copyWith(primaryAsset: value));
    });
  }
}

/// @nodoc
abstract class _$NftCopyWith<$Res> implements $NftCopyWith<$Res> {
  factory _$NftCopyWith(_Nft value, $Res Function(_Nft) then) =
      __$NftCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Name")
          String name,
      @JsonKey(name: "Description")
          String description,
      @JsonKey(name: "Address")
          String address,
      @JsonKey(name: "MinterAddress")
          String minterAddress,
      @JsonKey(name: "MinterName")
          String minterName,
      @JsonKey(name: "SmartContractUID")
          String id,
      @JsonKey(name: "Signature")
          String? signature,
      @JsonKey(name: "SmartContractAsset")
          Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          bool isPublic,
      @JsonKey(name: "IsMinter")
          bool isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          List<Map<String, dynamic>> features,
      String? code});

  @override
  $AssetCopyWith<$Res> get primaryAsset;
}

/// @nodoc
class __$NftCopyWithImpl<$Res> extends _$NftCopyWithImpl<$Res>
    implements _$NftCopyWith<$Res> {
  __$NftCopyWithImpl(_Nft _value, $Res Function(_Nft) _then)
      : super(_value, (v) => _then(v as _Nft));

  @override
  _Nft get _value => super._value as _Nft;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? minterAddress = freezed,
    Object? minterName = freezed,
    Object? id = freezed,
    Object? signature = freezed,
    Object? primaryAsset = freezed,
    Object? isPublic = freezed,
    Object? isMinter = freezed,
    Object? features = freezed,
    Object? code = freezed,
  }) {
    return _then(_Nft(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      minterAddress: minterAddress == freezed
          ? _value.minterAddress
          : minterAddress // ignore: cast_nullable_to_non_nullable
              as String,
      minterName: minterName == freezed
          ? _value.minterName
          : minterName // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      signature: signature == freezed
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAsset: primaryAsset == freezed
          ? _value.primaryAsset
          : primaryAsset // ignore: cast_nullable_to_non_nullable
              as Asset,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isMinter: isMinter == freezed
          ? _value.isMinter
          : isMinter // ignore: cast_nullable_to_non_nullable
              as bool,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Nft extends _Nft {
  _$_Nft(
      {@JsonKey(name: "Name") required this.name,
      @JsonKey(name: "Description") required this.description,
      @JsonKey(name: "Address") required this.address,
      @JsonKey(name: "MinterAddress") this.minterAddress = "",
      @JsonKey(name: "MinterName") this.minterName = "",
      @JsonKey(name: "SmartContractUID") required this.id,
      @JsonKey(name: "Signature") this.signature,
      @JsonKey(name: "SmartContractAsset") required this.primaryAsset,
      @JsonKey(name: "IsPublic") required this.isPublic,
      @JsonKey(name: "IsMinter") required this.isMinter,
      @JsonKey(name: "Features", defaultValue: []) required this.features,
      this.code})
      : super._();

  factory _$_Nft.fromJson(Map<String, dynamic> json) => _$$_NftFromJson(json);

  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "MinterAddress")
  final String minterAddress;
  @override
  @JsonKey(name: "MinterName")
  final String minterName;
  @override
  @JsonKey(name: "SmartContractUID")
  final String id;
  @override
  @JsonKey(name: "Signature")
  final String? signature;
  @override
  @JsonKey(name: "SmartContractAsset")
  final Asset primaryAsset;
  @override
  @JsonKey(name: "IsPublic")
  final bool isPublic;
  @override
  @JsonKey(name: "IsMinter")
  final bool isMinter;
  @override
  @JsonKey(name: "Features", defaultValue: [])
  final List<Map<String, dynamic>> features;
  @override
  final String? code;

  @override
  String toString() {
    return 'Nft(name: $name, description: $description, address: $address, minterAddress: $minterAddress, minterName: $minterName, id: $id, signature: $signature, primaryAsset: $primaryAsset, isPublic: $isPublic, isMinter: $isMinter, features: $features, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Nft &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.minterAddress, minterAddress) &&
            const DeepCollectionEquality()
                .equals(other.minterName, minterName) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            const DeepCollectionEquality()
                .equals(other.primaryAsset, primaryAsset) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality().equals(other.isMinter, isMinter) &&
            const DeepCollectionEquality().equals(other.features, features) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(minterAddress),
      const DeepCollectionEquality().hash(minterName),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(signature),
      const DeepCollectionEquality().hash(primaryAsset),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(isMinter),
      const DeepCollectionEquality().hash(features),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$NftCopyWith<_Nft> get copyWith =>
      __$NftCopyWithImpl<_Nft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NftToJson(this);
  }
}

abstract class _Nft extends Nft {
  factory _Nft(
      {@JsonKey(name: "Name")
          required String name,
      @JsonKey(name: "Description")
          required String description,
      @JsonKey(name: "Address")
          required String address,
      @JsonKey(name: "MinterAddress")
          String minterAddress,
      @JsonKey(name: "MinterName")
          String minterName,
      @JsonKey(name: "SmartContractUID")
          required String id,
      @JsonKey(name: "Signature")
          String? signature,
      @JsonKey(name: "SmartContractAsset")
          required Asset primaryAsset,
      @JsonKey(name: "IsPublic")
          required bool isPublic,
      @JsonKey(name: "IsMinter")
          required bool isMinter,
      @JsonKey(name: "Features", defaultValue: [])
          required List<Map<String, dynamic>> features,
      String? code}) = _$_Nft;
  _Nft._() : super._();

  factory _Nft.fromJson(Map<String, dynamic> json) = _$_Nft.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "MinterAddress")
  String get minterAddress;
  @override
  @JsonKey(name: "MinterName")
  String get minterName;
  @override
  @JsonKey(name: "SmartContractUID")
  String get id;
  @override
  @JsonKey(name: "Signature")
  String? get signature;
  @override
  @JsonKey(name: "SmartContractAsset")
  Asset get primaryAsset;
  @override
  @JsonKey(name: "IsPublic")
  bool get isPublic;
  @override
  @JsonKey(name: "IsMinter")
  bool get isMinter;
  @override
  @JsonKey(name: "Features", defaultValue: [])
  List<Map<String, dynamic>> get features;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$NftCopyWith<_Nft> get copyWith => throw _privateConstructorUsedError;
}
