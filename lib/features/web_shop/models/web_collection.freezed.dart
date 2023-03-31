// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebCollection _$WebCollectionFromJson(Map<String, dynamic> json) {
  return _WebCollection.fromJson(json);
}

/// @nodoc
mixin _$WebCollection {
  int get id => throw _privateConstructorUsedError;
  WebShop get shop => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebCollectionCopyWith<WebCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebCollectionCopyWith<$Res> {
  factory $WebCollectionCopyWith(
          WebCollection value, $Res Function(WebCollection) then) =
      _$WebCollectionCopyWithImpl<$Res, WebCollection>;
  @useResult
  $Res call({int id, WebShop shop, String name, String description});

  $WebShopCopyWith<$Res> get shop;
}

/// @nodoc
class _$WebCollectionCopyWithImpl<$Res, $Val extends WebCollection>
    implements $WebCollectionCopyWith<$Res> {
  _$WebCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shop = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shop: null == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as WebShop,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WebShopCopyWith<$Res> get shop {
    return $WebShopCopyWith<$Res>(_value.shop, (value) {
      return _then(_value.copyWith(shop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WebCollectionCopyWith<$Res>
    implements $WebCollectionCopyWith<$Res> {
  factory _$$_WebCollectionCopyWith(
          _$_WebCollection value, $Res Function(_$_WebCollection) then) =
      __$$_WebCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, WebShop shop, String name, String description});

  @override
  $WebShopCopyWith<$Res> get shop;
}

/// @nodoc
class __$$_WebCollectionCopyWithImpl<$Res>
    extends _$WebCollectionCopyWithImpl<$Res, _$_WebCollection>
    implements _$$_WebCollectionCopyWith<$Res> {
  __$$_WebCollectionCopyWithImpl(
      _$_WebCollection _value, $Res Function(_$_WebCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shop = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$_WebCollection(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shop: null == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as WebShop,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebCollection extends _WebCollection {
  _$_WebCollection(
      {required this.id,
      required this.shop,
      required this.name,
      required this.description})
      : super._();

  factory _$_WebCollection.fromJson(Map<String, dynamic> json) =>
      _$$_WebCollectionFromJson(json);

  @override
  final int id;
  @override
  final WebShop shop;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'WebCollection(id: $id, shop: $shop, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebCollection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shop, shop) || other.shop == shop) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shop, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebCollectionCopyWith<_$_WebCollection> get copyWith =>
      __$$_WebCollectionCopyWithImpl<_$_WebCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebCollectionToJson(
      this,
    );
  }
}

abstract class _WebCollection extends WebCollection {
  factory _WebCollection(
      {required final int id,
      required final WebShop shop,
      required final String name,
      required final String description}) = _$_WebCollection;
  _WebCollection._() : super._();

  factory _WebCollection.fromJson(Map<String, dynamic> json) =
      _$_WebCollection.fromJson;

  @override
  int get id;
  @override
  WebShop get shop;
  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_WebCollectionCopyWith<_$_WebCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
