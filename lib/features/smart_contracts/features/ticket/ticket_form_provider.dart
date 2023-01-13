import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/generators.dart';
import '../../providers/create_smart_contract_provider.dart';
import 'ticket.dart';

class TicketFormProvider extends StateNotifier<Ticket> {
  final Reader read;
  late final TextEditingController eventNameController;
  late final TextEditingController eventAddressController;
  late final TextEditingController descriptionController;
  late final TextEditingController eventDateController;
  late final TextEditingController eventTimeController;
  late final TextEditingController eventCodeController;
  late final TextEditingController quantityController;
  late final TextEditingController seatInfoController;
  late final TextEditingController eventExpireDateController;
  late final TextEditingController eventExpireTimeController;

  TicketFormProvider(this.read, [Ticket model = const Ticket()]) : super(model) {
    eventNameController = TextEditingController(text: model.eventName);
    eventAddressController = TextEditingController(text: model.eventAddress);
    descriptionController = TextEditingController(text: model.description);
    eventDateController = TextEditingController(text: model.dateLabel);
    eventTimeController = TextEditingController(text: model.timeLabel);
    eventCodeController = TextEditingController(text: model.eventCode);
    quantityController = TextEditingController(text: model.quantity.toString());
    seatInfoController = TextEditingController(text: model.seatInfo);
    eventExpireDateController = TextEditingController(text: model.expireDateLabel);
    eventExpireTimeController = TextEditingController(text: model.expireTimeLabel);

    setTicket(model);
  }

  setTicket(Ticket ticket) {
    state = ticket;

    eventNameController.text = ticket.eventName;
    eventAddressController.text = ticket.eventAddress;
    descriptionController.text = ticket.description;
    eventCodeController.text = ticket.eventCode;
    eventDateController.text = ticket.dateLabel;
    eventTimeController.text = ticket.timeLabel;
    quantityController.text = ticket.quantity.toString();
    seatInfoController.text = ticket.seatInfo;
    eventExpireDateController.text = ticket.expireDateLabel;
    eventExpireTimeController.text = ticket.expireTimeLabel;
  }

  updateType(TicketType type) {
    state = state.copyWith(type: type);
  }

  setEvolveOnRedeem(bool value) {
    state = state.copyWith(evolveOnRedeem: value);
  }

  updateDate(DateTime date) {
    final existing = state.eventDate;

    final d = existing == null ? date : DateTime(date.year, date.month, date.day, existing.hour, existing.minute);

    state = state.copyWith(eventDate: d);

    eventDateController.text = state.dateLabel;
  }

  updateTime(TimeOfDay time) {
    final existing = state.eventDate;
    final now = DateTime.now();

    final d = existing == null
        ? DateTime(now.year, now.month, now.day, time.hour, time.minute)
        : DateTime(existing.year, existing.month, existing.day, time.hour, time.minute);

    state = state.copyWith(eventDate: d);

    eventTimeController.text = state.timeLabel;
  }

  updateExpireDate(DateTime date) {
    final existing = state.expireDate;

    final d = existing == null ? date : DateTime(date.year, date.month, date.day, existing.hour, existing.minute);

    state = state.copyWith(expireDate: d);

    eventExpireDateController.text = state.expireDateLabel;
  }

  updateExpireTime(TimeOfDay time) {
    final existing = state.expireDate;
    final now = DateTime.now();

    final d = existing == null
        ? DateTime(now.year, now.month, now.day, time.hour, time.minute)
        : DateTime(existing.year, existing.month, existing.day, time.hour, time.minute);

    state = state.copyWith(expireDate: d);

    eventExpireTimeController.text = state.expireTimeLabel;
  }

  clear() {
    final id = uniqueId();
    state = Ticket(id: id);
    eventNameController.text = "";
    eventAddressController.text = "";
    descriptionController.text = "";
    eventCodeController.text = "";
    eventDateController.text = "";
    eventTimeController.text = "";
    quantityController.text = "1";
    seatInfoController.text = "";
    eventExpireDateController.text = "";
    eventExpireTimeController.text = "";
  }

  complete() {
    state = state.copyWith(
      eventName: eventNameController.text,
      eventAddress: eventAddressController.text,
      description: descriptionController.text,
      eventCode: eventCodeController.text,
      quantity: int.parse(quantityController.text),
      seatInfo: seatInfoController.text,
    );

    read(createSmartContractProvider.notifier).saveTicket(state);

    clear();
  }
}

final ticketFormProvider = StateNotifierProvider<TicketFormProvider, Ticket>(
  (ref) => TicketFormProvider(ref.read),
);
