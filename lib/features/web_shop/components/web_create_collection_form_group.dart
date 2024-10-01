import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/constants.dart';
import '../providers/web_collection_form_provider.dart';

import '../../../core/base_component.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';

class WebCreateCollectionFormGroup extends BaseComponent {
  const WebCreateCollectionFormGroup({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(webCollectionFormProvider.notifier);
    final model = ref.read(webCollectionFormProvider);
    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Flexible(
                    child: _CollectionName(),
                  ),
                  Flexible(
                    child: _CollectionDescription(),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Flexible(child: _IsLiveCheckbox()),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _IsLiveCheckbox extends BaseComponent {
  const _IsLiveCheckbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(webCollectionFormProvider.notifier);
    final model = ref.watch(webCollectionFormProvider);
    return Row(
      children: [
        Checkbox(
            value: model.isLive,
            onChanged: (val) {
              if (val != null) {
                provider.updateIsLive(val);
              }
            }),
        GestureDetector(
          onTap: () {
            provider.updateIsLive(!model.isLive);
          },
          child: const Text("Publish Live"),
        ),
      ],
    );
  }
}

class _CollectionName extends BaseComponent {
  const _CollectionName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(webCollectionFormProvider.notifier);
    return TextFormField(
      controller: provider.nameController,
      maxLength: MAX_DEC_SHOP_COLLECTION_NAME_LENGTH,
      onChanged: provider.updateName,
      validator: formValidatorDecName,
      decoration: InputDecoration(
        label: const Text(
          "Collection Name",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _CollectionDescription extends BaseComponent {
  const _CollectionDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(webCollectionFormProvider.notifier);
    return TextFormField(
      controller: provider.descriptionController,
      onChanged: provider.updateDescription,
      maxLength: MAX_DEC_SHOP_COLLECTION_DESCRIPTION_LENGTH,
      validator: formValidatorDecDescription,
      maxLines: 3,
      decoration: InputDecoration(
        label: const Text(
          "Collection Description",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
