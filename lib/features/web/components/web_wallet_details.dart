import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/web_session_model.dart';
import '../../keygen/models/keypair.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';

import '../../../core/base_component.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../utils/toast.dart';
import '../../auth/auth_utils.dart';

class WebWalletDetails extends BaseComponent {
  const WebWalletDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);
    final wallet = session.currentWallet;
    final usingRa = session.usingRa;
    final selectedWalletType = session.selectedWalletType;
    // final keypair = sessionModel.keypair;
    // final wallet = sessionModel.currentWallet;

    if (wallet == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF050505),
        boxShadow: glowingBox,
      ),
      child: ListTile(
        title: SelectableText(
          wallet.adnr != null && wallet.adnr!.isNotEmpty ? "${wallet.adnr} [${wallet.address}]" : wallet.address,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13, color: usingRa ? Colors.deepPurple.shade200 : Colors.white),
        ),
        subtitle: Builder(builder: (context) {
          if (selectedWalletType == WalletType.btc) {
            if (session.btcBalanceInfo == null) {
              return SizedBox();
            }

            final btcInfo = session.btcBalanceInfo!;

            return Row(
              children: [
                Text(
                  "${btcInfo.btcBalance} BTC",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(width: 2),
                Tooltip(
                  message: ["Balance: ${btcInfo.btcBalance} BTC", "Sent: ${btcInfo.btcTotalSent} BTC", "Recieved: ${btcInfo.btcTotalRecieved} BTC"]
                      .join('\n'),
                  child: Icon(Icons.help, color: Theme.of(context).colorScheme.secondary.withOpacity(0.7), size: 14),
                ),
                SizedBox(width: 2),
                InkWell(
                    onTap: () {
                      ref.read(webSessionProvider.notifier).refreshBtcBalanceInfo();
                    },
                    child: Icon(Icons.refresh, size: 14)),
              ],
            );
          }

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${wallet.balance} VFX",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(width: 2),
              Tooltip(
                message: "Available: ${wallet.balance} VFX\nLocked: ${wallet.lockedBalance} VFX \nTotal: ${wallet.totalBalance} RBX",
                child: Icon(Icons.help, color: Theme.of(context).colorScheme.secondary.withOpacity(0.7), size: 14),
              ),
            ],
          );
        }),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: wallet.address));
                  Toast.message("Address ${wallet.address} copied to clipboard");
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.copy,
                    size: 20,
                  ),
                )),
            InkWell(
                onTap: () async {
                  final confirmed = await ConfirmDialog.show(
                    title: "Reveal Private Key?",
                    body: "Are you sure you want to reveal your private key?",
                    confirmText: "Reveal",
                    cancelText: "Cancel",
                  );
                  if (confirmed == true) {
                    switch (session.selectedWalletType) {
                      case WalletType.rbx:
                        showKeys(context, ref.read(webSessionProvider).keypair!, true);

                        break;
                      case WalletType.ra:
                        showKeys(context, ref.read(webSessionProvider).keypair!, true);
                        break;
                      case WalletType.btc:
                        final account = ref.read(webSessionProvider).btcKeypair;
                        if (account == null) return;

                        final keypair = Keypair(
                          private: account.privateKey,
                          address: account.address,
                          public: account.publicKey,
                          mneumonic: account.mnemonic,
                          btcWif: account.wif,
                        );
                        showKeys(context, keypair, true);
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
