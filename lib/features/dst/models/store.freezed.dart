// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "CollectionLive")
  bool get isLive => throw _privateConstructorUsedError;
  @JsonKey(name: "IsDefault")
  bool get isDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "CollectionLive") bool isLive,
      @JsonKey(name: "IsDefault") bool isDefault});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? isLive = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$_StoreCopyWith(_$_Store value, $Res Function(_$_Store) then) =
      __$$_StoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "CollectionLive") bool isLive,
      @JsonKey(name: "IsDefault") bool isDefault});
}

/// @nodoc
class __$$_StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res, _$_Store>
    implements _$$_StoreCopyWith<$Res> {
  __$$_StoreCopyWithImpl(_$_Store _value, $Res Function(_$_Store) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? isLive = null,
    Object? isDefault = null,
  }) {
    return _then(_$_Store(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Store extends _Store {
  _$_Store(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "Name") required this.name,
      @JsonKey(name: "Description") required this.description,
      @JsonKey(name: "CollectionLive") required this.isLive,
      @JsonKey(name: "IsDefault") required this.isDefault})
      : super._();

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$$_StoreFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "CollectionLive")
  final bool isLive;
  @override
  @JsonKey(name: "IsDefault")
  final bool isDefault;

  @override
  String toString() {
    return 'Store(id: $id, name: $name, description: $description, isLive: $isLive, isDefault: $isDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Store &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, isLive, isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      __$$_StoreCopyWithImpl<_$_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreToJson(
      this,
    );
  }
}

abstract class _Store extends Store {
  factory _Store(
      {@JsonKey(name: "Id") required final int id,
      @JsonKey(name: "Name") required final String name,
      @JsonKey(name: "Description") required final String description,
      @JsonKey(name: "CollectionLive") required final bool isLive,
      @JsonKey(name: "IsDefault") required final bool isDefault}) = _$_Store;
  _Store._() : super._();

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "CollectionLive")
  bool get isLive;
  @override
  @JsonKey(name: "IsDefault")
  bool get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      throw _privateConstructorUsedError;
}
