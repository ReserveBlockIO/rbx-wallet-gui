import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/validation.dart';

class BasicPropertiesFormGroup extends BaseComponent {
  const BasicPropertiesFormGroup({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createSmartContractProvider.notifier);
    final model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader("Baseline Properties", helpType: HelpType.baselineProperties),
          _SmartContractName(model: model, provider: provider),
          _CreatorName(model: model, provider: provider),
          _Description(model: model, provider: provider)
        ],
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createSmartContractProvider.notifier);
    final model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Baseline Properties",
            helpType: HelpType.baselineProperties,
          ),
          Row(
            children: [
              Expanded(
                child: _SmartContractName(model: model, provider: provider),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _CreatorName(model: model, provider: provider),
              ),
              if (!kIsWeb) const SizedBox(width: 8),
              if (!kIsWeb)
                Expanded(
                  child: _OwnerAddress(model: model, provider: provider),
                ),
              const HelpButton(HelpType.ownerAddress),
            ],
          ),
          _Description(model: model, provider: provider)
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.model,
    required this.provider,
  }) : super(key: key);

  final SmartContract model;
  final CreateSmartContractProvider provider;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: model.isCompiled,
      controller: provider.descriptionController,
      decoration: const InputDecoration(
        label: Text(
          "Description",
          style: TextStyle(color: Colors.white),
        ),
        suffixIcon: HelpButton(HelpType.description),
      ),
      minLines: 3,
      maxLines: 6,
      onChanged: (val) {
        provider.setDescription(val);
      },
    );
  }
}

class _OwnerAddress extends BaseComponent {
  const _OwnerAddress({
    Key? key,
    required this.model,
    required this.provider,
  }) : super(key: key);

  final SmartContract model;
  final CreateSmartContractProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IgnorePointer(
      ignoring: model.isCompiled,
      child: SmartSelect<Wallet>.single(
        title: "Owner Address",
        modalType: S2ModalType.bottomSheet,
        selectedValue: model.owner,
        onChange: (option) {
          provider.setOwner(option.value);
        },
        choiceItems: ref
            .read(walletListProvider)
            .map(
              (w) => S2Choice<Wallet>(
                value: w,
                title: w.fullLabel,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _CreatorName extends StatelessWidget {
  const _CreatorName({
    Key? key,
    required this.model,
    required this.provider,
  }) : super(key: key);

  final SmartContract model;
  final CreateSmartContractProvider provider;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: model.isCompiled,
      controller: provider.minterNameController,
      validator: (val) => formValidatorNotEmpty(val, "Minter/Creator Name"),
      decoration: const InputDecoration(
        label: Text(
          "Minter/Creator Name",
          style: TextStyle(color: Colors.white),
        ),
        suffixIcon: HelpButton(HelpType.minterName),
      ),
      onChanged: (val) {
        provider.setName(val);
      },
    );
  }
}

class _SmartContractName extends StatelessWidget {
  const _SmartContractName({
    Key? key,
    required this.model,
    required this.provider,
  }) : super(key: key);

  final SmartContract model;
  final CreateSmartContractProvider provider;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: model.isCompiled,
      controller: provider.nameController,
      decoration: const InputDecoration(
        label: Text(
          "Smart Contract Name",
          style: TextStyle(color: Colors.white),
        ),
        suffixIcon: HelpButton(HelpType.smartContractName),
      ),
      onChanged: (val) {
        provider.setName(val);
      },
    );
  }
}
