// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: "StoreLive")
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
      _$StoreCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "StoreLive") bool isLive,
      @JsonKey(name: "IsDefault") bool isDefault});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  final Store _value;
  // ignore: unused_field
  final $Res Function(Store) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? isLive = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLive: isLive == freezed
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$_StoreCopyWith(_$_Store value, $Res Function(_$_Store) then) =
      __$$_StoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "StoreLive") bool isLive,
      @JsonKey(name: "IsDefault") bool isDefault});
}

/// @nodoc
class __$$_StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res>
    implements _$$_StoreCopyWith<$Res> {
  __$$_StoreCopyWithImpl(_$_Store _value, $Res Function(_$_Store) _then)
      : super(_value, (v) => _then(v as _$_Store));

  @override
  _$_Store get _value => super._value as _$_Store;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? isLive = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_$_Store(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLive: isLive == freezed
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: isDefault == freezed
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
      @JsonKey(name: "StoreLive") required this.isLive,
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
  @JsonKey(name: "StoreLive")
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.isLive, isLive) &&
            const DeepCollectionEquality().equals(other.isDefault, isDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isLive),
      const DeepCollectionEquality().hash(isDefault));

  @JsonKey(ignore: true)
  @override
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      __$$_StoreCopyWithImpl<_$_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreToJson(this);
  }
}

abstract class _Store extends Store {
  factory _Store(
      {@JsonKey(name: "Id") required final int id,
      @JsonKey(name: "Name") required final String name,
      @JsonKey(name: "Description") required final String description,
      @JsonKey(name: "StoreLive") required final bool isLive,
      @JsonKey(name: "IsDefault") required final bool isDefault}) = _$_Store;
  _Store._() : super._();

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "StoreLive")
  bool get isLive => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "IsDefault")
  bool get isDefault => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StoreCopyWith<_$_Store> get copyWith =>
      throw _privateConstructorUsedError;
}
