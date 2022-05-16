import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class BasicPropertiesFormGroup extends BaseComponent {
  const BasicPropertiesFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createSmartContractProvider.notifier);
    final _model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FormGroupHeader(
            "Basic Properties",
            helpType: HelpType.unknown,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: _model.isCompiled,
                  controller: _provider.nameController,
                  decoration: InputDecoration(
                    label: Text(
                      "Smart Contract Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    suffixIcon: HelpButton(HelpType.smartContractName),
                  ),
                  onChanged: (val) {
                    _provider.setName(val);
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: IgnorePointer(
                  ignoring: _model.isCompiled,
                  child: SmartSelect<Wallet>.single(
                    title: "Owner Address",
                    modalType: S2ModalType.bottomSheet,
                    selectedValue: _model.owner,
                    onChange: (option) {
                      _provider.setOwner(option.value!);
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
                ),
              ),
              HelpButton(HelpType.ownerAddress),
            ],
          ),
          TextFormField(
            readOnly: _model.isCompiled,
            controller: _provider.descriptionController,
            decoration: InputDecoration(
              label: Text(
                "Description",
                style: TextStyle(color: Colors.white),
              ),
              suffixIcon: HelpButton(HelpType.unknown),
            ),
            minLines: 3,
            maxLines: 6,
            onChanged: (val) {
              _provider.setDescription(val);
            },
          )
        ],
      ),
    );
  }
}