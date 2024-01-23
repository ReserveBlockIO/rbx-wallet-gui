import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/invalid_btc_wallet.dart';
import 'package:rbx_wallet/features/btc/providers/btc_selected_wallet_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_wallet_list_provider.dart';

class SendBtcForm extends BaseComponent {
  const SendBtcForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(btcSelectedWalletProvider);
    const leadingWidth = 60.0;

    // final formProvider = ref.read(sendFormProvider.notifier);

    String pasteMessage = "Use ctrl+v to paste or click ";

    if (wallet == null) {
      return const InvalidBtcWallet(message: "No wallet selected");
    }

    return Form(
      child: Container(
        decoration: BoxDecoration(boxShadow: glowingBoxBtc),
        child: Card(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 72,
                      child: Text("From:"),
                    ),
                    PopupMenuButton(
                      color: Color(0xFF080808),
                      constraints: BoxConstraints(maxWidth: 500),
                      itemBuilder: (context) {
                        final currentWallet = ref.watch(btcSelectedWalletProvider);
                        final allWallets = ref.watch(btcWalletListProvider);
                        final list = <PopupMenuEntry<int>>[];

                        for (final wallet in allWallets) {
                          final isSelected = currentWallet != null && wallet.address == currentWallet.address;

                          final color = Theme.of(context).colorScheme.btcOrange;
                          list.add(
                            PopupMenuItem(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (isSelected)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4.0),
                                      child: Icon(Icons.check),
                                    ),
                                  Text(
                                    wallet.address,
                                    style: TextStyle(color: color),
                                  ),
                                ],
                              ),
                              onTap: () {
                                ref.read(btcSelectedWalletProvider.notifier).set(wallet);
                              },
                            ),
                          );
                        }
                        return list;
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            wallet!.address,
                            style: TextStyle(color: Theme.of(context).colorScheme.btcOrange, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 24,
                            color: Theme.of(context).colorScheme.btcOrange,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ListTile(
                  leading: const SizedBox(width: leadingWidth, child: Text("To:")),
                  title: TextFormField(
                    // controller: formProvider.addressController,
                    // validator: formProvider.addressValidator,
                    decoration: const InputDecoration(hintText: "Recipient's Wallet Address"),
                    inputFormatters: [
                      // FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.]')),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(pasteMessage),
                        InkWell(
                          onTap: () {
                            // _pasteAddress(formProvider);
                          },
                          child: Text(
                            "here",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.btcOrange,
                            ),
                          ),
                        ),
                        const Text("."),
                      ],
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.paste),
                        onPressed: () {
                          // _pasteAddress(formProvider);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.folderOpen,
                          size: 18,
                        ),
                        onPressed: () {
                          // _pasteAddress(formProvider);
                          // chooseAddress(context, ref, formProvider);
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const SizedBox(width: leadingWidth, child: Text("Amount:")),
                  title: TextFormField(
                    // controller: formProvider.amountController,
                    // validator: formProvider.amountValidator,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                    decoration: const InputDecoration(hintText: "Amount of BTC to send"),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        label: "Clear",
                        type: AppButtonType.Text,
                        variant: AppColorVariant.Info,
                        onPressed: () {
                          // formProvider.formKey.currentState!.reset();
                          // formProvider.clear();
                        },
                      ),
                      Consumer(builder: (context, ref, _) {
                        // final formModel = ref.watch(sendFormProvider);

                        return AppButton(
                          label: "Send",
                          type: AppButtonType.Elevated,
                          variant: AppColorVariant.Btc,
                          // processing: formModel.isProcessing,
                          onPressed: () async {
                            // if (!formProvider.formKey.currentState!.validate()) {
                            //   return;
                            // }

                            // formProvider.submit();
                          },
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
