import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils.dart';
import '../../../sc_property/components/property_modal.dart';
import '../../../sc_property/models/sc_property.dart';
import '../../../sc_property/providers/edit_sc_property_provider.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/components/dropdowns.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../asset/asset.dart';
import '../../components/sc_creator/common/file_selector.dart';
import '../../components/sc_creator/common/form_group_header.dart';
import '../../components/sc_creator/common/help_button.dart';
import '../../components/sc_creator/common/modal_bottom_actions.dart';
import '../../components/sc_creator/common/modal_container.dart';
import 'evolve.dart';
import 'evolve_form_provider.dart';
import 'evolve_phase.dart';
import 'evolve_phase_form_provider.dart';

class EvolveModal extends BaseComponent {
  const EvolveModal({Key? key}) : super(key: key);

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
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
              buildHeader(),
              const SizedBox(width: 16),
              buildEvolveMode(_model, _provider),
              const SizedBox(width: 16),
              buildEvolveType(_model, _provider),
            ],
          ),
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

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(evolveFormProvider.notifier);
    final _model = ref.watch(evolveFormProvider);

    final GlobalKey<FormState> _formKey = GlobalKey();

    return Form(
      key: _formKey,
      child: ModalContainer(
        children: [
          buildHeader(),
          const SizedBox(height: 12),
          buildEvolveMode(_model, _provider),
          const SizedBox(height: 12),
          buildEvolveType(_model, _provider),
          const SizedBox(height: 12),
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

  Row buildEvolveType(Evolve _model, EvolveFormProvider _provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HelpButton(
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
          options: (!_model.isDynamic
                  ? [EvolveType.manualOnly]
                  : [
                      EvolveType.time,
                      EvolveType.blockHeight,
                    ])
              .map((type) => AppDropdownOption(label: Evolve.typeToString(type), value: type))
              .toList(),
        ),
      ],
    );
  }

  Widget buildEvolveMode(Evolve _model, EvolveFormProvider _provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HelpButton(
          HelpType.evolveMode,
          subtle: true,
        ),
        AppDropdown<bool>(
          label: "Evolving Mode",
          selectedValue: _model.isDynamic,
          selectedLabel: _model.isDynamic ? "Automated/Application Controlled" : "Issuer/Minter Controlled",
          onChange: (val) {
            _provider.updateMode(val);
          },
          options: [false, true]
              .map(
                (val) => AppDropdownOption(
                  label: val ? "Automated/Application Controlled" : "Issuer/Minter Controlled",
                  value: val,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Row buildHeader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        FormGroupHeader(
          "Evolve",
        ),
      ],
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

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final _provider = ref.read(evolvePhaseFormProvider(index).notifier);
    final _d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 100),
      ),
    );

    if (_d != null) {
      final now = DateTime.now();
      final d = DateTime(_d.year, _d.month, _d.day, now.hour + 1, now.minute, now.second);
      _provider.updateDate(d);
    }
  }

  Future<void> _showTimePicker(BuildContext context, WidgetRef ref) async {
    final _provider = ref.read(evolvePhaseFormProvider(index).notifier);
    final t = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (t != null) {
      _provider.updateTime(t);
    }
  }

  Future<ScProperty?> _handlePropertyEdit(BuildContext context, WidgetRef ref, {ScProperty? property}) async {
    if (property == null) {
      ref.read(editScPropertyProvider.notifier).clear();
    } else {
      ref.read(editScPropertyProvider.notifier).set(property);
    }

    return await showModalBottomSheet(
        context: context,
        builder: (context) {
          return PropertyModal();
        });
  }

  Future<void> deleteStage(BuildContext context, WidgetRef ref) async {
    final _evolveProvider = ref.read(evolveFormProvider.notifier);

    final confirmed = await ConfirmDialog.show(
      title: "Delete Stage",
      body: "Are you sure you want to delete this stage?",
      confirmText: "Delete",
      destructive: true,
    );

    if (confirmed == true) {
      _evolveProvider.removePhase(index);
    }
  }

  bool _save(BuildContext context, WidgetRef ref, formKey) {
    final _provider = ref.read(evolvePhaseFormProvider(index).notifier);

    if (!formKey.currentState!.validate()) return false;

    return _provider.save();
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey();

    final _evolveProvider = ref.read(evolveFormProvider.notifier);
    final _provider = ref.read(evolvePhaseFormProvider(index).notifier);
    final _phaseModel = ref.watch(evolvePhaseFormProvider(index));

    final canAddPhase = index < 24;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeading(context),
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
                      Column(
                        children: [
                          buildDate(_provider, () => _showDatePicker(context, ref)),
                          const SizedBox(height: 8),
                          buildTime(_provider, () => _showTimePicker(context, ref))
                        ],
                      ),
                    if (type == EvolveType.blockHeight) buildBlockHeight(_provider),
                    buildStageName(_provider),
                    Row(
                      children: [
                        Expanded(
                          child: buildFileSelector(ref, _provider),
                        ),
                        const HelpButton(
                          HelpType.evolveAsset,
                          subtle: true,
                        ),
                      ],
                    ),
                    buildDescription(_provider),
                    buildProperties(context, ref, _provider, _phaseModel),
                    if (isLast)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildDelete(() => deleteStage(context, ref), context),
                            if (canAddPhase) buildNewPhase(() => _save(context, ref, _formKey), _evolveProvider),
                            const SizedBox(height: 6),
                            buildSave(() => _save(context, ref, _formKey), _evolveProvider, context),
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

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey();

    final _evolveProvider = ref.read(evolveFormProvider.notifier);
    final _provider = ref.read(evolvePhaseFormProvider(index).notifier);
    final _phaseModel = ref.watch(evolvePhaseFormProvider(index));

    final canAddPhase = index < 24;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeading(context),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (type == EvolveType.time)
                      Row(
                        children: [
                          Expanded(
                            child: buildDate(_provider, () => _showDatePicker(context, ref)),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: buildTime(_provider, () => _showTimePicker(context, ref)),
                          )
                        ],
                      ),
                    if (type == EvolveType.blockHeight)
                      Row(
                        children: [
                          Expanded(
                            child: buildBlockHeight(_provider),
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: buildStageName(_provider),
                        ),
                        Expanded(
                          child: buildFileSelector(ref, _provider),
                        ),
                        const HelpButton(
                          HelpType.evolveAsset,
                          subtle: true,
                        ),
                      ],
                    ),
                    buildDescription(_provider),
                    buildProperties(context, ref, _provider, _phaseModel),
                    if (isLast)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildDelete(() => deleteStage(context, ref), context),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (canAddPhase) buildNewPhase(() => _save(context, ref, _formKey), _evolveProvider),
                                const SizedBox(
                                  width: 4,
                                ),
                                buildSave(() => _save(context, ref, _formKey), _evolveProvider, context),
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

  Widget buildProperties(
    BuildContext context,
    WidgetRef ref,
    EvolvePhaseFormProvider phaseProvider,
    EvolvePhase phase,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Text(
              "Properties (Optional)",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 6,
            ),
            AppButton(
              label: "Add Property",
              onPressed: () async {
                final property = await _handlePropertyEdit(context, ref);
                if (property != null) {
                  phaseProvider.addProperty(property);
                }
              },
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
            spacing: 4.0,
            runSpacing: 4.0,
            children: phase.properties.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final p = entry.value;
                return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    margin: EdgeInsets.zero,
                    key: Key("${p.name}|${p.value}"),
                    child: InkWell(
                      onTap: () async {
                        final property = await _handlePropertyEdit(context, ref, property: p);
                        if (property != null) {
                          phaseProvider.updateProperty(property, index);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${truncatedText(p.name)}: ${truncatedText(p.value)}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () {
                                phaseProvider.removeProperty(index);
                              },
                              child: Icon(
                                Icons.delete,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ).toList()),
        SizedBox(
          height: 8,
        ),
        Divider(),
      ],
    );
  }

  AppButton buildSave(bool Function() save, EvolveFormProvider _evolveProvider, BuildContext context) {
    return AppButton(
      label: "Save and Close",
      icon: Icons.save,
      variant: AppColorVariant.Success,
      onPressed: () {
        final success = save();
        if (success == true) {
          // _evolveProvider.addPhase();
          _evolveProvider.complete();
          Navigator.of(context).pop();
        }
      },
    );
  }

  AppButton buildNewPhase(bool Function() save, EvolveFormProvider _evolveProvider) {
    return AppButton(
      label: "Create New Phase",
      icon: Icons.add,
      variant: AppColorVariant.Light,
      onPressed: () {
        final success = save();
        if (success == true) {
          _evolveProvider.addPhase();
        }
      },
    );
  }

  IconButton buildDelete(Future<void> Function() deleteStage, BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteStage();
      },
      icon: Icon(
        Icons.delete,
        color: Theme.of(context).colorScheme.danger,
      ),
    );
  }

  TextFormField buildDescription(EvolvePhaseFormProvider _provider) {
    return TextFormField(
      controller: _provider.descriptionController,
      validator: _provider.descriptionValidator,
      decoration: const InputDecoration(
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
    );
  }

  FileSelector buildFileSelector(WidgetRef ref, EvolvePhaseFormProvider _provider) {
    return FileSelector(
      title: "Evolve Stage Asset",
      asset: ref.watch(evolvePhaseFormProvider(index)).asset,
      transparentBackground: true,
      onChange: (Asset? asset) {
        _provider.setAsset(asset);
      },
    );
  }

  TextFormField buildStageName(EvolvePhaseFormProvider _provider) {
    return TextFormField(
      controller: _provider.nameController,
      validator: _provider.nameValidator,
      decoration: const InputDecoration(
        prefixIcon: HelpButton(
          HelpType.evolveStageName,
          subtle: true,
        ),
        label: Text(
          "Evolve Stage Name",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  TextFormField buildBlockHeight(EvolvePhaseFormProvider _provider) {
    return TextFormField(
      controller: _provider.blockHeightController,
      validator: _provider.blockHeightValidator,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp("[0-9]"),
        )
      ],
      decoration: const InputDecoration(
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
    );
  }

  TextFormField buildTime(EvolvePhaseFormProvider _provider, Future<void> Function() _showTimePicker) {
    return TextFormField(
      controller: _provider.timeController,
      validator: _provider.dateTimeValidator,
      onTap: () {
        _showTimePicker();
      },
      decoration: InputDecoration(
        prefixIcon: const HelpButton(
          HelpType.evolveDatetime,
          subtle: true,
        ),
        label: Text(
          "Evolution Time (${DateTime.now().timeZoneName.toString()})",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.watch),
          onPressed: () {
            _showTimePicker();
          },
        ),
      ),
    );
  }

  TextFormField buildDate(EvolvePhaseFormProvider _provider, Future<void> Function() _showDatePicker) {
    return TextFormField(
      controller: _provider.dateController,
      validator: _provider.dateTimeValidator,
      onTap: () {
        _showDatePicker();
      },
      decoration: InputDecoration(
        prefixIcon: const HelpButton(
          HelpType.evolveDatetime,
          subtle: true,
        ),
        label: const Text(
          "Evolution Date",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: () {
            _showDatePicker();
          },
        ),
      ),
    );
  }

  Padding buildHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "Evolve Stage ${index + 1}",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
