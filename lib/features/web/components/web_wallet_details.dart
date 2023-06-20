import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final wallet = ref.watch(webSessionProvider).currentWallet;
    final usingRa = ref.watch(webSessionProvider).usingRa;
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
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${wallet.balance} RBX",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(width: 2),
            Tooltip(
              message: "Available: ${wallet.balance} RBX\nLocked: ${wallet.lockedBalance} RBX \nTotal: ${wallet.totalBalance} RBX",
              child: Icon(Icons.help, color: Theme.of(context).colorScheme.secondary.withOpacity(0.7), size: 14),
            ),
          ],
        ),
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
                    if (usingRa) {
                      showRaKeys(context, ref.read(webSessionProvider).raKeypair!);
                    } else {
                      showKeys(context, ref.read(webSessionProvider).keypair!, true);
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
