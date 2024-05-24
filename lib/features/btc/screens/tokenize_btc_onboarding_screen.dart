import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/utils.dart';
import 'package:rbx_wallet/features/btc/models/btc_address_type.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import 'package:rbx_wallet/features/home/screens/home_screen.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:collection/collection.dart';

import '../providers/tokenized_btc_onboard_provider.dart';

enum TokenizeBtcOnboardPop {
  cancelled,
}

class TokenizeBtcOnboardingScreen extends BaseScreen {
  const TokenizeBtcOnboardingScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("vBTC Onboard"),
      leadingWidth: 100,
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before,
          size: 32,
        ),
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
            title: "Exit vBTC Onboarding?",
            body: "Are you sure you want to cancel setting up your wallet with Tokenized Bitcoin?",
            confirmText: "Yes",
            cancelText: "No",
            destructive: true,
          );
          if (confirmed == true) {
            Navigator.of(context).pop(TokenizeBtcOnboardPop.cancelled);
          }
        },
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vBtcOnboardProvider.notifier);
    final state = ref.watch(vBtcOnboardProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Step ${state.stepNumber}/6: ",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  state.stepTitle,
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.btcOrange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.stepDetails,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Builder(builder: (context) {
              switch (state.step) {
                case VBtcOnboardStep.createVfxWallet:
                  final existingWallets = ref.watch(walletListProvider).where((w) => !w.isReserved).toList();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        spacing: 16,
                        children: [
                          AppButton(
                            label: "Import Existing",
                            icon: Icons.upload,
                            onPressed: () async {
                              final pkey = await PromptModal.show(
                                title: "Import Wallet",
                                validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                                labelText: "Private Key",
                                onValidSubmission: (value) async {},
                              );

                              if (pkey != null) {
                                final w = await ref.read(walletListProvider.notifier).import(pkey, false);
                                if (w != null) {
                                  if (w.balance >= VBTC_ONBOARD_VFX_AMOUNT) {
                                    await InfoDialog.show(
                                      title: "Balance Found!",
                                      body: "A balance of ${w.balance} VFX was found in this wallet. Skipping to step 3.",
                                    );
                                  }
                                  provider.setVfxWallet(w);
                                  Toast.message("VFX Wallet Imported Successfully");
                                }
                              }
                            },
                            variant: AppColorVariant.Secondary,
                          ),
                          AppButton(
                            label: "Create New",
                            icon: Icons.add,
                            onPressed: () async {
                              final w = await ref.read(walletListProvider.notifier).create();
                              if (w != null) {
                                provider.setVfxWallet(w);
                                Toast.message("VFX Wallet Created Successfully");
                              }
                            },
                            variant: AppColorVariant.Secondary,
                          )
                        ],
                      ),
                      if (existingWallets.isNotEmpty) ...[
                        SizedBox(
                          height: 16,
                        ),
                        Text("Or use one of your existing VFX Wallets:"),
                        ...existingWallets
                            .map((w) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: InkWell(
                                      onTap: () {
                                        provider.setVfxWallet(w);
                                      },
                                      child: Text(
                                        w.address,
                                        style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline),
                                      )),
                                ))
                            .toList(),
                      ]
                    ],
                  );

                case VBtcOnboardStep.faucetWithdrawl:
                  if (state.vfxWallet == null) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("No VFX Wallet Found."),
                        AppButton(
                          label: "Start Over",
                          onPressed: () {
                            provider.reset();
                          },
                        )
                      ],
                    );
                  }
                  return Wrap(
                    spacing: 16,
                    children: [
                      AppButton(
                        label: "Use Faucet",
                        onPressed: () async {
                          final phone = await PromptModal.show(
                            title: "Phone Number",
                            validator: formValidatorPhoneNumber,
                            labelText: "Your Phone Number",
                          );

                          if (phone != null) {
                            final cleanPhone = cleanPhoneNumber(phone);
                            if (cleanPhone == null) {
                              Toast.error("Invalid Phone Number");
                              return;
                            }

                            try {
                              final uuid = await ExplorerService().faucetRequest(cleanPhone, VBTC_ONBOARD_VFX_AMOUNT, state.vfxWallet!.address);

                              final code = await PromptModal.show(
                                title: "Enter verification code sent to $phone",
                                validator: (v) => formValidatorNumber(v, "Verification Code"),
                                labelText: "Verification Code",
                              );

                              if (code != null) {
                                final result = await ExplorerService().faucetVerify(uuid, code.trim());

                                Toast.message("Success! Funds are on their way. TX Hash: $result");
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                      ),
                      GetVfxButton(
                        address: state.vfxWallet!.address,
                        vfxOnly: true,
                      ),
                    ],
                  );

                case VBtcOnboardStep.createOrImportBtcAccount:
                  final existingAccounts = ref.watch(btcAccountListProvider);

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        spacing: 16,
                        children: [
                          AppButton(
                            label: "Import Existing",
                            icon: Icons.upload,
                            variant: AppColorVariant.Btc,
                            onPressed: () async {
                              final privateKeyController = TextEditingController();
                              final List<String>? data = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Import BTC Private Key"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Paste in your BTC private key to import your account."),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.security),
                                          title: TextFormField(
                                            controller: privateKeyController,
                                            decoration: InputDecoration(
                                                label: Text(
                                              "Private Key",
                                              style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                                            )),
                                            style: const TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop([privateKeyController.text, "test"]);
                                        },
                                        child: Text(
                                          "Import",
                                          style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );

                              if (data != null) {
                                if (data.length == 2) {
                                  final privateKey = data.first;
                                  const addressType = BtcAddressType.segwit;
                                  final success = await ref.read(btcAccountListProvider.notifier).importPrivateKey(privateKey, addressType);
                                  final btcAccountSyncInfo = ref.read(sessionProvider).btcAccountSyncInfo;

                                  if (success) {
                                    if (btcAccountSyncInfo != null) {
                                      Toast.message(
                                          "Private Key Imported! Please wait until ${btcAccountSyncInfo.nextSyncFormatted} for the balance to sync.");
                                    } else {
                                      Toast.message("Private Key Imported!");
                                    }
                                    final account = ref.read(btcAccountListProvider).firstWhereOrNull((a) => a.privateKey == privateKey);
                                    if (account != null) {
                                      provider.setBtcAccount(account);
                                    }
                                  } else {
                                    Toast.error();
                                  }
                                }
                              }
                            },
                          ),
                          AppButton(
                            label: "Create New",
                            icon: Icons.add,
                            onPressed: () async {
                              final account = await ref.read(btcAccountListProvider.notifier).create();
                              if (account == null) {
                                Toast.error();
                                return;
                              }

                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("BTC Wallet Created"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Here are your BTC wallet details. Please ensure to back up your private key in a safe place."),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.account_balance_wallet),
                                          title: TextFormField(
                                            initialValue: account.address,
                                            decoration: InputDecoration(
                                                label: Text(
                                              "Address",
                                              style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                                            )),
                                            readOnly: true,
                                            style: const TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.security),
                                          title: TextFormField(
                                            initialValue: account.privateKey,
                                            decoration: InputDecoration(
                                              label: Text("Private Key", style: TextStyle(color: Theme.of(context).colorScheme.btcOrange)),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                            readOnly: true,
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.copy,
                                              color: Theme.of(context).colorScheme.btcOrange,
                                            ),
                                            onPressed: () async {
                                              await Clipboard.setData(ClipboardData(text: account.privateKey));
                                              Toast.message("Private Key copied to clipboard");
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Done",
                                            style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                                          ))
                                    ],
                                  );
                                },
                              );

                              provider.setBtcAccount(account);
                            },
                            variant: AppColorVariant.Btc,
                          )
                        ],
                      ),
                      if (existingAccounts.isNotEmpty) ...[
                        SizedBox(
                          height: 16,
                        ),
                        Text("Or use one of your existing VFX Wallets:"),
                        ...existingAccounts
                            .map((a) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: InkWell(
                                      onTap: () {
                                        provider.setBtcAccount(a);
                                      },
                                      child: Text(
                                        a.address,
                                        style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline),
                                      )),
                                ))
                            .toList(),
                      ]
                    ],
                  );

                case VBtcOnboardStep.transferBtc:
                  return SizedBox();

                case VBtcOnboardStep.tokenize:
                  return SizedBox();

                case VBtcOnboardStep.transferBtcToVbtc:
                  return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
