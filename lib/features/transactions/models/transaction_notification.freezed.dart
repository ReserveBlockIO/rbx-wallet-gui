// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionNotification {
  String get identifier => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  IconData? get icon => throw _privateConstructorUsedError;
  AppColorVariant get color => throw _privateConstructorUsedError;
  dynamic Function()? get onPressed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionNotificationCopyWith<TransactionNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionNotificationCopyWith<$Res> {
  factory $TransactionNotificationCopyWith(TransactionNotification value,
          $Res Function(TransactionNotification) then) =
      _$TransactionNotificationCopyWithImpl<$Res, TransactionNotification>;
  @useResult
  $Res call(
      {String identifier,
      Transaction? transaction,
      String title,
      String? body,
      IconData? icon,
      AppColorVariant color,
      dynamic Function()? onPressed});

  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$TransactionNotificationCopyWithImpl<$Res,
        $Val extends TransactionNotification>
    implements $TransactionNotificationCopyWith<$Res> {
  _$TransactionNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? transaction = freezed,
    Object? title = null,
    Object? body = freezed,
    Object? icon = freezed,
    Object? color = null,
    Object? onPressed = freezed,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as AppColorVariant,
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionNotificationCopyWith<$Res>
    implements $TransactionNotificationCopyWith<$Res> {
  factory _$$_TransactionNotificationCopyWith(_$_TransactionNotification value,
          $Res Function(_$_TransactionNotification) then) =
      __$$_TransactionNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String identifier,
      Transaction? transaction,
      String title,
      String? body,
      IconData? icon,
      AppColorVariant color,
      dynamic Function()? onPressed});

  @override
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$_TransactionNotificationCopyWithImpl<$Res>
    extends _$TransactionNotificationCopyWithImpl<$Res,
        _$_TransactionNotification>
    implements _$$_TransactionNotificationCopyWith<$Res> {
  __$$_TransactionNotificationCopyWithImpl(_$_TransactionNotification _value,
      $Res Function(_$_TransactionNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? transaction = freezed,
    Object? title = null,
    Object? body = freezed,
    Object? icon = freezed,
    Object? color = null,
    Object? onPressed = freezed,
  }) {
    return _then(_$_TransactionNotification(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as AppColorVariant,
      onPressed: freezed == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$_TransactionNotification extends _TransactionNotification {
  _$_TransactionNotification(
      {required this.identifier,
      this.transaction,
      required this.title,
      this.body,
      this.icon,
      this.color = AppColorVariant.Success,
      this.onPressed})
      : super._();

  @override
  final String identifier;
  @override
  final Transaction? transaction;
  @override
  final String title;
  @override
  final String? body;
  @override
  final IconData? icon;
  @override
  @JsonKey()
  final AppColorVariant color;
  @override
  final dynamic Function()? onPressed;

  @override
  String toString() {
    return 'TransactionNotification(identifier: $identifier, transaction: $transaction, title: $title, body: $body, icon: $icon, color: $color, onPressed: $onPressed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionNotification &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identifier, transaction, title,
      body, icon, color, onPressed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionNotificationCopyWith<_$_TransactionNotification>
      get copyWith =>
          __$$_TransactionNotificationCopyWithImpl<_$_TransactionNotification>(
              this, _$identity);
}

abstract class _TransactionNotification extends TransactionNotification {
  factory _TransactionNotification(
      {required final String identifier,
      final Transaction? transaction,
      required final String title,
      final String? body,
      final IconData? icon,
      final AppColorVariant color,
      final dynamic Function()? onPressed}) = _$_TransactionNotification;
  _TransactionNotification._() : super._();

  @override
  String get identifier;
  @override
  Transaction? get transaction;
  @override
  String get title;
  @override
  String? get body;
  @override
  IconData? get icon;
  @override
  AppColorVariant get color;
  @override
  dynamic Function()? get onPressed;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionNotificationCopyWith<_$_TransactionNotification>
      get copyWith => throw _privateConstructorUsedError;
}
