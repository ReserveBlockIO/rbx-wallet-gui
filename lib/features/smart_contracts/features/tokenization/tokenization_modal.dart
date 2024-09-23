import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base_component.dart';
import '../../components/sc_creator/common/file_selector.dart';
import '../../components/sc_creator/common/form_group_header.dart';
import '../../components/sc_creator/common/help_button.dart';
import '../../components/sc_creator/common/manage_properties_list.dart';
import '../../components/sc_creator/common/modal_bottom_actions.dart';
import '../../components/sc_creator/common/modal_container.dart';
import 'tokenization_provider.dart';

class TokenizationModal extends BaseComponent {
  const TokenizationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(tokenizationFormProvider.notifier);
    final _model = ref.watch(tokenizationFormProvider);

    return Form(
      key: _provider.formKey,
      child: ModalContainer(children: [
        const FormGroupHeader(
          "Tokenization",
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("Physical/Digital Good Name")),
          validator: _provider.nameValidator,
          controller: _provider.nameController,
        ),
        Row(
          children: [
            Expanded(
              child: FileSelector(
                title: "Image(s)",
                transparentBackground: true,
                asset: _model.photo,
                onChange: (asset) {
                  if (asset != null) {
                    _provider.addPhoto(asset);
                  } else {
                    _provider.removePhoto();
                  }
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
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
            )
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("Description of Physical/Digital Good")),
          validator: _provider.descriptionValidator,
          controller: _provider.descriptionController,
          minLines: 3,
          maxLines: 6,
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
