import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/btc/providers/btc_selected_wallet_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class BtcWalletSelector extends BaseComponent {
  final bool truncateAddress;
  final bool withActions;
  const BtcWalletSelector({
    super.key,
    this.truncateAddress = true,
    this.withActions = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(btcSelectedWalletProvider);

    final allWallets = ref.watch(btcWalletListProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentWallet != null)
          InkWell(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: currentWallet.address),
              );
              Toast.message("${currentWallet.address} copied to clipboard");
            },
            child: Icon(
              Icons.copy,
              size: 12,
              color: Theme.of(context).colorScheme.btcOrange,
            ),
          ),
        PopupMenuButton(
          color: Color(0xFF080808),
          constraints: const BoxConstraints(
            minWidth: 2.0 * 56.0,
            maxWidth: 8.0 * 56.0,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentWallet != null
                        ? truncateAddress
                            ? currentWallet.label
                            : currentWallet.address
                        : "Wallet",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.btcOrange,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 18,
                    color: Theme.of(context).colorScheme.btcOrange,
                  ),
                ],
              ),
            ),
          ),
          itemBuilder: (context) {
            final list = <PopupMenuEntry<int>>[];
            if (withActions) {
              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.publish, size: 16),
                      SizedBox(width: 8),
                      Text("Import BTC Wallet"),
                    ],
                  ),
                  onTap: () {},
                ),
              );

              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add, size: 16),
                      SizedBox(width: 8),
                      Text("New BTC Wallet"),
                    ],
                  ),
                  onTap: () {},
                ),
              );
              list.add(
                PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.wallet, size: 16),
                      SizedBox(width: 8),
                      Text("Manage BTC Wallets"),
                    ],
                  ),
                  onTap: () async {},
                ),
              );

              if (allWallets.isNotEmpty) {
                list.add(const PopupMenuDivider());
              }
            }

            final color = Theme.of(context).colorScheme.btcOrange;

            for (final wallet in allWallets) {
              final isSelected = currentWallet != null && wallet.address == currentWallet.address;
              list.add(
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        isSelected ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                        color: color,
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          truncateAddress ? wallet.label : wallet.address,
                          style: TextStyle(
                            color: color,
                            decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(text: wallet.address));
                          Toast.message("${wallet.address} copied to clipboard");
                        },
                        child: SizedBox(width: 40, height: 20, child: Icon(Icons.copy, size: 15)),
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
        ),
      ],
    );
  }
}
