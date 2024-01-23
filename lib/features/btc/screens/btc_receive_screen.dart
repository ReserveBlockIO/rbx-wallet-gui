import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/components/btc_wallet_selector.dart';
import 'package:rbx_wallet/features/btc/components/invalid_btc_wallet.dart';
import 'package:rbx_wallet/features/btc/models/btc_wallet.dart';
import 'package:rbx_wallet/features/btc/providers/btc_selected_wallet_provider.dart';
import 'package:rbx_wallet/features/wallet/components/invalid_wallet.dart';
import 'package:rbx_wallet/utils/toast.dart';

class BtcReceiveScreen extends BaseScreen {
  const BtcReceiveScreen({super.key})
      : super(
          backgroundColor: const Color(0xff4d4d4d),
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Receive BTC"),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      actions: [
        BtcWalletSelector(),
      ],
    );
  }

  Future<void> _handleCopyAddress(BtcWallet wallet) async {
    await Clipboard.setData(ClipboardData(text: wallet.address));
    Toast.message("Address copied to clipboard");
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(btcSelectedWalletProvider);
    if (currentWallet == null) {
      return const InvalidBtcWallet(message: "No wallet selected");
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: glowingBoxBtc,
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: TextFormField(
                  initialValue: currentWallet.address,
                  decoration: InputDecoration(
                    label: Text(
                      "Wallet Address",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.btcOrange,
                      ),
                    ),
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
                    variant: AppColorVariant.Btc,
                    icon: Icons.copy,
                    onPressed: () {
                      _handleCopyAddress(currentWallet);
                    },
                  ),
                  AppButton(
                    label: "New Address",
                    variant: AppColorVariant.Btc,
                    icon: Icons.add,
                    onPressed: () async {},
                  ),
                  AppButton(
                    label: "Import Private Key",
                    icon: Icons.upload,
                    variant: AppColorVariant.Btc,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
