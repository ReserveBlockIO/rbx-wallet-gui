// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_thread.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatThread _$ChatThreadFromJson(Map<String, dynamic> json) {
  return _ChatThread.fromJson(json);
}

/// @nodoc
mixin _$ChatThread {
  @JsonKey(name: "User")
  String get user => throw _privateConstructorUsedError;
  @JsonKey(name: "Messages")
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  bool get isThirdParty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatThreadCopyWith<ChatThread> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatThreadCopyWith<$Res> {
  factory $ChatThreadCopyWith(
          ChatThread value, $Res Function(ChatThread) then) =
      _$ChatThreadCopyWithImpl<$Res, ChatThread>;
  @useResult
  $Res call(
      {@JsonKey(name: "User") String user,
      @JsonKey(name: "Messages") List<ChatMessage> messages,
      bool isThirdParty});
}

/// @nodoc
class _$ChatThreadCopyWithImpl<$Res, $Val extends ChatThread>
    implements $ChatThreadCopyWith<$Res> {
  _$ChatThreadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? messages = null,
    Object? isThirdParty = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isThirdParty: null == isThirdParty
          ? _value.isThirdParty
          : isThirdParty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatThreadCopyWith<$Res>
    implements $ChatThreadCopyWith<$Res> {
  factory _$$_ChatThreadCopyWith(
          _$_ChatThread value, $Res Function(_$_ChatThread) then) =
      __$$_ChatThreadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "User") String user,
      @JsonKey(name: "Messages") List<ChatMessage> messages,
      bool isThirdParty});
}

/// @nodoc
class __$$_ChatThreadCopyWithImpl<$Res>
    extends _$ChatThreadCopyWithImpl<$Res, _$_ChatThread>
    implements _$$_ChatThreadCopyWith<$Res> {
  __$$_ChatThreadCopyWithImpl(
      _$_ChatThread _value, $Res Function(_$_ChatThread) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? messages = null,
    Object? isThirdParty = null,
  }) {
    return _then(_$_ChatThread(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isThirdParty: null == isThirdParty
          ? _value.isThirdParty
          : isThirdParty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatThread extends _ChatThread {
  _$_ChatThread(
      {@JsonKey(name: "User") required this.user,
      @JsonKey(name: "Messages") final List<ChatMessage> messages = const [],
      this.isThirdParty = false})
      : _messages = messages,
        super._();

  factory _$_ChatThread.fromJson(Map<String, dynamic> json) =>
      _$$_ChatThreadFromJson(json);

  @override
  @JsonKey(name: "User")
  final String user;
  final List<ChatMessage> _messages;
  @override
  @JsonKey(name: "Messages")
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isThirdParty;

  @override
  String toString() {
    return 'ChatThread(user: $user, messages: $messages, isThirdParty: $isThirdParty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatThread &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isThirdParty, isThirdParty) ||
                other.isThirdParty == isThirdParty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user,
      const DeepCollectionEquality().hash(_messages), isThirdParty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatThreadCopyWith<_$_ChatThread> get copyWith =>
      __$$_ChatThreadCopyWithImpl<_$_ChatThread>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatThreadToJson(
      this,
    );
  }
}

abstract class _ChatThread extends ChatThread {
  factory _ChatThread(
      {@JsonKey(name: "User") required final String user,
      @JsonKey(name: "Messages") final List<ChatMessage> messages,
      final bool isThirdParty}) = _$_ChatThread;
  _ChatThread._() : super._();

  factory _ChatThread.fromJson(Map<String, dynamic> json) =
      _$_ChatThread.fromJson;

  @override
  @JsonKey(name: "User")
  String get user;
  @override
  @JsonKey(name: "Messages")
  List<ChatMessage> get messages;
  @override
  bool get isThirdParty;
  @override
  @JsonKey(ignore: true)
  _$$_ChatThreadCopyWith<_$_ChatThread> get copyWith =>
      throw _privateConstructorUsedError;
}
