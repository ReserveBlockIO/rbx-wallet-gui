// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dec_shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DecShop _$DecShopFromJson(Map<String, dynamic> json) {
  return _DecShop.fromJson(json);
}

/// @nodoc
mixin _$DecShop {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "UniqueId")
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "DecShopURL")
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "IP")
  String? get ip => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockHeight")
  int? get blockHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "DecShopHostingType")
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: "NeedsPublishToNetwork")
  bool get needsPublishToNetwork => throw _privateConstructorUsedError;
  @JsonKey(name: "IsOffline")
  bool get isOffline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DecShopCopyWith<DecShop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecShopCopyWith<$Res> {
  factory $DecShopCopyWith(DecShop value, $Res Function(DecShop) then) =
      _$DecShopCopyWithImpl<$Res, DecShop>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "UniqueId") String uuid,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "DecShopURL") String url,
      @JsonKey(name: "IP") String? ip,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "BlockHeight") int? blockHeight,
      @JsonKey(name: "DecShopHostingType") int type,
      @JsonKey(name: "NeedsPublishToNetwork") bool needsPublishToNetwork,
      @JsonKey(name: "IsOffline") bool isOffline});
}

/// @nodoc
class _$DecShopCopyWithImpl<$Res, $Val extends DecShop>
    implements $DecShopCopyWith<$Res> {
  _$DecShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? url = null,
    Object? ip = freezed,
    Object? description = null,
    Object? address = null,
    Object? blockHeight = freezed,
    Object? type = null,
    Object? needsPublishToNetwork = null,
    Object? isOffline = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: freezed == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      needsPublishToNetwork: null == needsPublishToNetwork
          ? _value.needsPublishToNetwork
          : needsPublishToNetwork // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DecShopCopyWith<$Res> implements $DecShopCopyWith<$Res> {
  factory _$$_DecShopCopyWith(
          _$_DecShop value, $Res Function(_$_DecShop) then) =
      __$$_DecShopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "UniqueId") String uuid,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "DecShopURL") String url,
      @JsonKey(name: "IP") String? ip,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "Address") String address,
      @JsonKey(name: "BlockHeight") int? blockHeight,
      @JsonKey(name: "DecShopHostingType") int type,
      @JsonKey(name: "NeedsPublishToNetwork") bool needsPublishToNetwork,
      @JsonKey(name: "IsOffline") bool isOffline});
}

/// @nodoc
class __$$_DecShopCopyWithImpl<$Res>
    extends _$DecShopCopyWithImpl<$Res, _$_DecShop>
    implements _$$_DecShopCopyWith<$Res> {
  __$$_DecShopCopyWithImpl(_$_DecShop _value, $Res Function(_$_DecShop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? url = null,
    Object? ip = freezed,
    Object? description = null,
    Object? address = null,
    Object? blockHeight = freezed,
    Object? type = null,
    Object? needsPublishToNetwork = null,
    Object? isOffline = null,
  }) {
    return _then(_$_DecShop(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      ip: freezed == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      blockHeight: freezed == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      needsPublishToNetwork: null == needsPublishToNetwork
          ? _value.needsPublishToNetwork
          : needsPublishToNetwork // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DecShop extends _DecShop {
  _$_DecShop(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "UniqueId")
          required this.uuid,
      @JsonKey(name: "Name")
          required this.name,
      @JsonKey(name: "DecShopURL")
          required this.url,
      @JsonKey(name: "IP")
          this.ip,
      @JsonKey(name: "Description")
          required this.description,
      @JsonKey(name: "Address")
          required this.address,
      @JsonKey(name: "BlockHeight")
          this.blockHeight,
      @JsonKey(name: "DecShopHostingType")
          required this.type,
      @JsonKey(name: "NeedsPublishToNetwork")
          required this.needsPublishToNetwork,
      @JsonKey(name: "IsOffline")
          required this.isOffline})
      : super._();

  factory _$_DecShop.fromJson(Map<String, dynamic> json) =>
      _$$_DecShopFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "UniqueId")
  final String uuid;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "DecShopURL")
  final String url;
  @override
  @JsonKey(name: "IP")
  final String? ip;
  @override
  @JsonKey(name: "Description")
  final String description;
  @override
  @JsonKey(name: "Address")
  final String address;
  @override
  @JsonKey(name: "BlockHeight")
  final int? blockHeight;
  @override
  @JsonKey(name: "DecShopHostingType")
  final int type;
  @override
  @JsonKey(name: "NeedsPublishToNetwork")
  final bool needsPublishToNetwork;
  @override
  @JsonKey(name: "IsOffline")
  final bool isOffline;

  @override
  String toString() {
    return 'DecShop(id: $id, uuid: $uuid, name: $name, url: $url, ip: $ip, description: $description, address: $address, blockHeight: $blockHeight, type: $type, needsPublishToNetwork: $needsPublishToNetwork, isOffline: $isOffline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DecShop &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.needsPublishToNetwork, needsPublishToNetwork) ||
                other.needsPublishToNetwork == needsPublishToNetwork) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      name,
      url,
      ip,
      description,
      address,
      blockHeight,
      type,
      needsPublishToNetwork,
      isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DecShopCopyWith<_$_DecShop> get copyWith =>
      __$$_DecShopCopyWithImpl<_$_DecShop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DecShopToJson(
      this,
    );
  }
}

abstract class _DecShop extends DecShop {
  factory _DecShop(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "UniqueId")
          required final String uuid,
      @JsonKey(name: "Name")
          required final String name,
      @JsonKey(name: "DecShopURL")
          required final String url,
      @JsonKey(name: "IP")
          final String? ip,
      @JsonKey(name: "Description")
          required final String description,
      @JsonKey(name: "Address")
          required final String address,
      @JsonKey(name: "BlockHeight")
          final int? blockHeight,
      @JsonKey(name: "DecShopHostingType")
          required final int type,
      @JsonKey(name: "NeedsPublishToNetwork")
          required final bool needsPublishToNetwork,
      @JsonKey(name: "IsOffline")
          required final bool isOffline}) = _$_DecShop;
  _DecShop._() : super._();

  factory _DecShop.fromJson(Map<String, dynamic> json) = _$_DecShop.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "UniqueId")
  String get uuid;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "DecShopURL")
  String get url;
  @override
  @JsonKey(name: "IP")
  String? get ip;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override
  @JsonKey(name: "Address")
  String get address;
  @override
  @JsonKey(name: "BlockHeight")
  int? get blockHeight;
  @override
  @JsonKey(name: "DecShopHostingType")
  int get type;
  @override
  @JsonKey(name: "NeedsPublishToNetwork")
  bool get needsPublishToNetwork;
  @override
  @JsonKey(name: "IsOffline")
  bool get isOffline;
  @override
  @JsonKey(ignore: true)
  _$$_DecShopCopyWith<_$_DecShop> get copyWith =>
      throw _privateConstructorUsedError;
}
