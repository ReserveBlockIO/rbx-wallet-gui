import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/reserve/providers/reserve_account_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

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
import '../../reserve/components/balance_indicator.dart';
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

  Future<void> chooseAddress(BuildContext context, WidgetRef ref, SendFormProvider formProvider) async {
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
    if (address != null) {
      formProvider.addressController.text = address;
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

    final color = wallet!.isReserved ? Colors.deepPurple.shade200 : Colors.white;

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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 72,
                      child: Text("From:"),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isWeb)
                            Text(
                              "${isMobile ? "From: " : ""}${keypair!.public}",
                              style: TextStyle(color: color, fontSize: 16),
                            ),
                          if (!isWeb)
                            PopupMenuButton(
                              constraints: BoxConstraints(maxWidth: 500),
                              itemBuilder: (context) {
                                final currentWallet = ref.watch(sessionProvider).currentWallet;
                                final allWallets = ref.watch(walletListProvider);
                                final list = <PopupMenuEntry<int>>[];

                                for (final wallet in allWallets) {
                                  final isSelected = currentWallet != null && wallet.address == currentWallet.address;

                                  final color = wallet.isReserved ? Colors.deepPurple.shade200 : Theme.of(context).textTheme.bodyText1!.color!;

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
                                            wallet.labelWithoutTruncation,
                                            style: TextStyle(color: color),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
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
                                    style: TextStyle(color: color, fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 24,
                                    color: wallet!.isReserved ? Colors.deepPurple.shade200 : Theme.of(context).textTheme.bodyText1!.color!,
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    !wallet!.isReserved
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (wallet!.lockedBalance == 0.0)
                                AppBadge(
                                  label: "$balance RBX",
                                  variant: AppColorVariant.Light,
                                ),
                              if (wallet!.lockedBalance > 0) ...[
                                BalanceIndicator(
                                  label: "Available",
                                  value: wallet!.balance,
                                  bgColor: Colors.deepPurple.shade400,
                                  fgColor: Colors.white,
                                ),
                                BalanceIndicator(
                                  label: "Locked",
                                  value: wallet!.lockedBalance,
                                  bgColor: Colors.red.shade700,
                                  fgColor: Colors.white,
                                ),
                                BalanceIndicator(
                                  label: "Total",
                                  value: wallet!.balance + wallet!.lockedBalance,
                                  bgColor: Colors.green.shade700,
                                  fgColor: Colors.white,
                                ),
                              ]
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BalanceIndicator(
                                label: "Available",
                                value: wallet!.availableBalance,
                                bgColor: Colors.deepPurple.shade400,
                                fgColor: Colors.white,
                              ),
                              BalanceIndicator(
                                label: "Locked",
                                value: wallet!.lockedBalance,
                                bgColor: Colors.red.shade700,
                                fgColor: Colors.white,
                              ),
                              BalanceIndicator(
                                label: "Total",
                                value: wallet!.totalBalance,
                                bgColor: Colors.green.shade700,
                                fgColor: Colors.white,
                              ),
                            ],
                          ),
                  ],
                ),
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
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.paste),
                            onPressed: () {
                              _pasteAddress(formProvider);
                            },
                          ),
                          if (!kIsWeb)
                            IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.folderOpen,
                                size: 18,
                              ),
                              onPressed: () {
                                // _pasteAddress(formProvider);
                                chooseAddress(context, ref, formProvider);
                              },
                            ),
                        ],
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
