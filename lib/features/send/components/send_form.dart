import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/send/providers/send_form_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/utils/toast.dart';

class SendForm extends BaseComponent {
  final Wallet wallet;
  SendForm({Key? key, required this.wallet}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> _pasteAddress(SendFormProvider formProvider) async {
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null && clipboardData.text != null) {
      final normalizedText =
          clipboardData.text!.replaceAll(RegExp('[^a-zA-Z0-9]'), "");
      formProvider.addressController.text = normalizedText;
    } else {
      Toast.error("Clipboard text is invalid");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const leadingWidth = 60.0;

    final formProvider = ref.read(sendFormProvider.notifier);
    final formModel = ref.watch(sendFormProvider);

    String pasteMessage = "Use ctrl+v to paste or click ";

    if (Platform.isMacOS) {
      pasteMessage = pasteMessage.replaceAll("ctrl+v", "cmd+v");
    }

    return Form(
      key: _formKey,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: SizedBox(width: leadingWidth, child: Text("From:")),
                title: Text(wallet.address),
                subtitle: Text(wallet.friendlyName ?? ""),
                trailing: AppBadge(
                  label: "${wallet.balance} RBX",
                  variant: AppColorVariant.Light,
                ),
              ),
              ListTile(
                leading: SizedBox(width: leadingWidth, child: Text("To:")),
                title: TextFormField(
                  controller: formProvider.addressController,
                  validator: formProvider.addressValidator,
                  decoration:
                      InputDecoration(hintText: "Recipient's Wallet Address"),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
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
                          _pasteAddress(formProvider);
                        },
                        child: Text(
                          "here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      Text("."),
                    ],
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.paste),
                  onPressed: () {
                    _pasteAddress(formProvider);
                  },
                ),
              ),
              ListTile(
                leading: SizedBox(width: leadingWidth, child: Text("Amount:")),
                title: TextFormField(
                  controller: formProvider.amountController,
                  validator: formProvider.amountValidator,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration:
                      InputDecoration(hintText: "Amount of RBX to send"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                        _formKey.currentState!.reset();
                        formProvider.clear();
                      },
                    ),
                    AppButton(
                      label: "Send",
                      type: AppButtonType.Elevated,
                      processing: formModel.isProcessing,
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        formProvider.submit();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
