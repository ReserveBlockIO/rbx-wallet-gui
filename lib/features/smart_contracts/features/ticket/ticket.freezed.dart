// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
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
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? eventName = null,
    Object? eventDate = freezed,
    Object? eventAddress = null,
    Object? description = null,
    Object? eventCode = null,
    Object? quantity = null,
    Object? evolveOnRedeem = null,
    Object? seatInfo = null,
    Object? expireDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketType,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventAddress: null == eventAddress
          ? _value.eventAddress
          : eventAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventCode: null == eventCode
          ? _value.eventCode
          : eventCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      evolveOnRedeem: null == evolveOnRedeem
          ? _value.evolveOnRedeem
          : evolveOnRedeem // ignore: cast_nullable_to_non_nullable
              as bool,
      seatInfo: null == seatInfo
          ? _value.seatInfo
          : seatInfo // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$_TicketCopyWith(_$_Ticket value, $Res Function(_$_Ticket) then) =
      __$$_TicketCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_TicketCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$_Ticket>
    implements _$$_TicketCopyWith<$Res> {
  __$$_TicketCopyWithImpl(_$_Ticket _value, $Res Function(_$_Ticket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? eventName = null,
    Object? eventDate = freezed,
    Object? eventAddress = null,
    Object? description = null,
    Object? eventCode = null,
    Object? quantity = null,
    Object? evolveOnRedeem = null,
    Object? seatInfo = null,
    Object? expireDate = freezed,
  }) {
    return _then(_$_Ticket(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketType,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventAddress: null == eventAddress
          ? _value.eventAddress
          : eventAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventCode: null == eventCode
          ? _value.eventCode
          : eventCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      evolveOnRedeem: null == evolveOnRedeem
          ? _value.evolveOnRedeem
          : evolveOnRedeem // ignore: cast_nullable_to_non_nullable
              as bool,
      seatInfo: null == seatInfo
          ? _value.seatInfo
          : seatInfo // ignore: cast_nullable_to_non_nullable
              as String,
      expireDate: freezed == expireDate
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.eventAddress, eventAddress) ||
                other.eventAddress == eventAddress) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.eventCode, eventCode) ||
                other.eventCode == eventCode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.evolveOnRedeem, evolveOnRedeem) ||
                other.evolveOnRedeem == evolveOnRedeem) &&
            (identical(other.seatInfo, seatInfo) ||
                other.seatInfo == seatInfo) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      eventName,
      eventDate,
      eventAddress,
      description,
      eventCode,
      quantity,
      evolveOnRedeem,
      seatInfo,
      expireDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      __$$_TicketCopyWithImpl<_$_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketToJson(
      this,
    );
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
  String get id;
  @override
  TicketType get type;
  @override
  String get eventName;
  @override
  DateTime? get eventDate;
  @override
  String get eventAddress;
  @override
  String get description;
  @override

  /// NEW STUFF vvvv
  String get eventCode;
  @override
  int get quantity;
  @override
  bool get evolveOnRedeem;
  @override
  String get seatInfo;
  @override
  DateTime? get expireDate;
  @override
  @JsonKey(ignore: true)
  _$$_TicketCopyWith<_$_Ticket> get copyWith =>
      throw _privateConstructorUsedError;
}
