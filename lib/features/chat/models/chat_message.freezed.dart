// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  @JsonKey(name: "Id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "ToAddress")
  String get toAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "FromAddress")
  String get fromAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "TimeStamp")
  int get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: "ShopURL")
  String get shopUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "MessageReceived")
  bool get received => throw _privateConstructorUsedError;
  @JsonKey(name: "IsShopSentMessage")
  bool get isShopSentMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") String id,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "ToAddress") String toAddress,
      @JsonKey(name: "FromAddress") String fromAddress,
      @JsonKey(name: "TimeStamp") int timestamp,
      @JsonKey(name: "ShopURL") String shopUrl,
      @JsonKey(name: "MessageReceived") bool received,
      @JsonKey(name: "IsShopSentMessage") bool isShopSentMessage});
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? toAddress = null,
    Object? fromAddress = null,
    Object? timestamp = null,
    Object? shopUrl = null,
    Object? received = null,
    Object? isShopSentMessage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      shopUrl: null == shopUrl
          ? _value.shopUrl
          : shopUrl // ignore: cast_nullable_to_non_nullable
              as String,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as bool,
      isShopSentMessage: null == isShopSentMessage
          ? _value.isShopSentMessage
          : isShopSentMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$_ChatMessageCopyWith(
          _$_ChatMessage value, $Res Function(_$_ChatMessage) then) =
      __$$_ChatMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") String id,
      @JsonKey(name: "Message") String message,
      @JsonKey(name: "ToAddress") String toAddress,
      @JsonKey(name: "FromAddress") String fromAddress,
      @JsonKey(name: "TimeStamp") int timestamp,
      @JsonKey(name: "ShopURL") String shopUrl,
      @JsonKey(name: "MessageReceived") bool received,
      @JsonKey(name: "IsShopSentMessage") bool isShopSentMessage});
}

/// @nodoc
class __$$_ChatMessageCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$_ChatMessage>
    implements _$$_ChatMessageCopyWith<$Res> {
  __$$_ChatMessageCopyWithImpl(
      _$_ChatMessage _value, $Res Function(_$_ChatMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? toAddress = null,
    Object? fromAddress = null,
    Object? timestamp = null,
    Object? shopUrl = null,
    Object? received = null,
    Object? isShopSentMessage = null,
  }) {
    return _then(_$_ChatMessage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      shopUrl: null == shopUrl
          ? _value.shopUrl
          : shopUrl // ignore: cast_nullable_to_non_nullable
              as String,
      received: null == received
          ? _value.received
          : received // ignore: cast_nullable_to_non_nullable
              as bool,
      isShopSentMessage: null == isShopSentMessage
          ? _value.isShopSentMessage
          : isShopSentMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessage extends _ChatMessage {
  _$_ChatMessage(
      {@JsonKey(name: "Id") required this.id,
      @JsonKey(name: "Message") required this.message,
      @JsonKey(name: "ToAddress") required this.toAddress,
      @JsonKey(name: "FromAddress") required this.fromAddress,
      @JsonKey(name: "TimeStamp") required this.timestamp,
      @JsonKey(name: "ShopURL") required this.shopUrl,
      @JsonKey(name: "MessageReceived") required this.received,
      @JsonKey(name: "IsShopSentMessage") required this.isShopSentMessage})
      : super._();

  factory _$_ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageFromJson(json);

  @override
  @JsonKey(name: "Id")
  final String id;
  @override
  @JsonKey(name: "Message")
  final String message;
  @override
  @JsonKey(name: "ToAddress")
  final String toAddress;
  @override
  @JsonKey(name: "FromAddress")
  final String fromAddress;
  @override
  @JsonKey(name: "TimeStamp")
  final int timestamp;
  @override
  @JsonKey(name: "ShopURL")
  final String shopUrl;
  @override
  @JsonKey(name: "MessageReceived")
  final bool received;
  @override
  @JsonKey(name: "IsShopSentMessage")
  final bool isShopSentMessage;

  @override
  String toString() {
    return 'ChatMessage(id: $id, message: $message, toAddress: $toAddress, fromAddress: $fromAddress, timestamp: $timestamp, shopUrl: $shopUrl, received: $received, isShopSentMessage: $isShopSentMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.shopUrl, shopUrl) || other.shopUrl == shopUrl) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.isShopSentMessage, isShopSentMessage) ||
                other.isShopSentMessage == isShopSentMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, toAddress,
      fromAddress, timestamp, shopUrl, received, isShopSentMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatMessageCopyWith<_$_ChatMessage> get copyWith =>
      __$$_ChatMessageCopyWithImpl<_$_ChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageToJson(
      this,
    );
  }
}

abstract class _ChatMessage extends ChatMessage {
  factory _ChatMessage(
      {@JsonKey(name: "Id")
          required final String id,
      @JsonKey(name: "Message")
          required final String message,
      @JsonKey(name: "ToAddress")
          required final String toAddress,
      @JsonKey(name: "FromAddress")
          required final String fromAddress,
      @JsonKey(name: "TimeStamp")
          required final int timestamp,
      @JsonKey(name: "ShopURL")
          required final String shopUrl,
      @JsonKey(name: "MessageReceived")
          required final bool received,
      @JsonKey(name: "IsShopSentMessage")
          required final bool isShopSentMessage}) = _$_ChatMessage;
  _ChatMessage._() : super._();

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$_ChatMessage.fromJson;

  @override
  @JsonKey(name: "Id")
  String get id;
  @override
  @JsonKey(name: "Message")
  String get message;
  @override
  @JsonKey(name: "ToAddress")
  String get toAddress;
  @override
  @JsonKey(name: "FromAddress")
  String get fromAddress;
  @override
  @JsonKey(name: "TimeStamp")
  int get timestamp;
  @override
  @JsonKey(name: "ShopURL")
  String get shopUrl;
  @override
  @JsonKey(name: "MessageReceived")
  bool get received;
  @override
  @JsonKey(name: "IsShopSentMessage")
  bool get isShopSentMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMessageCopyWith<_$_ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
