import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base_component.dart';
import '../../components/sc_creator/common/form_group_header.dart';
import '../../components/sc_creator/common/modal_bottom_actions.dart';
import '../../components/sc_creator/common/modal_container.dart';
import 'fractional_provider.dart';

class FractionalModal extends BaseComponent {
  const FractionalModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(fractionalFormProvider.notifier);
    final _model = ref.watch(fractionalFormProvider);

    return Form(
      key: _provider.formKey,
      child: ModalContainer(children: [
        const FormGroupHeader(
          "Fractionalization",
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("Creator’s Retained Ownership"),
                  suffixIcon: Text("%"),
                  suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                ),
                validator: _provider.creatorRetainsValidator,
                controller: _provider.creatorRetainsController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("Fractional Interest"),
                  suffixIcon: Text("%"),
                  suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                ),
                validator: _provider.fractionalInterestValidator,
                controller: _provider.fractionalInterestController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Transform.translate(
              offset: const Offset(-6, 0),
              child: Checkbox(
                value: _model.allowVoting,
                onChanged: (val) {
                  if (val != null) {
                    _provider.setAllowVoting(val);
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                _provider.setAllowVoting(!_model.allowVoting);
              },
              child: const Text("Allow Voting"),
            ),
          ],
        ),
        if (_model.allowVoting) ...[
          TextFormField(
            decoration: const InputDecoration(label: Text("Voting Description")),
            controller: _provider.votingDescriptionController,
            minLines: 3,
            maxLines: 6,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text("Percentage Required for Voting Approval")),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text("Other Options")),
                ),
              ),
            ],
          )
        ],
        ModalBottomActions(
          onConfirm: () {
            _provider.complete(context);
          },
        )
      ]),
    );
  }
}
