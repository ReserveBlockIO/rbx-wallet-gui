import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sc_creator/common/help_button.dart';
import '../features/evolve/evolve.dart';
import '../features/evolve/evolve_phase_wizard_form_provider.dart';
import '../providers/sc_wizard_provider.dart';

import '../../../core/base_component.dart';
import '../../asset/asset.dart';
import 'sc_creator/common/file_selector.dart';

class ScWizardEvolvesDialog extends BaseComponent {
  ScWizardEvolvesDialog({Key? key, required this.entryIndex, required this.phaseIndex}) : super(key: key);

  final int phaseIndex;
  final int entryIndex;

  final stageNameController = TextEditingController();
  final stageDescriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(evolvePhaseWizardFormProvider(phaseIndex).notifier);
    final model = ref.read(evolvePhaseWizardFormProvider(phaseIndex));
    final type = ref.read(scWizardProvider.notifier).getEvolveType(entryIndex);
    return StatefulBuilder(builder: (context, setState) {
      return Form(
        key: formKey,
        child: AlertDialog(
          title: const Text("Evolving phase"),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: provider.nameValidator,
                        controller: provider.nameController,
                        decoration: const InputDecoration(
                          suffix: HelpButton(HelpType.evolveStageName),
                          label: Text("Evolve Stage Name"),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
                FileSelector(
                  title: "Evolve Stage Asset",
                  asset: ref.watch(evolvePhaseWizardFormProvider(phaseIndex)).asset,
                  transparentBackground: true,
                  allowReplace: false,
                  onChange: (Asset? asset) {
                    provider.setAsset(asset);
                  },
                ),
                TextFormField(
                  controller: provider.descriptionController,
                  validator: provider.descriptionValidator,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    suffix: HelpButton(HelpType.evolveStageDescription),
                    label: Text("Evolve Stage Description"),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                if (type == EvolveType.time)
                  Column(
                    children: [
                      buildDate(provider, () => _showDatePicker(context, ref), type),
                      const SizedBox(
                        height: 6,
                      ),
                      buildTime(
                        provider,
                        () => _showTimePicker(context, ref),
                        type,
                      ),
                    ],
                  ),
                if (type == EvolveType.blockHeight) buildBlockHeight(provider, type),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white60),
              ),
            ),
            TextButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                final e = provider.generateEvolvePhase();
                if (e != null) {
                  Navigator.of(context).pop(e);
                }
              },
              child: const Text(
                "Add evolving phase",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    });
  }

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final _provider = ref.read(evolvePhaseWizardFormProvider(phaseIndex).notifier);
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
    final _provider = ref.read(evolvePhaseWizardFormProvider(phaseIndex).notifier);
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

  TextFormField buildTime(EvolvePhaseWizardFormProvider _provider, Future<void> Function() _showTimePicker, EvolveType type) {
    return TextFormField(
      controller: _provider.timeController,
      validator: (val) {
        return _provider.dateTimeValidator(val, type);
      },
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

  TextFormField buildBlockHeight(EvolvePhaseWizardFormProvider _provider, EvolveType type) {
    return TextFormField(
      controller: _provider.blockHeightController,
      validator: (val) => _provider.blockHeightValidator(val, type),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp("[0-9]"),
        )
      ],
      decoration: const InputDecoration(
        suffix: HelpButton(
          HelpType.evolveBlockHeight,
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

  TextFormField buildDate(EvolvePhaseWizardFormProvider _provider, Future<void> Function() _showDatePicker, EvolveType type) {
    return TextFormField(
      controller: _provider.dateController,
      validator: (value) => _provider.dateTimeValidator(value, type),
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
}
