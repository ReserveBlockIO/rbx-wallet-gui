import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_bottom_actions.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_phase_form_provider.dart';

class EvolveModal extends BaseComponent {
  const EvolveModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(evolveFormProvider.notifier);
    final _model = ref.watch(evolveFormProvider);

    final GlobalKey<FormState> _formKey = GlobalKey();

    return Form(
      key: _formKey,
      child: ModalContainer(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FormGroupHeader("Evolve"),
              SizedBox(
                width: 16,
              ),
              AppDropdown<EvolveType>(
                label: "Evolution Type",
                selectedValue: _model.type,
                selectedLabel: _model.typeLabel,
                onChange: (val) {
                  _provider.updateType(val);
                },
                options: Evolve.allTypes()
                    .map((type) => AppDropdownOption(
                        label: Evolve.typeToString(type), value: type))
                    .toList(),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     if (_model.type == EvolveType.variable)
          //       Expanded(
          //         child: TextFormField(
          //           controller: _provider.urlController,
          //           decoration: InputDecoration(
          //             label: Text("Metadata / API URL"),
          //             labelStyle: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       )
          //   ],
          // ),
          ..._model.phases.asMap().entries.map((entry) {
            final index = entry.key;
            final phase = entry.value;
            return _EvolvePhaseContainer(
              type: _model.type,
              phase: phase,
              index: index,
              canDelete: index + 1 == _model.phases.length,
            );
          }).toList(),
          ModalBottomActions(onConfirm: () {
            for (var i = 0; i < _model.phases.length; i++) {
              ref.read(evolvePhaseFormProvider(i).notifier).save();
            }

            _provider.complete();
            Navigator.of(context).pop();
          })
        ],
      ),
    );
  }
}

class _EvolvePhaseContainer extends BaseComponent {
  final EvolveType type;
  final EvolvePhase phase;
  final int index;
  final bool canDelete;

  const _EvolvePhaseContainer({
    Key? key,
    required this.type,
    required this.phase,
    required this.index,
    this.canDelete = false,
  }) : super(key: key);

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365 * 100),
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay(hour: 0, minute: 0),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey();

    final _evolveProvider = ref.read(evolveFormProvider.notifier);
    final _provider = ref.read(evolvePhaseFormProvider(index).notifier);

    bool _save() {
      if (!_formKey.currentState!.validate()) return false;

      return _provider.save();
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Phase ${index + 1}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white38, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (type == EvolveType.time)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onTap: () {
                                _showDatePicker(context);
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Evolution Date",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_month),
                                  onPressed: () {
                                    _showDatePicker(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              onTap: () {
                                _showTimePicker(context);
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Evolution Time",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.watch),
                                  onPressed: () {
                                    _showTimePicker(context);
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    if (type == EvolveType.numericVariable ||
                        type == EvolveType.stringVariable)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              inputFormatters:
                                  type == EvolveType.numericVariable
                                      ? [
                                          FilteringTextInputFormatter.allow(
                                            RegExp("[0-9.]"),
                                          )
                                        ]
                                      : [],
                              decoration: InputDecoration(
                                label: Text(
                                  "Expected Value",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _provider.nameController,
                            validator: _provider.nameValidator,
                            decoration: InputDecoration(
                              label: Text(
                                "Stage Name",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FileSelector(
                            title: "Stage Asset",
                            transparentBackground: true,
                          ),
                        )
                      ],
                    ),
                    TextFormField(
                      controller: _provider.descriptionController,
                      validator: _provider.descriptionValidator,
                      decoration: InputDecoration(
                        label: Text(
                          "Stage Description",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      minLines: 3,
                      maxLines: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: canDelete
                                ? () async {
                                    final confirmed = await ConfirmDialog.show(
                                      title: "Delete Phase",
                                      body:
                                          "Are you sure you want to delete this phase?",
                                      confirmText: "Delete",
                                      destructive: true,
                                    );

                                    if (confirmed == true) {
                                      _evolveProvider.removePhase(index);
                                    }
                                  }
                                : null,
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.danger,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppButton(
                                label: "Save",
                                onPressed: () {
                                  _save();
                                },
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              AppButton(
                                label: "Add Phase",
                                onPressed: () {
                                  final success = _save();
                                  if (success == true) {
                                    _evolveProvider.addPhase();
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
