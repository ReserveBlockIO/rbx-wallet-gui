import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/voting/providers/adj_vote_form_provider.dart';
import 'package:rbx_wallet/utils/validation.dart';

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
                label: "RBX Address",
                controller: provider.rbxAddressController,
                required: true,
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
          )
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
    return Row(
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
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String?)? validator;
  final bool required;
  final List<TextInputFormatter>? inputFormatters;

  const _FormField({
    Key? key,
    required this.label,
    required this.controller,
    this.required = true,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(label: Text(label)),
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
