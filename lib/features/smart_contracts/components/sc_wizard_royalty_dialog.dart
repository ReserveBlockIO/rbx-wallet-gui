import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/validation.dart';

class ScWizardRoyaltyDialog extends BaseComponent {
  ScWizardRoyaltyDialog({
    Key? key,
  }) : super(key: key);

  final addressController = TextEditingController();
  final amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<String?> chooseAddress(BuildContext context, WidgetRef ref) async {
    final wallets = ref.read(walletListProvider);

    return await showDialog(
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
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RoyaltyType type = RoyaltyType.percent;

    return StatefulBuilder(builder: (context, setState) {
      return Form(
        key: formKey,
        child: AlertDialog(
          title: const Text("Add Royalty"),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    AppDropdown<RoyaltyType>(
                      label: "Royalty Type",
                      selectedValue: type,
                      selectedLabel: type == RoyaltyType.percent ? "Percent" : "Fixed",
                      onChange: (val) {
                        setState(() {
                          type = val;
                        });
                        print(type);
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
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: amountController,
                          decoration: InputDecoration(
                              label: const Text("Amount"),
                              labelStyle: const TextStyle(color: Colors.white),
                              suffix: Text(type == RoyaltyType.percent ? "%" : "RBX"),
                              prefixIcon: HelpButton(type == RoyaltyType.percent ? HelpType.royaltyPercent : HelpType.royaltyFlat, subtle: true)),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                          validator: (String? val) {
                            if (type == RoyaltyType.percent) {
                              return formPercentValidator(val);
                            }
                            return formValidatorNotEmpty(val, "Amount");
                          }),
                    ),
                  ],
                ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    label: const Text("Address"),
                    labelStyle: const TextStyle(color: Colors.white),
                    suffixIcon: kIsWeb
                        ? IconButton(
                            onPressed: () {
                              final address = ref.read(webSessionProvider).keypair?.public;

                              if (address != null) {
                                addressController.text = address;
                              }
                            },
                            icon: const Icon(Icons.import_export))
                        : IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.folderOpen,
                              size: 16,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              final address = await chooseAddress(context, ref);
                              print(address);
                              if (address != null) {
                                addressController.text = address;
                              }
                            },
                          ),
                    prefixIcon: const HelpButton(
                      HelpType.royaltyAddress,
                      subtle: true,
                      mini: true,
                    ),
                  ),
                  validator: (value) => formValidatorRbxAddress(value),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white60),
              ),
            ),
            TextButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                double amount = double.parse(amountController.text);
                if (type == RoyaltyType.percent) {
                  amount = amount / 100;
                }

                final r = Royalty(
                  type: type,
                  amount: amount,
                  address: addressController.text,
                );

                Navigator.of(context).pop(r);
              },
              child: const Text(
                "Add Royalty",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    });
  }
}
