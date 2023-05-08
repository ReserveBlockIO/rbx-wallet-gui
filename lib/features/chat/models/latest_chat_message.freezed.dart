// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatestChatMessage _$LatestChatMessageFromJson(Map<String, dynamic> json) {
  return _LatestChatMessage.fromJson(json);
}

/// @nodoc
mixin _$LatestChatMessage {
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "thread_uuid")
  String get threadUuid => throw _privateConstructorUsedError;
  @JsonKey(name: "from_address")
  String get fromAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "to_address")
  String get toAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatestChatMessageCopyWith<LatestChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestChatMessageCopyWith<$Res> {
  factory $LatestChatMessageCopyWith(
          LatestChatMessage value, $Res Function(LatestChatMessage) then) =
      _$LatestChatMessageCopyWithImpl<$Res, LatestChatMessage>;
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: "thread_uuid") String threadUuid,
      @JsonKey(name: "from_address") String fromAddress,
      @JsonKey(name: "to_address") String toAddress,
      @JsonKey(name: "body") String body,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$LatestChatMessageCopyWithImpl<$Res, $Val extends LatestChatMessage>
    implements $LatestChatMessageCopyWith<$Res> {
  _$LatestChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? threadUuid = null,
    Object? fromAddress = null,
    Object? toAddress = null,
    Object? body = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      threadUuid: null == threadUuid
          ? _value.threadUuid
          : threadUuid // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LatestChatMessageCopyWith<$Res>
    implements $LatestChatMessageCopyWith<$Res> {
  factory _$$_LatestChatMessageCopyWith(_$_LatestChatMessage value,
          $Res Function(_$_LatestChatMessage) then) =
      __$$_LatestChatMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      @JsonKey(name: "thread_uuid") String threadUuid,
      @JsonKey(name: "from_address") String fromAddress,
      @JsonKey(name: "to_address") String toAddress,
      @JsonKey(name: "body") String body,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_LatestChatMessageCopyWithImpl<$Res>
    extends _$LatestChatMessageCopyWithImpl<$Res, _$_LatestChatMessage>
    implements _$$_LatestChatMessageCopyWith<$Res> {
  __$$_LatestChatMessageCopyWithImpl(
      _$_LatestChatMessage _value, $Res Function(_$_LatestChatMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? threadUuid = null,
    Object? fromAddress = null,
    Object? toAddress = null,
    Object? body = null,
    Object? createdAt = null,
  }) {
    return _then(_$_LatestChatMessage(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      threadUuid: null == threadUuid
          ? _value.threadUuid
          : threadUuid // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LatestChatMessage extends _LatestChatMessage {
  _$_LatestChatMessage(
      {required this.uuid,
      @JsonKey(name: "thread_uuid") required this.threadUuid,
      @JsonKey(name: "from_address") required this.fromAddress,
      @JsonKey(name: "to_address") required this.toAddress,
      @JsonKey(name: "body") required this.body,
      @JsonKey(name: "created_at") required this.createdAt})
      : super._();

  factory _$_LatestChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_LatestChatMessageFromJson(json);

  @override
  final String uuid;
  @override
  @JsonKey(name: "thread_uuid")
  final String threadUuid;
  @override
  @JsonKey(name: "from_address")
  final String fromAddress;
  @override
  @JsonKey(name: "to_address")
  final String toAddress;
  @override
  @JsonKey(name: "body")
  final String body;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'LatestChatMessage(uuid: $uuid, threadUuid: $threadUuid, fromAddress: $fromAddress, toAddress: $toAddress, body: $body, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatestChatMessage &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.threadUuid, threadUuid) ||
                other.threadUuid == threadUuid) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, threadUuid, fromAddress, toAddress, body, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatestChatMessageCopyWith<_$_LatestChatMessage> get copyWith =>
      __$$_LatestChatMessageCopyWithImpl<_$_LatestChatMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatestChatMessageToJson(
      this,
    );
  }
}

abstract class _LatestChatMessage extends LatestChatMessage {
  factory _LatestChatMessage(
          {required final String uuid,
          @JsonKey(name: "thread_uuid") required final String threadUuid,
          @JsonKey(name: "from_address") required final String fromAddress,
          @JsonKey(name: "to_address") required final String toAddress,
          @JsonKey(name: "body") required final String body,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$_LatestChatMessage;
  _LatestChatMessage._() : super._();

  factory _LatestChatMessage.fromJson(Map<String, dynamic> json) =
      _$_LatestChatMessage.fromJson;

  @override
  String get uuid;
  @override
  @JsonKey(name: "thread_uuid")
  String get threadUuid;
  @override
  @JsonKey(name: "from_address")
  String get fromAddress;
  @override
  @JsonKey(name: "to_address")
  String get toAddress;
  @override
  @JsonKey(name: "body")
  String get body;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_LatestChatMessageCopyWith<_$_LatestChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
