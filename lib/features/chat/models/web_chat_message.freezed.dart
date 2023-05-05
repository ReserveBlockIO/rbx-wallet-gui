// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebChatMessage _$WebChatMessageFromJson(Map<String, dynamic> json) {
  return _WebChatMessage.fromJson(json);
}

/// @nodoc
mixin _$WebChatMessage {
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "is_from_buyer")
  bool get isFromBuyer => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: "is_delivered")
  bool get isDelivered => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebChatMessageCopyWith<WebChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebChatMessageCopyWith<$Res> {
  factory $WebChatMessageCopyWith(
          WebChatMessage value, $Res Function(WebChatMessage) then) =
      _$WebChatMessageCopyWithImpl<$Res, WebChatMessage>;
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: "is_from_buyer") bool isFromBuyer,
      String body,
      @JsonKey(name: "is_delivered") bool isDelivered,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$WebChatMessageCopyWithImpl<$Res, $Val extends WebChatMessage>
    implements $WebChatMessageCopyWith<$Res> {
  _$WebChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? isFromBuyer = null,
    Object? body = null,
    Object? isDelivered = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      isFromBuyer: null == isFromBuyer
          ? _value.isFromBuyer
          : isFromBuyer // ignore: cast_nullable_to_non_nullable
              as bool,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebChatMessageCopyWith<$Res>
    implements $WebChatMessageCopyWith<$Res> {
  factory _$$_WebChatMessageCopyWith(
          _$_WebChatMessage value, $Res Function(_$_WebChatMessage) then) =
      __$$_WebChatMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: "is_from_buyer") bool isFromBuyer,
      String body,
      @JsonKey(name: "is_delivered") bool isDelivered,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_WebChatMessageCopyWithImpl<$Res>
    extends _$WebChatMessageCopyWithImpl<$Res, _$_WebChatMessage>
    implements _$$_WebChatMessageCopyWith<$Res> {
  __$$_WebChatMessageCopyWithImpl(
      _$_WebChatMessage _value, $Res Function(_$_WebChatMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? isFromBuyer = null,
    Object? body = null,
    Object? isDelivered = null,
    Object? createdAt = null,
  }) {
    return _then(_$_WebChatMessage(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      isFromBuyer: null == isFromBuyer
          ? _value.isFromBuyer
          : isFromBuyer // ignore: cast_nullable_to_non_nullable
              as bool,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebChatMessage extends _WebChatMessage {
  _$_WebChatMessage(
      {required this.uuid,
      @JsonKey(name: "is_from_buyer") required this.isFromBuyer,
      required this.body,
      @JsonKey(name: "is_delivered") this.isDelivered = false,
      @JsonKey(name: "created_at") required this.createdAt})
      : super._();

  factory _$_WebChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_WebChatMessageFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey(name: "is_from_buyer")
  final bool isFromBuyer;
  @override
  final String body;
  @override
  @JsonKey(name: "is_delivered")
  final bool isDelivered;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'WebChatMessage(uuid: $uuid, isFromBuyer: $isFromBuyer, body: $body, isDelivered: $isDelivered, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebChatMessage &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.isFromBuyer, isFromBuyer) ||
                other.isFromBuyer == isFromBuyer) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.isDelivered, isDelivered) ||
                other.isDelivered == isDelivered) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, isFromBuyer, body, isDelivered, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebChatMessageCopyWith<_$_WebChatMessage> get copyWith =>
      __$$_WebChatMessageCopyWithImpl<_$_WebChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebChatMessageToJson(
      this,
    );
  }
}

abstract class _WebChatMessage extends WebChatMessage {
  factory _WebChatMessage(
          {required final String uuid,
          @JsonKey(name: "is_from_buyer") required final bool isFromBuyer,
          required final String body,
          @JsonKey(name: "is_delivered") final bool isDelivered,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$_WebChatMessage;
  _WebChatMessage._() : super._();

  factory _WebChatMessage.fromJson(Map<String, dynamic> json) =
      _$_WebChatMessage.fromJson;

  @override
  String get uuid;
  @override
  @JsonKey(name: "is_from_buyer")
  bool get isFromBuyer;
  @override
  String get body;
  @override
  @JsonKey(name: "is_delivered")
  bool get isDelivered;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_WebChatMessageCopyWith<_$_WebChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
