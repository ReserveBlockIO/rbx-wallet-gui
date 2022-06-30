// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      id: json['id'] as String? ?? "",
      type: $enumDecodeNullable(_$TicketTypeEnumMap, json['type']) ??
          TicketType.physicalEvent,
      eventName: json['eventName'] as String? ?? "",
      eventDate: json['eventDate'] == null
          ? null
          : DateTime.parse(json['eventDate'] as String),
      eventAddress: json['eventAddress'] as String? ?? "",
      description: json['description'] as String? ?? "",
      eventCode: json['eventCode'] as String? ?? "",
      quantity: json['quantity'] as int? ?? 1,
      evolveOnRedeem: json['evolveOnRedeem'] as bool? ?? false,
      seatInfo: json['seatInfo'] as String? ?? "",
      expireDate: json['expireDate'] == null
          ? null
          : DateTime.parse(json['expireDate'] as String),
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$TicketTypeEnumMap[instance.type],
      'eventName': instance.eventName,
      'eventDate': instance.eventDate?.toIso8601String(),
      'eventAddress': instance.eventAddress,
      'description': instance.description,
      'eventCode': instance.eventCode,
      'quantity': instance.quantity,
      'evolveOnRedeem': instance.evolveOnRedeem,
      'seatInfo': instance.seatInfo,
      'expireDate': instance.expireDate?.toIso8601String(),
    };

const _$TicketTypeEnumMap = {
  TicketType.physicalEvent: 'physicalEvent',
  TicketType.onlineEvent: 'onlineEvent',
};
