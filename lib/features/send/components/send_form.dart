import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../encrypt/utils.dart';
import '../../keygen/models/keypair.dart';
import '../../wallet/models/wallet.dart';
import '../providers/send_form_provider.dart';

class SendForm extends BaseComponent {
  final Wallet? wallet;
  final Keypair? keypair;
  SendForm({Key? key, this.wallet, this.keypair}) : super(key: key) {
    // assert(wallet != null && keypair != null);
  }

  Future<void> _pasteAddress(SendFormProvider formProvider) async {
    ClipboardData? clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null && clipboardData.text != null) {
      final normalizedText = clipboardData.text!.replaceAll(RegExp('[^a-zA-Z0-9]'), "");
      formProvider.addressController.text = normalizedText;
    } else {
      Toast.error("Clipboard text is invalid");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isWeb = keypair != null;

    const leadingWidth = 60.0;

    final formProvider = ref.read(sendFormProvider.notifier);

    String pasteMessage = "Use ctrl+v to paste or click ";

    if (!kIsWeb && Platform.isMacOS) {
      pasteMessage = pasteMessage.replaceAll("ctrl+v", "cmd+v");
    }

    final balance = isWeb ? ref.read(webSessionProvider).balance : wallet!.balance;
    final isMobile = BreakPoints.useMobileLayout(context);

    return Form(
      key: formProvider.formKey,
      child: Card(
        color: kIsWeb ? Theme.of(context).colorScheme.primary.withOpacity(0.5) : null,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: isMobile,
                visualDensity: isMobile ? VisualDensity.compact : VisualDensity.comfortable,
                leading: isMobile ? null : const SizedBox(width: leadingWidth, child: Text("From:")),
                title: Text(isWeb ? "${isMobile ? "From: " : ""}${keypair!.public}" : wallet!.address),
                subtitle: isWeb ? Text("Balance: $balance RBX") : Text(wallet!.friendlyName ?? ""),
                trailing: !isWeb
                    ? AppBadge(
                        label: "$balance RBX",
                        variant: AppColorVariant.Light,
                      )
                    : null,
              ),
              ListTile(
                leading: isMobile ? null : const SizedBox(width: leadingWidth, child: Text("To:")),
                title: TextFormField(
                  controller: formProvider.addressController,
                  validator: formProvider.addressValidator,
                  decoration: const InputDecoration(hintText: "Recipient's Wallet Address"),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.]')),
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
                      const Text("."),
                    ],
                  ),
                ),
                trailing: isMobile
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.paste),
                        onPressed: () {
                          _pasteAddress(formProvider);
                        },
                      ),
              ),
              ListTile(
                leading: isMobile ? null : const SizedBox(width: leadingWidth, child: Text("Amount:")),
                title: TextFormField(
                  controller: formProvider.amountController,
                  validator: formProvider.amountValidator,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                  decoration: const InputDecoration(hintText: "Amount of RBX to send"),
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
                        formProvider.formKey.currentState!.reset();
                        formProvider.clear();
                      },
                    ),
                    Consumer(builder: (context, ref, _) {
                      final formModel = ref.watch(sendFormProvider);

                      return AppButton(
                        label: "Send",
                        type: AppButtonType.Elevated,
                        processing: formModel.isProcessing,
                        onPressed: () async {
                          if (!await passwordRequiredGuard(context, ref)) return;

                          if (!formProvider.formKey.currentState!.validate()) {
                            return;
                          }
                          formProvider.submit();
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
    );
  }
}
