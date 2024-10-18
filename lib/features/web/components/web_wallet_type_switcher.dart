import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app.dart';
import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../../../core/dialogs.dart';
import '../../../core/models/web_session_model.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/web_router.gr.dart';
import '../../auth/auth_utils.dart';
import '../../btc_web/services/btc_web_service.dart';
import '../../keygen/models/keypair.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

import '../../btc_web/components/web_btc_create_wallet_modal.dart';

class WebWalletTypeSwitcher extends BaseComponent {
  const WebWalletTypeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);
    final primaryAddress = session.keypair?.address;
    final raAddress = session.raKeypair?.address;
    final btcAddress = session.btcKeypair?.address;

    final selectedWalletType = session.selectedWalletType;

    if (primaryAddress == null || raAddress == null) {
      return SizedBox();
    }
    // final color = usingRa ? Colors.deepPurple.shade200 : Colors.white;

    late final Color color;
    switch (selectedWalletType) {
      case WalletType.rbx:
        color = Colors.white;
        break;
      case WalletType.ra:
        color = Colors.deepPurple.shade200;
        break;
      case WalletType.btc:
        color = Color(0xfff7931a);
        break;
    }

    late final String selectedAddress;
    switch (selectedWalletType) {
      case WalletType.rbx:
        selectedAddress = primaryAddress;
        break;
      case WalletType.ra:
        selectedAddress = raAddress;
        break;
      case WalletType.btc:
        selectedAddress = btcAddress ?? "";
        break;
    }

    final fontSize = BreakPoints.useMobileLayout(context) ? 12.0 : 14.0;

    final start = selectedAddress.substring(0, 5);
    final end = selectedAddress.substring(selectedAddress.length - 5, selectedAddress.length);
    final truncatedAddress = "$start...$end";

    final selectedAddressLabel = BreakPoints.useMobileLayout(context) ? truncatedAddress : selectedAddress;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () async {
            await Clipboard.setData(
              ClipboardData(text: selectedAddress),
            );
            Toast.message("$selectedAddress copied to clipboard");
          },
          child: Icon(
            Icons.copy,
            size: 12,
            color: color,
          ),
        ),
        SizedBox(width: 4),
        PopupMenuButton(
          constraints: const BoxConstraints(
            minWidth: 2.0 * 56.0,
            maxWidth: 8.0 * 56.0,
          ),
          color: Color(0xFF080808),
          child: Row(
            children: [
              Text(
                selectedAddressLabel,
                style: TextStyle(color: color, fontSize: fontSize),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 18,
                color: color,
              ),
            ],
          ),
          itemBuilder: (context) {
            final list = <PopupMenuEntry<int>>[];

            list.add(PopupMenuItem(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    selectedWalletType == WalletType.rbx ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                  ),
                  SizedBox(width: 6),
                  Text(
                    primaryAddress,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
              onTap: () {
                ref.read(webSessionProvider.notifier).setSelectedWalletType(WalletType.rbx);
              },
            ));

            list.add(PopupMenuItem(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    selectedWalletType == WalletType.ra ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                    color: Colors.deepPurple.shade200,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      raAddress,
                      style: TextStyle(color: Colors.deepPurple.shade200, fontSize: fontSize),
                    ),
                  ),
                ],
              ),
              onTap: () {
                ref.read(webSessionProvider.notifier).setSelectedWalletType(WalletType.ra);
              },
            ));

            if (session.btcKeypair != null && btcAddress != null) {
              list.add(PopupMenuItem(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      selectedWalletType == WalletType.btc ? Icons.check_box_rounded : Icons.check_box_outline_blank_outlined,
                      color: Color(0xfff7931a),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        btcAddress,
                        style: TextStyle(color: Color(0xfff7931a), fontSize: fontSize),
                      ),
                    ),
                    SizedBox(width: 6),
                  ],
                ),
                onTap: () {
                  ref.read(webSessionProvider.notifier).setSelectedWalletType(WalletType.btc);
                },
              ));
            } else {
              list.add(PopupMenuItem(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(0xfff7931a),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "Add BTC Account",
                        style: TextStyle(color: Color(0xfff7931a), fontSize: fontSize),
                      ),
                    ),
                    SizedBox(width: 6),
                  ],
                ),
                onTap: () async {
                  final NewBtcWalletOption? option = await showModalBottomSheet(
                    context: rootNavigatorKey.currentContext!,
                    builder: (context) {
                      return WebCreateBtcWalletModal();
                    },
                  );

                  if (option == null) {
                    return;
                  }

                  if (option == NewBtcWalletOption.generate) {
                    final account = await BtcWebService().keypairFromRandomMnemonic();

                    if (account == null) {
                      Toast.error();
                      return;
                    }

                    ref.read(webSessionProvider.notifier).updateBtcKeypair(account, true);

                    final keypair = Keypair(
                      private: account.privateKey,
                      address: account.address,
                      public: account.publicKey,
                      mneumonic: account.mnemonic,
                      btcWif: account.wif,
                    );
                    showKeys(context, keypair);
                    return;
                  }

                  if (option == NewBtcWalletOption.import) {
                    final wif = await PromptModal.show(
                        title: "Import BTC WIF Private Key",
                        labelText: "WIF Private Key",
                        confirmText: "Import",
                        cancelText: "Cancel",
                        labelColor: Theme.of(context).colorScheme.btcOrange,
                        validator: (val) => formValidatorNotEmpty(val, "WIF Private Key"));

                    if (wif == null) {
                      return;
                    }

                    final account = await BtcWebService().keypairFromWif(wif);

                    if (account == null) {
                      Toast.error();
                      return;
                    }

                    ref.read(webSessionProvider.notifier).updateBtcKeypair(account, true);

                    Toast.message("BTC Account Imported");
                  }
                },
              ));
            }

            return list;
          },
        ),
        SizedBox(width: 4),
      ],
    );
  }
}
