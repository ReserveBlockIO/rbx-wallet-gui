import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/manage_properties_list.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_bottom_actions.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/tokenization/tokenization_provider.dart';

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
          withBg: false,
        ),
        TextFormField(
          decoration: InputDecoration(label: Text("Physical/Digital Good Name")),
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
            SizedBox(
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
          decoration: InputDecoration(label: Text("Description of Physical/Digital Good")),
          validator: _provider.descriptionValidator,
          controller: _provider.descriptionController,
          minLines: 3,
          maxLines: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Text(
                "Properties (Optional)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              HelpButton(HelpType.manageProperties)
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
