import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

enum TicketType {
  physicalEvent,
  onlineEvent,
}

@freezed
abstract class Ticket with _$Ticket {
  const Ticket._();

  const factory Ticket({
    @Default("") String id,
    @Default(TicketType.physicalEvent) TicketType type,
    @Default("") String eventName,
    DateTime? eventDate,
    @Default("") String eventAddress,
    @Default("") String description,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  String get typeLabel {
    return typeToString(type);
  }

  String get dateLabel {
    if (eventDate == null) return "";
    return DateFormat.yMd().format(eventDate!);
  }

  String get timeLabel {
    if (eventDate == null) return "";
    return DateFormat.Hms().format(eventDate!);
  }

  String get dateTimeLabel {
    if (eventDate == null) return "";

    return "$dateLabel $timeLabel";
  }

  static typeToString(TicketType type) {
    switch (type) {
      case TicketType.physicalEvent:
        return "Physical Event";
      case TicketType.onlineEvent:
        return "Online Event";
    }
  }

  static List<TicketType> allTypes() {
    return [
      TicketType.physicalEvent,
      TicketType.onlineEvent,
    ];
  }
}
