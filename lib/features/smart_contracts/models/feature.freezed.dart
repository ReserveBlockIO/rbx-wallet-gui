// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feature _$FeatureFromJson(Map<String, dynamic> json) {
  return _Feature.fromJson(json);
}

/// @nodoc
class _$FeatureTearOff {
  const _$FeatureTearOff();

  _Feature call(
      {FeatureType type = FeatureType.royalty,
      Map<String, dynamic> data = const {}}) {
    return _Feature(
      type: type,
      data: data,
    );
  }

  Feature fromJson(Map<String, Object?> json) {
    return Feature.fromJson(json);
  }
}

/// @nodoc
const $Feature = _$FeatureTearOff();

/// @nodoc
mixin _$Feature {
  FeatureType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureCopyWith<Feature> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureCopyWith<$Res> {
  factory $FeatureCopyWith(Feature value, $Res Function(Feature) then) =
      _$FeatureCopyWithImpl<$Res>;
  $Res call({FeatureType type, Map<String, dynamic> data});
}

/// @nodoc
class _$FeatureCopyWithImpl<$Res> implements $FeatureCopyWith<$Res> {
  _$FeatureCopyWithImpl(this._value, this._then);

  final Feature _value;
  // ignore: unused_field
  final $Res Function(Feature) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeatureType,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$FeatureCopyWith<$Res> implements $FeatureCopyWith<$Res> {
  factory _$FeatureCopyWith(_Feature value, $Res Function(_Feature) then) =
      __$FeatureCopyWithImpl<$Res>;
  @override
  $Res call({FeatureType type, Map<String, dynamic> data});
}

/// @nodoc
class __$FeatureCopyWithImpl<$Res> extends _$FeatureCopyWithImpl<$Res>
    implements _$FeatureCopyWith<$Res> {
  __$FeatureCopyWithImpl(_Feature _value, $Res Function(_Feature) _then)
      : super(_value, (v) => _then(v as _Feature));

  @override
  _Feature get _value => super._value as _Feature;

  @override
  $Res call({
    Object? type = freezed,
    Object? data = freezed,
  }) {
    return _then(_Feature(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeatureType,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Feature extends _Feature {
  _$_Feature({this.type = FeatureType.royalty, this.data = const {}})
      : super._();

  factory _$_Feature.fromJson(Map<String, dynamic> json) =>
      _$$_FeatureFromJson(json);

  @JsonKey(defaultValue: FeatureType.royalty)
  @override
  final FeatureType type;
  @JsonKey(defaultValue: const {})
  @override
  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'Feature(type: $type, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Feature &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$FeatureCopyWith<_Feature> get copyWith =>
      __$FeatureCopyWithImpl<_Feature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeatureToJson(this);
  }
}

abstract class _Feature extends Feature {
  factory _Feature({FeatureType type, Map<String, dynamic> data}) = _$_Feature;
  _Feature._() : super._();

  factory _Feature.fromJson(Map<String, dynamic> json) = _$_Feature.fromJson;

  @override
  FeatureType get type;
  @override
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$FeatureCopyWith<_Feature> get copyWith =>
      throw _privateConstructorUsedError;
}
