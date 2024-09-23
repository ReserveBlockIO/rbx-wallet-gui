import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/dropdowns.dart';
import '../../components/sc_creator/common/file_selector.dart';
import '../../components/sc_creator/common/form_group_header.dart';
import '../../components/sc_creator/common/help_button.dart';
import '../../components/sc_creator/common/manage_properties_list.dart';
import '../../components/sc_creator/common/modal_bottom_actions.dart';
import '../../components/sc_creator/common/modal_container.dart';
import 'pair_provider.dart';

class PairModal extends BaseComponent {
  const PairModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(pairFormProvider.notifier);
    final _model = ref.watch(pairFormProvider);

    return Form(
      key: _provider.formKey,
      child: ModalContainer(children: [
        const FormGroupHeader(
          "Pair/Wrap with Existing NFT",
        ),
        Row(
          children: [
            AppDropdown<String>(
                label: "Network",
                selectedValue: _model.network,
                selectedLabel: _model.network,
                options: _provider.networkOptions.map((o) => AppDropdownOption<String>(label: o, value: o)).toList(),
                onChange: (val) {
                  _provider.setNetwork(val);
                }),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(label: Text("${_model.network} Contract Address")),
                validator: _provider.nftAddressValidator,
                controller: _provider.nftAddressController,
              ),
            ),
            if (_model.network != "VFX") ...[
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text("Token ID (Optional)")),
                  // validator: _provider.descriptionValidator,
                  // controller: _provider.descriptionController,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text("Token Standard (Optional)")),
                  // validator: _provider.descriptionValidator,
                  // controller: _provider.descriptionController,
                ),
              ),
            ]
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("Full Description")),
          validator: _provider.descriptionValidator,
          controller: _provider.descriptionController,
          minLines: 3,
          maxLines: 6,
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("Reason for Pairing/Wrapping")),
          validator: _provider.reasonValidator,
          controller: _provider.reasonController,
          minLines: 3,
          maxLines: 6,
        ),
        Row(
          children: [
            Expanded(
              child: FileSelector(
                title: "Provenance Files (Optional)",
                transparentBackground: true,
                asset: _model.provenance,
                onChange: (asset) {
                  if (asset != null) {
                    _provider.addProvenance(asset);
                  } else {
                    _provider.removeProvenance();
                  }
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(label: Text("Metadata URL")),
                controller: _provider.metadataUrlController,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              const Text(
                "Properties (Optional)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const HelpButton(HelpType.manageProperties)
            ],
          ),
        ),
        ManagePropertiesList(
          properties: _model.properties,
          onCreate: (property) {
            _provider.addProperty(property);
          },
          onRemove: (index) {
            _provider.removeProperty(index);
          },
        ),
        ModalBottomActions(
          onConfirm: () {
            _provider.complete(context);
          },
        )
      ]),
    );
  }
}
