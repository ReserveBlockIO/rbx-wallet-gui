import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_bottom_actions.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_form_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class RoyaltyModal extends BaseComponent {
  const RoyaltyModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(royaltyFormProvider.notifier);
    final _model = ref.watch(royaltyFormProvider);

    final GlobalKey<FormState> _formKey = GlobalKey();

    return ModalContainer(
      children: [
        FormGroupHeader(
          "Royalty",
          withBg: false,
        ),
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
                      suffix: Text(
                          _model.type == RoyaltyType.percent ? "%" : "RBX"),
                      prefixIcon: HelpButton(
                          _model.type == RoyaltyType.percent
                              ? HelpType.royaltyPercent
                              : HelpType.royaltyFlat,
                          subtle: true)),
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.folderOpen,
                          size: 16,
                        ),
                        onPressed: () async {
                          final wallets = ref.read(walletListProvider);

                          final address = await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Choose an address"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(null);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.white60),
                                      ),
                                    )
                                  ],
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: wallets
                                        .map(
                                          (w) => TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(w.address);
                                            },
                                            child: Text(
                                              w.fullLabel,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                );
                              });
                          if (address != null) {
                            _provider.addressController.text = address;
                          }
                        },
                      ),
                      prefixIcon:
                          HelpButton(HelpType.royaltyAddress, subtle: true)),
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
