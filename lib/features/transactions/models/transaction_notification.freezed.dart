// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  @JsonKey(ignore: true)
  $TransactionNotificationCopyWith<TransactionNotification> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionNotificationCopyWith<$Res> {
  factory $TransactionNotificationCopyWith(TransactionNotification value, $Res Function(TransactionNotification) then) =
      _$TransactionNotificationCopyWithImpl<$Res>;
  $Res call({String identifier, Transaction? transaction, String title, String? body, IconData? icon, AppColorVariant color});

  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$TransactionNotificationCopyWithImpl<$Res> implements $TransactionNotificationCopyWith<$Res> {
  _$TransactionNotificationCopyWithImpl(this._value, this._then);

  final TransactionNotification _value;
  // ignore: unused_field
  final $Res Function(TransactionNotification) _then;

  @override
  $Res call({
    Object? identifier = freezed,
    Object? transaction = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: transaction == freezed
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as AppColorVariant,
    ));
  }

  @override
  $TransactionCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }
}

/// @nodoc
abstract class _$$_TransactionNotificationCopyWith<$Res> implements $TransactionNotificationCopyWith<$Res> {
  factory _$$_TransactionNotificationCopyWith(_$_TransactionNotification value, $Res Function(_$_TransactionNotification) then) =
      __$$_TransactionNotificationCopyWithImpl<$Res>;
  @override
  $Res call({String identifier, Transaction? transaction, String title, String? body, IconData? icon, AppColorVariant color});

  @override
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$_TransactionNotificationCopyWithImpl<$Res> extends _$TransactionNotificationCopyWithImpl<$Res>
    implements _$$_TransactionNotificationCopyWith<$Res> {
  __$$_TransactionNotificationCopyWithImpl(_$_TransactionNotification _value, $Res Function(_$_TransactionNotification) _then)
      : super(_value, (v) => _then(v as _$_TransactionNotification));

  @override
  _$_TransactionNotification get _value => super._value as _$_TransactionNotification;

  @override
  $Res call({
    Object? identifier = freezed,
    Object? transaction = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_TransactionNotification(
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: transaction == freezed
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as AppColorVariant,
    ));
  }
}

/// @nodoc

class _$_TransactionNotification extends _TransactionNotification {
  _$_TransactionNotification(
      {required this.identifier, this.transaction, required this.title, this.body, this.icon, this.color = AppColorVariant.Success})
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
  String toString() {
    return 'TransactionNotification(identifier: $identifier, transaction: $transaction, title: $title, body: $body, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionNotification &&
            const DeepCollectionEquality().equals(other.identifier, identifier) &&
            const DeepCollectionEquality().equals(other.transaction, transaction) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(identifier),
      const DeepCollectionEquality().hash(transaction),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionNotificationCopyWith<_$_TransactionNotification> get copyWith =>
      __$$_TransactionNotificationCopyWithImpl<_$_TransactionNotification>(this, _$identity);
}

abstract class _TransactionNotification extends TransactionNotification {
  factory _TransactionNotification(
      {required final String identifier,
      final Transaction? transaction,
      required final String title,
      final String? body,
      final IconData? icon,
      final AppColorVariant color}) = _$_TransactionNotification;
  _TransactionNotification._() : super._();

  @override
  String get identifier => throw _privateConstructorUsedError;
  @override
  Transaction? get transaction => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String? get body => throw _privateConstructorUsedError;
  @override
  IconData? get icon => throw _privateConstructorUsedError;
  @override
  AppColorVariant get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionNotificationCopyWith<_$_TransactionNotification> get copyWith => throw _privateConstructorUsedError;
}
