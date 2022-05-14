import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_bottom_actions.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket_form_provider.dart';

class TicketModal extends BaseComponent {
  const TicketModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(ticketFormProvider.notifier);
    final _model = ref.watch(ticketFormProvider);

    final GlobalKey<FormState> _formKey = GlobalKey();

    void _showDatePicker() async {
      final d = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 365 * 100),
        ),
      );

      if (d != null) {
        _provider.updateDate(d);
      }
    }

    void _showTimePicker() async {
      final t = await showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(hour: 0, minute: 0),
      );

      if (t != null) {
        _provider.updateTime(t);
      }
    }

    return Form(
      key: _formKey,
      child: ModalContainer(
        children: [
          FormGroupHeader("Ticket"),
          Row(
            children: [
              AppDropdown<TicketType>(
                label: "Ticket Type",
                selectedValue: _model.type,
                selectedLabel: _model.typeLabel,
                onChange: (val) {
                  _provider.updateType(val);
                },
                options: Ticket.allTypes()
                    .map(
                      (type) => AppDropdownOption<TicketType>(
                        value: type,
                        label: Ticket.typeToString(type),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _provider.eventNameController,
                  decoration: InputDecoration(
                    label: Text("Event Name"),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  // validator: _provider.addressValidator,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _provider.eventAddressController,
                  decoration: InputDecoration(
                    label: Text(_model.type == TicketType.physicalEvent
                        ? "Event Address"
                        : "Event URL"),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  // validator: _provider.addressValidator,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _provider.eventDateController,
                  onTap: () {
                    _showDatePicker();
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Event Date",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        _showDatePicker();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _provider.eventTimeController,
                  onTap: () {
                    _showTimePicker();
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Event Time",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.watch),
                      onPressed: () {
                        _showTimePicker();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FileSelector(
                  title: "Ticket Image",
                  transparentBackground: true,
                  onChange: (Asset? asset) {},
                ),
              ),
            ],
          ),
          TextFormField(
            controller: _provider.descriptionController,
            decoration: InputDecoration(
              label: Text("Event Description"),
              labelStyle: TextStyle(color: Colors.white),
            ),
            // validator: _provider.addressValidator,
          ),
          ModalBottomActions(
            onConfirm: () {
              if (!_formKey.currentState!.validate()) return;

              _provider.complete();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
