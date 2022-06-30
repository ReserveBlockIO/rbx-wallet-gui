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

  static const compilerEnum = 12;

  const factory Ticket({
    @Default("") String id,
    @Default(TicketType.physicalEvent) TicketType type,
    @Default("") String eventName,
    DateTime? eventDate,
    @Default("") String eventAddress,
    @Default("") String description,

    /// NEW STUFF vvvv
    @Default("") String eventCode,
    @Default(1) int quantity,
    @Default(false) bool evolveOnRedeem,
    @Default("") String seatInfo,
    DateTime? expireDate,
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

  String? get dateTimeForCompiler {
    return eventDate != null ? eventDate!.toIso8601String() : null;
  }

  String get expireDateLabel {
    if (expireDate == null) return "";
    return DateFormat.yMd().format(expireDate!);
  }

  String get expireTimeLabel {
    if (expireDate == null) return "";
    return DateFormat.Hms().format(expireDate!);
  }

  String get expireDateTimeLabel {
    if (expireDate == null) return "";

    return "$dateLabel $timeLabel";
  }

  String? get expireDateTimeForCompiler {
    return expireDate != null ? expireDate!.toIso8601String() : null;
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

  Map<String, dynamic> serializeForCompiler() {
    return {
      'RedeemCode': '',
      'Quantity': quantity,
      'EventName': eventName,
      'EventDescription': description,
      'EventLocation': type == TicketType.onlineEvent ? '' : eventAddress,
      'EventDate': dateTimeForCompiler,
      'EventCode': eventCode,
      'EventWebsite': type == TicketType.onlineEvent ? eventAddress : '',
      'IsRedeemed': false,
      'EvolveOnRedeem': evolveOnRedeem,
      'SeatInfo': seatInfo,
      'ExpireDate': expireDateTimeForCompiler,
    };
  }
}
