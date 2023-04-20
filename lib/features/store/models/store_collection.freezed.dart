// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreCollection _$StoreCollectionFromJson(Map<String, dynamic> json) {
  return _StoreCollection.fromJson(json);
}

/// @nodoc
mixin _$StoreCollection {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "logo_url")
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<Listing> get listings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCollectionCopyWith<StoreCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCollectionCopyWith<$Res> {
  factory $StoreCollectionCopyWith(
          StoreCollection value, $Res Function(StoreCollection) then) =
      _$StoreCollectionCopyWithImpl<$Res, StoreCollection>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String slug,
      String name,
      String description,
      @JsonKey(name: "logo_url") String? logoUrl,
      @JsonKey(defaultValue: []) List<Listing> listings});
}

/// @nodoc
class _$StoreCollectionCopyWithImpl<$Res, $Val extends StoreCollection>
    implements $StoreCollectionCopyWith<$Res> {
  _$StoreCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? slug = null,
    Object? name = null,
    Object? description = null,
    Object? logoUrl = freezed,
    Object? listings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      listings: null == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<Listing>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreCollectionCopyWith<$Res>
    implements $StoreCollectionCopyWith<$Res> {
  factory _$$_StoreCollectionCopyWith(
          _$_StoreCollection value, $Res Function(_$_StoreCollection) then) =
      __$$_StoreCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String slug,
      String name,
      String description,
      @JsonKey(name: "logo_url") String? logoUrl,
      @JsonKey(defaultValue: []) List<Listing> listings});
}

/// @nodoc
class __$$_StoreCollectionCopyWithImpl<$Res>
    extends _$StoreCollectionCopyWithImpl<$Res, _$_StoreCollection>
    implements _$$_StoreCollectionCopyWith<$Res> {
  __$$_StoreCollectionCopyWithImpl(
      _$_StoreCollection _value, $Res Function(_$_StoreCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? slug = null,
    Object? name = null,
    Object? description = null,
    Object? logoUrl = freezed,
    Object? listings = null,
  }) {
    return _then(_$_StoreCollection(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      listings: null == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<Listing>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreCollection extends _StoreCollection {
  _$_StoreCollection(
      {required this.id,
      required this.uuid,
      required this.slug,
      required this.name,
      required this.description,
      @JsonKey(name: "logo_url") this.logoUrl,
      @JsonKey(defaultValue: []) required final List<Listing> listings})
      : _listings = listings,
        super._();

  factory _$_StoreCollection.fromJson(Map<String, dynamic> json) =>
      _$$_StoreCollectionFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String slug;
  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: "logo_url")
  final String? logoUrl;
  final List<Listing> _listings;
  @override
  @JsonKey(defaultValue: [])
  List<Listing> get listings {
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listings);
  }

  @override
  String toString() {
    return 'StoreCollection(id: $id, uuid: $uuid, slug: $slug, name: $name, description: $description, logoUrl: $logoUrl, listings: $listings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreCollection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality().equals(other._listings, _listings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid, slug, name,
      description, logoUrl, const DeepCollectionEquality().hash(_listings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreCollectionCopyWith<_$_StoreCollection> get copyWith =>
      __$$_StoreCollectionCopyWithImpl<_$_StoreCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreCollectionToJson(
      this,
    );
  }
}

abstract class _StoreCollection extends StoreCollection {
  factory _StoreCollection(
          {required final int id,
          required final String uuid,
          required final String slug,
          required final String name,
          required final String description,
          @JsonKey(name: "logo_url") final String? logoUrl,
          @JsonKey(defaultValue: []) required final List<Listing> listings}) =
      _$_StoreCollection;
  _StoreCollection._() : super._();

  factory _StoreCollection.fromJson(Map<String, dynamic> json) =
      _$_StoreCollection.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get slug;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: "logo_url")
  String? get logoUrl;
  @override
  @JsonKey(defaultValue: [])
  List<Listing> get listings;
  @override
  @JsonKey(ignore: true)
  _$$_StoreCollectionCopyWith<_$_StoreCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
