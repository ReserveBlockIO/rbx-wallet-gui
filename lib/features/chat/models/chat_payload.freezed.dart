// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatPayload _$ChatPayloadFromJson(Map<String, dynamic> json) {
  return _ChatPayload.fromJson(json);
}

/// @nodoc
mixin _$ChatPayload {
  @JsonKey(name: "ToAddress")
  String get toAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "FromAddress")
  String get fromAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "Message")
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatPayloadCopyWith<ChatPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPayloadCopyWith<$Res> {
  factory $ChatPayloadCopyWith(
          ChatPayload value, $Res Function(ChatPayload) then) =
      _$ChatPayloadCopyWithImpl<$Res, ChatPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: "ToAddress") String toAddress,
      @JsonKey(name: "FromAddress") String fromAddress,
      @JsonKey(name: "Message") String message});
}

/// @nodoc
class _$ChatPayloadCopyWithImpl<$Res, $Val extends ChatPayload>
    implements $ChatPayloadCopyWith<$Res> {
  _$ChatPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toAddress = null,
    Object? fromAddress = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatPayloadCopyWith<$Res>
    implements $ChatPayloadCopyWith<$Res> {
  factory _$$_ChatPayloadCopyWith(
          _$_ChatPayload value, $Res Function(_$_ChatPayload) then) =
      __$$_ChatPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ToAddress") String toAddress,
      @JsonKey(name: "FromAddress") String fromAddress,
      @JsonKey(name: "Message") String message});
}

/// @nodoc
class __$$_ChatPayloadCopyWithImpl<$Res>
    extends _$ChatPayloadCopyWithImpl<$Res, _$_ChatPayload>
    implements _$$_ChatPayloadCopyWith<$Res> {
  __$$_ChatPayloadCopyWithImpl(
      _$_ChatPayload _value, $Res Function(_$_ChatPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toAddress = null,
    Object? fromAddress = null,
    Object? message = null,
  }) {
    return _then(_$_ChatPayload(
      toAddress: null == toAddress
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fromAddress: null == fromAddress
          ? _value.fromAddress
          : fromAddress // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatPayload extends _ChatPayload {
  _$_ChatPayload(
      {@JsonKey(name: "ToAddress") required this.toAddress,
      @JsonKey(name: "FromAddress") required this.fromAddress,
      @JsonKey(name: "Message") required this.message})
      : super._();

  factory _$_ChatPayload.fromJson(Map<String, dynamic> json) =>
      _$$_ChatPayloadFromJson(json);

  @override
  @JsonKey(name: "ToAddress")
  final String toAddress;
  @override
  @JsonKey(name: "FromAddress")
  final String fromAddress;
  @override
  @JsonKey(name: "Message")
  final String message;

  @override
  String toString() {
    return 'ChatPayload(toAddress: $toAddress, fromAddress: $fromAddress, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatPayload &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, toAddress, fromAddress, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatPayloadCopyWith<_$_ChatPayload> get copyWith =>
      __$$_ChatPayloadCopyWithImpl<_$_ChatPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatPayloadToJson(
      this,
    );
  }
}

abstract class _ChatPayload extends ChatPayload {
  factory _ChatPayload(
          {@JsonKey(name: "ToAddress") required final String toAddress,
          @JsonKey(name: "FromAddress") required final String fromAddress,
          @JsonKey(name: "Message") required final String message}) =
      _$_ChatPayload;
  _ChatPayload._() : super._();

  factory _ChatPayload.fromJson(Map<String, dynamic> json) =
      _$_ChatPayload.fromJson;

  @override
  @JsonKey(name: "ToAddress")
  String get toAddress;
  @override
  @JsonKey(name: "FromAddress")
  String get fromAddress;
  @override
  @JsonKey(name: "Message")
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ChatPayloadCopyWith<_$_ChatPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
