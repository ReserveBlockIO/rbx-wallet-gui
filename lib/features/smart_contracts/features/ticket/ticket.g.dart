// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      id: json['id'] as String? ?? '',
      type: $enumDecodeNullable(_$TicketTypeEnumMap, json['type']) ??
          TicketType.physicalEvent,
      eventName: json['eventName'] as String? ?? '',
      eventDate: json['eventDate'] == null
          ? null
          : DateTime.parse(json['eventDate'] as String),
      eventAddress: json['eventAddress'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$TicketTypeEnumMap[instance.type],
      'eventName': instance.eventName,
      'eventDate': instance.eventDate?.toIso8601String(),
      'eventAddress': instance.eventAddress,
      'description': instance.description,
    };

const _$TicketTypeEnumMap = {
  TicketType.physicalEvent: 'physicalEvent',
  TicketType.onlineEvent: 'onlineEvent',
};
