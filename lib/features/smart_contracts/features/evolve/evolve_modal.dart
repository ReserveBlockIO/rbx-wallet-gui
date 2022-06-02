import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
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
              FormGroupHeader(
                "Evolve",
                withBg: false,
              ),
              SizedBox(
                width: 16,
              ),
              HelpButton(
                HelpType.evolveMode,
                subtle: true,
              ),
              AppDropdown<bool>(
                label: "Evolving Mode",
                selectedValue: _model.isDynamic,
                selectedLabel: _model.isDynamic
                    ? "Automated/Application Controlled"
                    : "Issuer/Minter Controlled",
                onChange: (val) {
                  _provider.updateMode(val);
                },
                options: [false, true]
                    .map(
                      (val) => AppDropdownOption(
                        label: val
                            ? "Automated/Application Controlled"
                            : "Issuer/Minter Controlled",
                        value: val,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                width: 16,
              ),
              HelpButton(
                HelpType.evolveType,
                subtle: true,
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
              isLast: index + 1 == _model.phases.length,
            );
          }).toList(),
          ModalBottomActions(
              showConfirm: false,
              onConfirm: () {
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
  final bool isLast;

  const _EvolvePhaseContainer({
    Key? key,
    required this.type,
    required this.phase,
    required this.index,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey();

    final _evolveProvider = ref.read(evolveFormProvider.notifier);
    final _provider = ref.read(evolvePhaseFormProvider(index).notifier);

    final canAddPhase = index < 24;

    Future<void> _showDatePicker() async {
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

    Future<void> _showTimePicker() async {
      final t = await showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(hour: 0, minute: 0),
      );

      if (t != null) {
        _provider.updateTime(t);
      }
    }

    bool _save() {
      if (!_formKey.currentState!.validate()) return false;

      // if(_provider.nameController.text.isEmpty) {

      // }

      //   final _evolveModel = ref.read(evolveFormProvider);
      // final _model = ref.read(evolvePhaseFormProvider(index));

      // switch(_evolveModel.type) {
      //   case EvolveType.blockHeight:
      //     if()
      // }

      // if(_evolveModel.type == EvolveType.blockHeight){

      // }

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
                "Evolve Stage ${index + 1}",
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
                              controller: _provider.dateController,
                              validator: _provider.dateTimeValidator,
                              onTap: () {
                                _showDatePicker();
                              },
                              decoration: InputDecoration(
                                prefixIcon: HelpButton(
                                  HelpType.evolveDatetime,
                                  subtle: true,
                                ),
                                label: Text(
                                  "Evolution Date",
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
                              controller: _provider.timeController,
                              validator: _provider.dateTimeValidator,
                              onTap: () {
                                _showTimePicker();
                              },
                              decoration: InputDecoration(
                                prefixIcon: HelpButton(
                                  HelpType.evolveDatetime,
                                  subtle: true,
                                ),
                                label: Text(
                                  "Evolution Time",
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
                          )
                        ],
                      ),
                    if (type == EvolveType.blockHeight)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _provider.blockHeightController,
                              validator: _provider.blockHeightValidator,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]"),
                                )
                              ],
                              decoration: InputDecoration(
                                prefixIcon: HelpButton(
                                  HelpType.evolveBlockHeight,
                                  subtle: true,
                                ),
                                label: Text(
                                  "Block Height Value",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _provider.nameController,
                            validator: _provider.nameValidator,
                            decoration: InputDecoration(
                              prefixIcon: HelpButton(
                                HelpType.evolveStageName,
                                subtle: true,
                              ),
                              label: Text(
                                "Evolve Stage Name",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FileSelector(
                            title: "Evolve Stage Asset",
                            asset:
                                ref.watch(evolvePhaseFormProvider(index)).asset,
                            transparentBackground: true,
                            onChange: (Asset? asset) {
                              _provider.setAsset(asset);
                            },
                          ),
                        ),
                        HelpButton(
                          HelpType.evolveAsset,
                          subtle: true,
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _provider.descriptionController,
                      validator: _provider.descriptionValidator,
                      decoration: InputDecoration(
                        prefixIcon: HelpButton(
                          HelpType.evolveStageDescription,
                          subtle: true,
                        ),
                        label: Text(
                          "Evolve Stage Description",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      minLines: 3,
                      maxLines: 6,
                    ),
                    if (isLast)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final confirmed = await ConfirmDialog.show(
                                  title: "Delete Stage",
                                  body:
                                      "Are you sure you want to delete this stage?",
                                  confirmText: "Delete",
                                  destructive: true,
                                );

                                if (confirmed == true) {
                                  _evolveProvider.removePhase(index);
                                }
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).colorScheme.danger,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (canAddPhase)
                                  AppButton(
                                    label: "Create New Phase",
                                    icon: Icons.add,
                                    variant: AppColorVariant.Light,
                                    onPressed: () {
                                      final success = _save();
                                      if (success == true) {
                                        _evolveProvider.addPhase();
                                      }
                                    },
                                  ),
                                SizedBox(
                                  width: 4,
                                ),
                                AppButton(
                                  label: "Save and Close",
                                  icon: Icons.save,
                                  variant: AppColorVariant.Success,
                                  onPressed: () {
                                    final success = _save();
                                    if (success == true) {
                                      // _evolveProvider.addPhase();
                                      _evolveProvider.complete();
                                      Navigator.of(context).pop();
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
