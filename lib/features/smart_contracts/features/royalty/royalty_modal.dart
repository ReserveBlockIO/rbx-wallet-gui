import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_bottom_actions.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_form_provider.dart';

class RoyaltyModal extends BaseComponent {
  const RoyaltyModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(royaltyFormProvider.notifier);
    final _model = ref.watch(royaltyFormProvider);

    final GlobalKey<FormState> _formKey = GlobalKey();

    return ModalContainer(
      children: [
        FormGroupHeader("Royalty"),
        Form(
          key: _formKey,
          child: Row(
            children: [
              AppDropdown<RoyaltyType>(
                label: "Royalty Type",
                selectedValue: _model.type,
                selectedLabel: _model.typeLabel,
                onChange: (val) {
                  _provider.updateType(val);
                },
                options: Royalty.allTypes()
                    .map(
                      (type) => AppDropdownOption<RoyaltyType>(
                        value: type,
                        label: Royalty.typeToString(type),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(width: 32),
              Expanded(
                child: TextFormField(
                  controller: _provider.amountController,
                  decoration: InputDecoration(
                      label: Text("Amount"),
                      labelStyle: TextStyle(color: Colors.white),
                      suffixText:
                          _model.type == RoyaltyType.percent ? "%" : "RBX"),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                  ],
                  validator: _provider.amountValidator,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _provider.addressController,
                  decoration: InputDecoration(
                    label: Text("Address"),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: _provider.addressValidator,
                ),
              ),
            ],
          ),
        ),
        ModalBottomActions(
          onConfirm: () {
            if (!_formKey.currentState!.validate()) return;

            _provider.complete();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
