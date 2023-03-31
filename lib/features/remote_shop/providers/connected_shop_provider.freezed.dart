// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_shop_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectedShop {
  String? get url => throw _privateConstructorUsedError;
  DecShop? get decShop => throw _privateConstructorUsedError;
  OrganizedShop? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectedShopCopyWith<ConnectedShop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedShopCopyWith<$Res> {
  factory $ConnectedShopCopyWith(
          ConnectedShop value, $Res Function(ConnectedShop) then) =
      _$ConnectedShopCopyWithImpl<$Res, ConnectedShop>;
  @useResult
  $Res call({String? url, DecShop? decShop, OrganizedShop? data});

  $DecShopCopyWith<$Res>? get decShop;
  $OrganizedShopCopyWith<$Res>? get data;
}

/// @nodoc
class _$ConnectedShopCopyWithImpl<$Res, $Val extends ConnectedShop>
    implements $ConnectedShopCopyWith<$Res> {
  _$ConnectedShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? decShop = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      decShop: freezed == decShop
          ? _value.decShop
          : decShop // ignore: cast_nullable_to_non_nullable
              as DecShop?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OrganizedShop?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DecShopCopyWith<$Res>? get decShop {
    if (_value.decShop == null) {
      return null;
    }

    return $DecShopCopyWith<$Res>(_value.decShop!, (value) {
      return _then(_value.copyWith(decShop: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganizedShopCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OrganizedShopCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConnectedShopCopyWith<$Res>
    implements $ConnectedShopCopyWith<$Res> {
  factory _$$_ConnectedShopCopyWith(
          _$_ConnectedShop value, $Res Function(_$_ConnectedShop) then) =
      __$$_ConnectedShopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, DecShop? decShop, OrganizedShop? data});

  @override
  $DecShopCopyWith<$Res>? get decShop;
  @override
  $OrganizedShopCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ConnectedShopCopyWithImpl<$Res>
    extends _$ConnectedShopCopyWithImpl<$Res, _$_ConnectedShop>
    implements _$$_ConnectedShopCopyWith<$Res> {
  __$$_ConnectedShopCopyWithImpl(
      _$_ConnectedShop _value, $Res Function(_$_ConnectedShop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? decShop = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ConnectedShop(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      decShop: freezed == decShop
          ? _value.decShop
          : decShop // ignore: cast_nullable_to_non_nullable
              as DecShop?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OrganizedShop?,
    ));
  }
}

/// @nodoc

class _$_ConnectedShop extends _ConnectedShop {
  _$_ConnectedShop({this.url, this.decShop, this.data}) : super._();

  @override
  final String? url;
  @override
  final DecShop? decShop;
  @override
  final OrganizedShop? data;

  @override
  String toString() {
    return 'ConnectedShop(url: $url, decShop: $decShop, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectedShop &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.decShop, decShop) || other.decShop == decShop) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, decShop, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectedShopCopyWith<_$_ConnectedShop> get copyWith =>
      __$$_ConnectedShopCopyWithImpl<_$_ConnectedShop>(this, _$identity);
}

abstract class _ConnectedShop extends ConnectedShop {
  factory _ConnectedShop(
      {final String? url,
      final DecShop? decShop,
      final OrganizedShop? data}) = _$_ConnectedShop;
  _ConnectedShop._() : super._();

  @override
  String? get url;
  @override
  DecShop? get decShop;
  @override
  OrganizedShop? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectedShopCopyWith<_$_ConnectedShop> get copyWith =>
      throw _privateConstructorUsedError;
}
