import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;

import '../../../core/base_component.dart';
import '../../../core/models/value_label.dart';
import '../../../utils/validation.dart';
import '../models/adj_vote.dart';
import '../providers/adj_vote_form_provider.dart';

class AdjVoteForm extends BaseComponent {
  const AdjVoteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(adjVoteFormProvider);
    final provider = ref.read(adjVoteFormProvider.notifier);

    return Form(
      key: provider.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adj Vote In Details",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                ),
          ),
          _FormRow(
            children: [
              _FormField(
                label: "VFX Address to Nominate",
                controller: provider.rbxAddressController,
                validator: provider.rbxAddressValidator,
              ),
              _FormField(
                label: "IP Address",
                controller: provider.ipAddressController,
                required: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                ],
              )
            ],
          ),
          _FormRow(
            children: [
              _FormDropDown<Provider>(
                label: "Machine Provider",
                value: model.provider,
                options: provider.providerOptions(context),
                onChanged: (val) {
                  provider.setProvider(val);
                },
              ),
              _FormDropDown<OS>(
                label: "Machine OS",
                value: model.machineOs,
                options: provider.osOptions(context),
                onChanged: (val) {
                  provider.setMachineOs(val);
                },
              ),
              _FormField(
                label: "Machine Type",
                controller: provider.machineTypeController,
                required: true,
                hintText: "ie. Server, Desktop, Laptop, etc.",
              ),
            ],
          ),
          _FormRow(
            children: [
              _FormField(
                label: "CPU",
                controller: provider.machineCPUController,
                required: true,
                hintText: "ie. Intel",
              ),
              _FormField(
                label: "CPU Cores",
                controller: provider.machineCPUCoresController,
                required: true,
                selectOnFocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
              _FormField(
                label: "CPU Threads",
                controller: provider.machineCPUThreadsController,
                required: true,
                selectOnFocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
            ],
          ),
          _FormRow(
            children: [
              _FormField(
                label: "RAM (in GB)",
                controller: provider.machineRamController,
                required: true,
                selectOnFocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
              _FormField(
                label: "HD Size",
                controller: provider.machineHDDSizeController,
                required: true,
                selectOnFocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
              _FormDropDown<HDSizeSpecifier>(
                label: "HD Size Specifier",
                value: model.machineHDDSpecifier,
                options: provider.hdSizeSpecifierOptions(context),
                onChanged: (val) {
                  provider.setHdSizeSpecifier(val);
                },
              ),
            ],
          ),
          _FormRow(
            children: [
              _FormField(
                label: "Internet Speed Up (in Gbps)",
                controller: provider.internetSpeedUpController,
                required: true,
                selectOnFocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
              _FormField(
                label: "Internet Speed Down (in Gbps)",
                controller: provider.internetSpeedDownController,
                required: true,
                selectOnFocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
              _FormField(
                label: "Bandwith (in TB)",
                controller: provider.bandwithController,
                required: true,
                selectOnFocus: true,
                hintText: "0 for unlimited",
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
              ),
            ],
          ),
          _FormRow(
            children: [
              _FormField(
                label: "Technical Background",
                controller: provider.technicalBackgroundController,
                required: true,
                lines: 3,
                maxLength: 1000,
              ),
            ],
          ),
          _FormRow(
            children: [
              _FormField(
                label: "Reason To Become Adjudicator",
                controller: provider.reasonForAdjJoinController,
                required: true,
                lines: 3,
                maxLength: 1000,
              ),
            ],
          ),
          _FormRow(
            children: [
              _FormField(
                label: "Github Link (Optional)",
                controller: provider.githubLinkController,
              ),
              _FormField(
                label: "Additional Link(s) (Optional)",
                controller: provider.supplementalURLsController,
                hintText: "Separate multiple with commas",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormRow extends StatelessWidget {
  final List<Widget> children;
  const _FormRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children.asMap().entries.map((e) {
          final index = e.key;
          final child = e.value;
          final isLast = index + 1 == children.length;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : 6),
              child: child,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String?)? validator;
  final bool required;
  final List<TextInputFormatter>? inputFormatters;
  final int? lines;
  final int? maxLength;
  final bool selectOnFocus;
  final String? hintText;

  const _FormField({
    Key? key,
    required this.label,
    required this.controller,
    this.required = false,
    this.validator,
    this.inputFormatters,
    this.lines,
    this.maxLength,
    this.selectOnFocus = false,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      minLines: lines,
      maxLines: lines != null ? lines! * 2 : null,
      maxLength: maxLength,
      decoration: InputDecoration(label: Text(label), hintText: hintText),
      onTap: selectOnFocus
          ? () => controller.selection = TextSelection(
              baseOffset: 0, extentOffset: controller.value.text.length)
          : () => {},
      validator: required
          ? (val) => formValidatorNotEmpty(val, label)
          : (val) {
              if (validator != null) {
                return validator!(val);
              }
              return null;
            },
    );
  }
}

class _FormDropDown<T> extends StatelessWidget {
  final T value;
  final List<ValueLabel<T>> options;
  final Function(T? val) onChanged;
  final String label;

  const _FormDropDown({
    Key? key,
    required this.value,
    required this.options,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        SizedBox(
          height: 35,
          child: DropdownButton<T>(
            focusColor: Colors.transparent,
            value: value,
            underline: Container(
              width: double.infinity,
              height: 0.75,
              color: Colors.white70,
            ),
            items: options.map((item) {
              return DropdownMenuItem<T>(
                value: item.value,
                child: Text(item.label),
              );
            }).toList(),
            onChanged: onChanged,
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}
