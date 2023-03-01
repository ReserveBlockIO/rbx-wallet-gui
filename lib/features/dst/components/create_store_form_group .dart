import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/providers/store_form_provider.dart';

import '../../../core/base_component.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_header.dart';

class CreateStoreFormGroup extends BaseComponent {
  const CreateStoreFormGroup({Key? key}) : super(key: key);

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final provider = ref.read(storeFormProvider.notifier);
    final model = ref.read(storeFormProvider);
    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FormGroupHeader(
            model.id != 0 ? "Edit Store" : "Create Store",
          ),
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
                    child: _StoreName(),
                  ),
                  Flexible(
                    child: _StoreDescription(),
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
          child: const Text("Will the Store be Live?"),
        ),
      ],
    );
  }
}

class _StoreName extends BaseComponent {
  const _StoreName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(storeFormProvider.notifier);
    return TextFormField(
      controller: provider.nameController,
      onChanged: provider.updateName,
      validator: (value) => formValidatorNotEmpty(value, "Store Name"),
      decoration: InputDecoration(
        label: const Text(
          "Store Name",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _StoreDescription extends BaseComponent {
  const _StoreDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(storeFormProvider.notifier);
    return TextFormField(
      controller: provider.descriptionController,
      onChanged: provider.updateDescription,
      validator: (value) => formValidatorNotEmpty(value, "Store Description"),
      maxLines: 3,
      decoration: InputDecoration(
        label: const Text(
          "Store Description",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
