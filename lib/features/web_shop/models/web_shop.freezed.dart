// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebShop _$WebShopFromJson(Map<String, dynamic> json) {
  return _WebShop.fromJson(json);
}

/// @nodoc
mixin _$WebShop {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'unique_id')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_address')
  String get ownerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_offline')
  bool get isOffline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebShopCopyWith<WebShop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebShopCopyWith<$Res> {
  factory $WebShopCopyWith(WebShop value, $Res Function(WebShop) then) =
      _$WebShopCopyWithImpl<$Res, WebShop>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String url,
      @JsonKey(name: 'unique_id') String uid,
      @JsonKey(name: 'owner_address') String ownerAddress,
      @JsonKey(name: 'is_offline') bool isOffline});
}

/// @nodoc
class _$WebShopCopyWithImpl<$Res, $Val extends WebShop>
    implements $WebShopCopyWith<$Res> {
  _$WebShopCopyWithImpl(this._value, this._then);

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
    Object? url = null,
    Object? uid = null,
    Object? ownerAddress = null,
    Object? isOffline = null,
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebShopCopyWith<$Res> implements $WebShopCopyWith<$Res> {
  factory _$$_WebShopCopyWith(
          _$_WebShop value, $Res Function(_$_WebShop) then) =
      __$$_WebShopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String url,
      @JsonKey(name: 'unique_id') String uid,
      @JsonKey(name: 'owner_address') String ownerAddress,
      @JsonKey(name: 'is_offline') bool isOffline});
}

/// @nodoc
class __$$_WebShopCopyWithImpl<$Res>
    extends _$WebShopCopyWithImpl<$Res, _$_WebShop>
    implements _$$_WebShopCopyWith<$Res> {
  __$$_WebShopCopyWithImpl(_$_WebShop _value, $Res Function(_$_WebShop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = null,
    Object? uid = null,
    Object? ownerAddress = null,
    Object? isOffline = null,
  }) {
    return _then(_$_WebShop(
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
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebShop extends _WebShop with DiagnosticableTreeMixin {
  _$_WebShop(
      {required this.id,
      required this.name,
      required this.description,
      required this.url,
      @JsonKey(name: 'unique_id') required this.uid,
      @JsonKey(name: 'owner_address') required this.ownerAddress,
      @JsonKey(name: 'is_offline') required this.isOffline})
      : super._();

  factory _$_WebShop.fromJson(Map<String, dynamic> json) =>
      _$$_WebShopFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String url;
  @override
  @JsonKey(name: 'unique_id')
  final String uid;
  @override
  @JsonKey(name: 'owner_address')
  final String ownerAddress;
  @override
  @JsonKey(name: 'is_offline')
  final bool isOffline;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WebShop(id: $id, name: $name, description: $description, url: $url, uid: $uid, ownerAddress: $ownerAddress, isOffline: $isOffline)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WebShop'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('ownerAddress', ownerAddress))
      ..add(DiagnosticsProperty('isOffline', isOffline));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebShop &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, url, uid, ownerAddress, isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebShopCopyWith<_$_WebShop> get copyWith =>
      __$$_WebShopCopyWithImpl<_$_WebShop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebShopToJson(
      this,
    );
  }
}

abstract class _WebShop extends WebShop {
  factory _WebShop(
      {required final int id,
      required final String name,
      required final String description,
      required final String url,
      @JsonKey(name: 'unique_id') required final String uid,
      @JsonKey(name: 'owner_address') required final String ownerAddress,
      @JsonKey(name: 'is_offline') required final bool isOffline}) = _$_WebShop;
  _WebShop._() : super._();

  factory _WebShop.fromJson(Map<String, dynamic> json) = _$_WebShop.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get url;
  @override
  @JsonKey(name: 'unique_id')
  String get uid;
  @override
  @JsonKey(name: 'owner_address')
  String get ownerAddress;
  @override
  @JsonKey(name: 'is_offline')
  bool get isOffline;
  @override
  @JsonKey(ignore: true)
  _$$_WebShopCopyWith<_$_WebShop> get copyWith =>
      throw _privateConstructorUsedError;
}
