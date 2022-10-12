// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pair _$PairFromJson(Map<String, dynamic> json) {
  return _Pair.fromJson(json);
}

/// @nodoc
mixin _$Pair {
  String get id => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get nftAddress => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get metadataUrl => throw _privateConstructorUsedError;
  Asset? get provenance => throw _privateConstructorUsedError;
  List<Property> get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PairCopyWith<Pair> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairCopyWith<$Res> {
  factory $PairCopyWith(Pair value, $Res Function(Pair) then) =
      _$PairCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String network,
      String nftAddress,
      String description,
      String reason,
      String metadataUrl,
      Asset? provenance,
      List<Property> properties});

  $AssetCopyWith<$Res>? get provenance;
}

/// @nodoc
class _$PairCopyWithImpl<$Res> implements $PairCopyWith<$Res> {
  _$PairCopyWithImpl(this._value, this._then);

  final Pair _value;
  // ignore: unused_field
  final $Res Function(Pair) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? network = freezed,
    Object? nftAddress = freezed,
    Object? description = freezed,
    Object? reason = freezed,
    Object? metadataUrl = freezed,
    Object? provenance = freezed,
    Object? properties = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      nftAddress: nftAddress == freezed
          ? _value.nftAddress
          : nftAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      metadataUrl: metadataUrl == freezed
          ? _value.metadataUrl
          : metadataUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provenance: provenance == freezed
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as Asset?,
      properties: properties == freezed
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
    ));
  }

  @override
  $AssetCopyWith<$Res>? get provenance {
    if (_value.provenance == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.provenance!, (value) {
      return _then(_value.copyWith(provenance: value));
    });
  }
}

/// @nodoc
abstract class _$$_PairCopyWith<$Res> implements $PairCopyWith<$Res> {
  factory _$$_PairCopyWith(_$_Pair value, $Res Function(_$_Pair) then) =
      __$$_PairCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String network,
      String nftAddress,
      String description,
      String reason,
      String metadataUrl,
      Asset? provenance,
      List<Property> properties});

  @override
  $AssetCopyWith<$Res>? get provenance;
}

/// @nodoc
class __$$_PairCopyWithImpl<$Res> extends _$PairCopyWithImpl<$Res>
    implements _$$_PairCopyWith<$Res> {
  __$$_PairCopyWithImpl(_$_Pair _value, $Res Function(_$_Pair) _then)
      : super(_value, (v) => _then(v as _$_Pair));

  @override
  _$_Pair get _value => super._value as _$_Pair;

  @override
  $Res call({
    Object? id = freezed,
    Object? network = freezed,
    Object? nftAddress = freezed,
    Object? description = freezed,
    Object? reason = freezed,
    Object? metadataUrl = freezed,
    Object? provenance = freezed,
    Object? properties = freezed,
  }) {
    return _then(_$_Pair(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      network: network == freezed
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      nftAddress: nftAddress == freezed
          ? _value.nftAddress
          : nftAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      metadataUrl: metadataUrl == freezed
          ? _value.metadataUrl
          : metadataUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provenance: provenance == freezed
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as Asset?,
      properties: properties == freezed
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Pair extends _Pair {
  const _$_Pair(
      {this.id = "",
      this.network = "RBX",
      this.nftAddress = "",
      this.description = "",
      this.reason = "",
      this.metadataUrl = "",
      this.provenance,
      final List<Property> properties = const []})
      : _properties = properties,
        super._();

  factory _$_Pair.fromJson(Map<String, dynamic> json) => _$$_PairFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String network;
  @override
  @JsonKey()
  final String nftAddress;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String reason;
  @override
  @JsonKey()
  final String metadataUrl;
  @override
  final Asset? provenance;
  final List<Property> _properties;
  @override
  @JsonKey()
  List<Property> get properties {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  String toString() {
    return 'Pair(id: $id, network: $network, nftAddress: $nftAddress, description: $description, reason: $reason, metadataUrl: $metadataUrl, provenance: $provenance, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pair &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.network, network) &&
            const DeepCollectionEquality()
                .equals(other.nftAddress, nftAddress) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.reason, reason) &&
            const DeepCollectionEquality()
                .equals(other.metadataUrl, metadataUrl) &&
            const DeepCollectionEquality()
                .equals(other.provenance, provenance) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(network),
      const DeepCollectionEquality().hash(nftAddress),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(reason),
      const DeepCollectionEquality().hash(metadataUrl),
      const DeepCollectionEquality().hash(provenance),
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  _$$_PairCopyWith<_$_Pair> get copyWith =>
      __$$_PairCopyWithImpl<_$_Pair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PairToJson(this);
  }
}

abstract class _Pair extends Pair {
  const factory _Pair(
      {final String id,
      final String network,
      final String nftAddress,
      final String description,
      final String reason,
      final String metadataUrl,
      final Asset? provenance,
      final List<Property> properties}) = _$_Pair;
  const _Pair._() : super._();

  factory _Pair.fromJson(Map<String, dynamic> json) = _$_Pair.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get network => throw _privateConstructorUsedError;
  @override
  String get nftAddress => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get reason => throw _privateConstructorUsedError;
  @override
  String get metadataUrl => throw _privateConstructorUsedError;
  @override
  Asset? get provenance => throw _privateConstructorUsedError;
  @override
  List<Property> get properties => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PairCopyWith<_$_Pair> get copyWith => throw _privateConstructorUsedError;
}
