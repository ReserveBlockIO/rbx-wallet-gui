// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String get id => throw _privateConstructorUsedError;
  TicketType get type => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  DateTime? get eventDate => throw _privateConstructorUsedError;
  String get eventAddress => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// NEW STUFF vvvv
  String get eventCode => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  bool get evolveOnRedeem => throw _privateConstructorUsedError;
  String get seatInfo => throw _privateConstructorUsedError;
  DateTime? get expireDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res>;
  $Res call(
      {String id,
      TicketType type,
      String eventName,
      DateTime? eventDate,
      String eventAddress,
      String description,
      String eventCode,
      int quantity,
      bool evolveOnRedeem,
      String seatInfo,
      DateTime? expireDate});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res> implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  final Ticket _value;
  // ignore: unused_field
  final $Res Function(Ticket) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? eventName = freezed,
    Object? eventDate = freezed,
    Object? eventAddress = freezed,
    Object? description = freezed,
    Object? eventCode = freezed,
    Object? quantity = freezed,
    Object? evolveOnRedeem = freezed,
    Object? seatInfo = freezed,
    Object? expireDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketType,
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: eventDate == freezed
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventAddress: eventAddress == freezed
          ? _value.eventAddress
          : eventAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventCode: eventCode == freezed
          ? _value.eventCode
          : eventCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      evolveOnRedeem: evolveOnRedeem == freezed
          ? _value.evolveOnRedeem
          : evolveOnRedeem // ignore: cast_nullable_to_non_nullable
              as bool,
      seatInfo: seatInfo == freezed
          ? _value.seatInfo
          : seatInfo // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$_TicketCopyWith(_$_Ticket value, $Res Function(_$_Ticket) then) =
      __$$_TicketCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      TicketType type,
      String eventName,
      DateTime? eventDate,
      String eventAddress,
      String description,
      String eventCode,
      int quantity,
      bool evolveOnRedeem,
      String seatInfo,
      DateTime? expireDate});
}

/// @nodoc
class __$$_TicketCopyWithImpl<$Res> extends _$TicketCopyWithImpl<$Res>
    implements _$$_TicketCopyWith<$Res> {
  __$$_TicketCopyWithImpl(_$_Ticket _value, $Res Function(_$_Ticket) _then)
      : super(_value, (v) => _then(v as _$_Ticket));

  @override
  _$_Ticket get _value => super._value as _$_Ticket;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? eventName = freezed,
    Object? eventDate = freezed,
    Object? eventAddress = freezed,
    Object? description = freezed,
    Object? eventCode = freezed,
    Object? quantity = freezed,
    Object? evolveOnRedeem = freezed,
    Object? seatInfo = freezed,
    Object? expireDate = freezed,
  }) {
    return _then(_$_Ticket(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketType,
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: eventDate == freezed
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventAddress: eventAddress == freezed
          ? _value.eventAddress
          : eventAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventCode: eventCode == freezed
          ? _value.eventCode
          : eventCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      evolveOnRedeem: evolveOnRedeem == freezed
          ? _value.evolveOnRedeem
          : evolveOnRedeem // ignore: cast_nullable_to_non_nullable
              as bool,
      seatInfo: seatInfo == freezed
          ? _value.seatInfo
          : seatInfo // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: expireDate == freezed
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ticket extends _Ticket {
  const _$_Ticket(
      {this.id = "",
      this.type = TicketType.physicalEvent,
      this.eventName = "",
      this.eventDate,
      this.eventAddress = "",
      this.description = "",
      this.eventCode = "",
      this.quantity = 1,
      this.evolveOnRedeem = false,
      this.seatInfo = "",
      this.expireDate})
      : super._();

  factory _$_Ticket.fromJson(Map<String, dynamic> json) =>
      _$$_TicketFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final TicketType type;
  @override
  @JsonKey()
  final String eventName;
  @override
  final DateTime? eventDate;
  @override
  @JsonKey()
  final String eventAddress;
  @override
  @JsonKey()
  final String description;

  /// NEW STUFF vvvv
  @override
  @JsonKey()
  final String eventCode;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final bool evolveOnRedeem;
  @override
  @JsonKey()
  final String seatInfo;
  @override
  final DateTime? expireDate;

  @override
  String toString() {
    return 'Ticket(id: $id, type: $type, eventName: $eventName, eventDate: $eventDate, eventAddress: $eventAddress, description: $description, eventCode: $eventCode, quantity: $quantity, evolveOnRedeem: $evolveOnRedeem, seatInfo: $seatInfo, expireDate: $expireDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ticket &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.eventName, eventName) &&
            const DeepCollectionEquality().equals(other.eventDate, eventDate) &&
            const DeepCollectionEquality()
                .equals(other.eventAddress, eventAddress) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.eventCode, eventCode) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.evolveOnRedeem, evolveOnRedeem) &&
            const DeepCollectionEquality().equals(other.seatInfo, seatInfo) &&
            const DeepCollectionEquality()
                .equals(other.expireDate, expireDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(eventName),
      const DeepCollectionEquality().hash(eventDate),
      const DeepCollectionEquality().hash(eventAddress),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(eventCode),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(evolveOnRedeem),
      const DeepCollectionEquality().hash(seatInfo),
      const DeepCollectionEquality().hash(expireDate));

  @JsonKey(ignore: true)
  @override
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      __$$_TicketCopyWithImpl<_$_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketToJson(this);
  }
}

abstract class _Ticket extends Ticket {
  const factory _Ticket(
      {final String id,
      final TicketType type,
      final String eventName,
      final DateTime? eventDate,
      final String eventAddress,
      final String description,
      final String eventCode,
      final int quantity,
      final bool evolveOnRedeem,
      final String seatInfo,
      final DateTime? expireDate}) = _$_Ticket;
  const _Ticket._() : super._();

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$_Ticket.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  TicketType get type => throw _privateConstructorUsedError;
  @override
  String get eventName => throw _privateConstructorUsedError;
  @override
  DateTime? get eventDate => throw _privateConstructorUsedError;
  @override
  String get eventAddress => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override

  /// NEW STUFF vvvv
  String get eventCode => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  bool get evolveOnRedeem => throw _privateConstructorUsedError;
  @override
  String get seatInfo => throw _privateConstructorUsedError;
  @override
  DateTime? get expireDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      throw _privateConstructorUsedError;
}
