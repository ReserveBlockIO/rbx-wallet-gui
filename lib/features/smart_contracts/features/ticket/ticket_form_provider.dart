import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_sc_provider.dart';
import 'package:rbx_wallet/utils/generators.dart';

class TicketFormProvider extends StateNotifier<Ticket> {
  final Reader read;
  late final TextEditingController eventNameController;
  late final TextEditingController eventAddressController;
  late final TextEditingController descriptionController;
  late final TextEditingController eventDateController;
  late final TextEditingController eventTimeController;

  TicketFormProvider(this.read, [Ticket model = const Ticket()])
      : super(model) {
    eventNameController = TextEditingController(text: model.eventName);
    eventAddressController = TextEditingController(text: model.eventAddress);
    descriptionController = TextEditingController(text: model.description);
    eventDateController = TextEditingController(text: model.dateLabel);
    eventTimeController = TextEditingController(text: model.timeLabel);

    setTicket(model);
  }

  setTicket(Ticket ticket) {
    state = ticket;

    eventNameController.text = ticket.eventName;
    eventAddressController.text = ticket.eventAddress;
    descriptionController.text = ticket.description;
    eventDateController.text = ticket.dateLabel;
    eventTimeController.text = ticket.timeLabel;
  }

  updateType(TicketType type) {
    state = state.copyWith(type: type);
  }

  updateDate(DateTime date) {
    final existing = state.eventDate;

    final d = existing == null
        ? date
        : DateTime(
            date.year, date.month, date.day, existing.hour, existing.minute);

    state = state.copyWith(eventDate: d);

    eventDateController.text = state.dateLabel;
  }

  updateTime(TimeOfDay time) {
    final existing = state.eventDate;
    final now = DateTime.now();

    final d = existing == null
        ? DateTime(now.year, now.month, now.day, time.hour, time.minute)
        : DateTime(existing.year, existing.month, existing.day, time.hour,
            time.minute);

    state = state.copyWith(eventDate: d);

    eventTimeController.text = state.timeLabel;
  }

  clear() {
    final id = uniqueId();
    state = Ticket(id: id);
    eventNameController.text = "";
    eventAddressController.text = "";
    descriptionController.text = "";
    eventDateController.text = "";
    eventTimeController.text = "";
  }

  complete() {
    state = state.copyWith(
      eventName: eventNameController.text,
      eventAddress: eventAddressController.text,
      description: descriptionController.text,
    );

    read(createScProvider.notifier).saveTicket(state);

    clear();
  }
}

final ticketFormProvider = StateNotifierProvider<TicketFormProvider, Ticket>(
  (ref) => TicketFormProvider(ref.read),
);
