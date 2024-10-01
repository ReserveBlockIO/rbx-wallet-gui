// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$PairCopyWithImpl<$Res, Pair>;
  @useResult
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
class _$PairCopyWithImpl<$Res, $Val extends Pair>
    implements $PairCopyWith<$Res> {
  _$PairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? network = null,
    Object? nftAddress = null,
    Object? description = null,
    Object? reason = null,
    Object? metadataUrl = null,
    Object? provenance = freezed,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      nftAddress: null == nftAddress
          ? _value.nftAddress
          : nftAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      metadataUrl: null == metadataUrl
          ? _value.metadataUrl
          : metadataUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provenance: freezed == provenance
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as Asset?,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Property>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res>? get provenance {
    if (_value.provenance == null) {
      return null;
    }

    return $AssetCopyWith<$Res>(_value.provenance!, (value) {
      return _then(_value.copyWith(provenance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PairCopyWith<$Res> implements $PairCopyWith<$Res> {
  factory _$$_PairCopyWith(_$_Pair value, $Res Function(_$_Pair) then) =
      __$$_PairCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_PairCopyWithImpl<$Res> extends _$PairCopyWithImpl<$Res, _$_Pair>
    implements _$$_PairCopyWith<$Res> {
  __$$_PairCopyWithImpl(_$_Pair _value, $Res Function(_$_Pair) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? network = null,
    Object? nftAddress = null,
    Object? description = null,
    Object? reason = null,
    Object? metadataUrl = null,
    Object? provenance = freezed,
    Object? properties = null,
  }) {
    return _then(_$_Pair(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      nftAddress: null == nftAddress
          ? _value.nftAddress
          : nftAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      metadataUrl: null == metadataUrl
          ? _value.metadataUrl
          : metadataUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provenance: freezed == provenance
          ? _value.provenance
          : provenance // ignore: cast_nullable_to_non_nullable
              as Asset?,
      properties: null == properties
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
      this.network = "VFX",
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
    if (_properties is EqualUnmodifiableListView) return _properties;
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.nftAddress, nftAddress) ||
                other.nftAddress == nftAddress) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.metadataUrl, metadataUrl) ||
                other.metadataUrl == metadataUrl) &&
            (identical(other.provenance, provenance) ||
                other.provenance == provenance) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      network,
      nftAddress,
      description,
      reason,
      metadataUrl,
      provenance,
      const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PairCopyWith<_$_Pair> get copyWith =>
      __$$_PairCopyWithImpl<_$_Pair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PairToJson(
      this,
    );
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
  String get id;
  @override
  String get network;
  @override
  String get nftAddress;
  @override
  String get description;
  @override
  String get reason;
  @override
  String get metadataUrl;
  @override
  Asset? get provenance;
  @override
  List<Property> get properties;
  @override
  @JsonKey(ignore: true)
  _$$_PairCopyWith<_$_Pair> get copyWith => throw _privateConstructorUsedError;
}
