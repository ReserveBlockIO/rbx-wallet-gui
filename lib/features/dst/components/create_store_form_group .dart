import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/collection_form_provider.dart';

import '../../../core/base_component.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';

class CreateCollectionFormGroup extends BaseComponent {
  const CreateCollectionFormGroup({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(storeFormProvider.notifier);
    final model = ref.read(storeFormProvider);
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
                children: [
                  if (model.id == 0)
                    Center(
                      child: Text(
                        "You are creating a new collection in your auction house.\nAfter creating the new collection you will be able to create listings.",
                        textAlign: TextAlign.center,
                      ),
                    ),
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
    final provider = ref.read(storeFormProvider.notifier);
    final model = ref.watch(storeFormProvider);
    return Column(
      children: [
        Row(
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
        ),
        Text(
          'When this is enabled, this collection will be visible to other users when they connect to your shop',
          style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.6)),
        )
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
    final provider = ref.read(storeFormProvider.notifier);
    return TextFormField(
      controller: provider.nameController,
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
    final provider = ref.read(storeFormProvider.notifier);
    return TextFormField(
      controller: provider.descriptionController,
      onChanged: provider.updateDescription,
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
