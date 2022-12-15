import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/encrypt/utils.dart';
import 'package:rbx_wallet/features/wallet/components/invalid_wallet.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class ReceiveScreen extends BaseScreen {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Receive RBX"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  Future<void> _handleCopyAddress(Wallet wallet) async {
    await Clipboard.setData(ClipboardData(text: wallet.address));
    Toast.message("Address copied to clipboard");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;
    if (currentWallet == null) {
      return const InvalidWallet(message: "No wallet selected");
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.account_balance_wallet),
          subtitle: Text(currentWallet.friendlyName ?? ""),
          title: TextFormField(
            initialValue: currentWallet.address,
            decoration: const InputDecoration(
              label: Text("Wallet Address"),
            ),
            style: const TextStyle(fontSize: 13),
            readOnly: true,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () async {
              _handleCopyAddress(currentWallet);
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Divider(),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppButton(
              label: "Copy Address",
              icon: Icons.copy,
              onPressed: () {
                _handleCopyAddress(currentWallet);
              },
            ),
            AppButton(
              label: "New Address",
              icon: Icons.add,
              onPressed: () async {
                if (!await passwordRequiredGuard(context, ref)) return;
                await ref.read(walletListProvider.notifier).create();
              },
            ),
            AppButton(
              label: "Import Private Key",
              icon: Icons.upload,
              onPressed: () async {
                if (!await passwordRequiredGuard(context, ref)) return;

                PromptModal.show(
                  title: "Import Wallet",
                  validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                  labelText: "Private Key",
                  onValidSubmission: (value) async {
                    await ref.read(walletListProvider.notifier).import(value);
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
