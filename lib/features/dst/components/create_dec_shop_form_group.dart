import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/base_component.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../providers/dec_shop_form_provider.dart';

class CreateDecShopFormGroup extends BaseComponent {
  const CreateDecShopFormGroup({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(decShopFormProvider.notifier);
    final model = ref.watch(decShopFormProvider);
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
                  Flexible(
                    child: _DecShopName(),
                  ),
                  Flexible(
                    child: _DecShopDescription(),
                  ),
                  Flexible(
                    child: _DecUrl(),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Flexible(
                      child: Row(
                    children: [
                      Text('Select Address:'),
                      Expanded(
                        child: Text(model.address),
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.folderOpen,
                          size: 18,
                        ),
                        onPressed: () {
                          chooseAddress(context, ref, provider);
                        },
                      ),
                    ],
                  )),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Future<void> chooseAddress(BuildContext context, WidgetRef ref, DecShopFormProvider formProvider) async {
    final wallets = ref.read(walletListProvider);

    final address = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Choose an address"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white60),
                ),
              )
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: wallets
                  .map(
                    (w) => TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(w.address);
                      },
                      child: Text(
                        w.fullLabel,
                        style: const TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        });
    formProvider.updateAddress(address);
  }
}

class _DecShopName extends BaseComponent {
  const _DecShopName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(decShopFormProvider.notifier);
    return TextFormField(
      controller: provider.nameController,
      onChanged: provider.updateName,
      validator: (value) => formValidatorNotEmpty(value, "Dec Shop Name"),
      decoration: InputDecoration(
        label: const Text(
          "Dec Shop Name",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _DecUrl extends BaseComponent {
  const _DecUrl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(decShopFormProvider.notifier);
    return TextFormField(
      maxLength: 62,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: provider.urlController,
      onChanged: provider.updateUrl,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("^[A-Za-z][a-zA-Z0-9-.]{0,62}")),
      ],
      validator: (value) => formValidatorNotEmpty(value, "Dec Shop Url"),
      decoration: InputDecoration(
        label: const Text(
          "Dec Shop Url",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _DecShopDescription extends BaseComponent {
  const _DecShopDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(decShopFormProvider.notifier);
    return TextFormField(
      controller: provider.descriptionController,
      onChanged: provider.updateDescription,
      validator: (value) => formValidatorNotEmpty(value, "DecShop Description"),
      maxLines: 3,
      decoration: InputDecoration(
        label: const Text(
          "DecShop Description",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
