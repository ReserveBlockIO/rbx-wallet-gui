// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_notification_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatNotificationModel {
  String get identifer => throw _privateConstructorUsedError;
  ChatMessage get latestMessage => throw _privateConstructorUsedError;
  bool get hasRead => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatNotificationModelCopyWith<ChatNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatNotificationModelCopyWith<$Res> {
  factory $ChatNotificationModelCopyWith(ChatNotificationModel value,
          $Res Function(ChatNotificationModel) then) =
      _$ChatNotificationModelCopyWithImpl<$Res, ChatNotificationModel>;
  @useResult
  $Res call({String identifer, ChatMessage latestMessage, bool hasRead});

  $ChatMessageCopyWith<$Res> get latestMessage;
}

/// @nodoc
class _$ChatNotificationModelCopyWithImpl<$Res,
        $Val extends ChatNotificationModel>
    implements $ChatNotificationModelCopyWith<$Res> {
  _$ChatNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifer = null,
    Object? latestMessage = null,
    Object? hasRead = null,
  }) {
    return _then(_value.copyWith(
      identifer: null == identifer
          ? _value.identifer
          : identifer // ignore: cast_nullable_to_non_nullable
              as String,
      latestMessage: null == latestMessage
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      hasRead: null == hasRead
          ? _value.hasRead
          : hasRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<$Res> get latestMessage {
    return $ChatMessageCopyWith<$Res>(_value.latestMessage, (value) {
      return _then(_value.copyWith(latestMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatNotificationModelCopyWith<$Res>
    implements $ChatNotificationModelCopyWith<$Res> {
  factory _$$_ChatNotificationModelCopyWith(_$_ChatNotificationModel value,
          $Res Function(_$_ChatNotificationModel) then) =
      __$$_ChatNotificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifer, ChatMessage latestMessage, bool hasRead});

  @override
  $ChatMessageCopyWith<$Res> get latestMessage;
}

/// @nodoc
class __$$_ChatNotificationModelCopyWithImpl<$Res>
    extends _$ChatNotificationModelCopyWithImpl<$Res, _$_ChatNotificationModel>
    implements _$$_ChatNotificationModelCopyWith<$Res> {
  __$$_ChatNotificationModelCopyWithImpl(_$_ChatNotificationModel _value,
      $Res Function(_$_ChatNotificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifer = null,
    Object? latestMessage = null,
    Object? hasRead = null,
  }) {
    return _then(_$_ChatNotificationModel(
      identifer: null == identifer
          ? _value.identifer
          : identifer // ignore: cast_nullable_to_non_nullable
              as String,
      latestMessage: null == latestMessage
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      hasRead: null == hasRead
          ? _value.hasRead
          : hasRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChatNotificationModel extends _ChatNotificationModel {
  _$_ChatNotificationModel(
      {required this.identifer,
      required this.latestMessage,
      this.hasRead = false})
      : super._();

  @override
  final String identifer;
  @override
  final ChatMessage latestMessage;
  @override
  @JsonKey()
  final bool hasRead;

  @override
  String toString() {
    return 'ChatNotificationModel(identifer: $identifer, latestMessage: $latestMessage, hasRead: $hasRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatNotificationModel &&
            (identical(other.identifer, identifer) ||
                other.identifer == identifer) &&
            (identical(other.latestMessage, latestMessage) ||
                other.latestMessage == latestMessage) &&
            (identical(other.hasRead, hasRead) || other.hasRead == hasRead));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, identifer, latestMessage, hasRead);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatNotificationModelCopyWith<_$_ChatNotificationModel> get copyWith =>
      __$$_ChatNotificationModelCopyWithImpl<_$_ChatNotificationModel>(
          this, _$identity);
}

abstract class _ChatNotificationModel extends ChatNotificationModel {
  factory _ChatNotificationModel(
      {required final String identifer,
      required final ChatMessage latestMessage,
      final bool hasRead}) = _$_ChatNotificationModel;
  _ChatNotificationModel._() : super._();

  @override
  String get identifer;
  @override
  ChatMessage get latestMessage;
  @override
  bool get hasRead;
  @override
  @JsonKey(ignore: true)
  _$$_ChatNotificationModelCopyWith<_$_ChatNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
