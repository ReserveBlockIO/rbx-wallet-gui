import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/currency_segmented_button.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/btc/models/btc_address_type.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import 'package:rbx_wallet/core/components/back_to_home_button.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../encrypt/utils.dart';
import '../../wallet/components/invalid_wallet.dart';
import '../../wallet/components/wallet_selector.dart';
import '../../wallet/models/wallet.dart';
import '../../wallet/providers/wallet_list_provider.dart';

class ReceiveScreen extends BaseScreen {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Receive VFX"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      leading: BackToHomeButton(),
    );
  }

  Future<void> _handleCopyAddress(String address) async {
    await Clipboard.setData(ClipboardData(text: address));
    Toast.message("Address copied to clipboard");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);

    final currentWallet = !session.btcSelected ? session.currentWallet : null;
    final btcAccount = session.btcSelected ? session.currentBtcAccount : null;

    if (currentWallet == null && btcAccount == null) {
      return const InvalidWallet(message: "No account selected");
    }

    return Column(
      key: Key("RBX"),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CurrencySegementedButton(includeAny: false),
        ),
        Builder(
          builder: (context) {
            if (currentWallet != null) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (currentWallet.isReserved && !currentWallet.isNetworkProtected)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppBadge(
                        label: 'Not Activated',
                        variant: AppColorVariant.Danger,
                      ),
                    ),
                  AppCard(
                    padding: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.account_balance_wallet),
                          subtitle: Text(
                            "Your Selected VFX Address",
                            style: TextStyle(
                              color: AppColors.getBlue(),
                            ),
                          ),
                          // subtitle: currentWallet.friendlyName != null ? Text(currentWallet.friendlyName!) : null,
                          // title: TextFormField(
                          //   initialValue: currentWallet.address,
                          //   decoration: const InputDecoration(
                          //     label: Text("Wallet Address"),
                          //   ),
                          //   style: const TextStyle(fontSize: 13),
                          //   readOnly: true,
                          // ),
                          title: SelectableText(
                            currentWallet.address,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () async {
                              if (currentWallet.isReserved && !currentWallet.isNetworkProtected) {
                                Toast.error("This Vault Account has not been activated yet.");
                                return;
                              }
                              _handleCopyAddress(currentWallet.address);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppVerticalIconButton(
                              label: "Copy\nAddress",
                              icon: Icons.copy,
                              onPressed: () {
                                _handleCopyAddress(currentWallet.address);
                              },
                            ),
                            AppVerticalIconButton(
                              label: "New\nAccount",
                              icon: Icons.add,
                              onPressed: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;
                                await ref.read(walletListProvider.notifier).create();
                              },
                            ),
                            AppVerticalIconButton(
                              label: "Import\nKey",
                              icon: Icons.upload,
                              onPressed: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;

                                PromptModal.show(
                                  title: "Import Wallet",
                                  validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                                  labelText: "Private Key",
                                  onValidSubmission: (value) async {
                                    final resync = await ConfirmDialog.show(
                                      title: "Rescan Blocks?",
                                      body: "Would you like to rescan the chain to include any transactions relevant to this key?",
                                      confirmText: "Yes",
                                      cancelText: "No",
                                    );

                                    await ref.read(walletListProvider.notifier).import(value, false, resync == true);
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }

            if (btcAccount != null) {
              return Column(
                key: Key("BTC"),
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppCard(
                    padding: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.account_balance_wallet),
                          subtitle: Text(
                            "Your Selected BTC Address",
                            style: TextStyle(
                              color: AppColors.getBtc(),
                            ),
                          ),
                          title: SelectableText(
                            btcAccount.address,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () async {
                              _handleCopyAddress(btcAccount.address);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppVerticalIconButton(
                              label: "Copy\nAddress",
                              icon: Icons.copy,
                              onPressed: () {
                                _handleCopyAddress(btcAccount.address);
                              },
                            ),
                            AppVerticalIconButton(
                              label: "New\nAccount",
                              icon: Icons.add,
                              onPressed: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;

                                final account = await ref.read(btcAccountListProvider.notifier).create();
                                if (account == null) {
                                  Toast.error();
                                  return;
                                }

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("BTC Account Created"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child:
                                                Text("Here are your BTC account details. Please ensure to back up your private key in a safe place."),
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
                              },
                            ),
                            AppVerticalIconButton(
                              label: "Import\nKey",
                              icon: Icons.upload,
                              onPressed: () async {
                                if (!await passwordRequiredGuard(context, ref)) return;
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
                                    final btcAccountSyncInfo = ref.watch(sessionProvider).btcAccountSyncInfo;

                                    if (success) {
                                      if (btcAccountSyncInfo != null) {
                                        Toast.message(
                                            "Private Key Imported! Please wait until ${btcAccountSyncInfo.nextSyncFormatted} for the balance to sync.");
                                      } else {
                                        Toast.message("Private Key Imported!");
                                      }
                                    } else {
                                      Toast.error();
                                    }
                                  }
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }

            return const InvalidWallet(message: "No account selected");
          },
        ),
      ],
    );
  }
}
