import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../providers/tokenize_btc_form_provider.dart';

class TokenizeBtcScreen extends BaseScreen {
  const TokenizeBtcScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("Tokenize BTC"),
      actions: [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(tokenizeBtcFormProvider);
    final formProvider = ref.read(tokenizeBtcFormProvider.notifier);

    final session = ref.watch(sessionProvider);

    final wallets = ref.watch(walletListProvider).where((w) => !w.isReserved && w.balance > 0).toList();
    final selectedAddress = session.currentWallet != null && !session.currentWallet!.isReserved ? session.currentWallet?.address : null;
    if (wallets.isEmpty) {
      return Center(
        child: Column(
          children: [
            Text("A VFX wallet with a balance is required"),
            SizedBox(
              height: 8,
            ),
            WalletSelector(
              withOptions: false,
              truncatedLabel: false,
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Form(
        key: formProvider.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PopupMenuButton<String>(
                  onSelected: (address) {
                    // formProvider.setSelectedAddress(address);
                    ref.read(sessionProvider.notifier).setCurrentWallet(wallets.firstWhere((w) => w.address == address));
                  },
                  color: Color(0xFF080808),
                  constraints: const BoxConstraints(
                    minWidth: 2.0 * 56.0,
                    maxWidth: 8.0 * 56.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("VFX Address:"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        selectedAddress ?? "None",
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                      ),
                      Transform.translate(
                        offset: Offset(0, 2),
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  itemBuilder: (context) {
                    return wallets.map(
                      (w) {
                        return PopupMenuItem(
                          value: w.address,
                          child: Text(
                            "${w.labelWithoutTruncation} (${w.balance} VFX)",
                            style: TextStyle(
                              fontSize: 12,
                              color: w.address == selectedAddress ? Theme.of(context).colorScheme.secondary : Colors.white,
                            ),
                          ),
                        );
                      },
                    ).toList();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: formProvider.tokenNameController,
              decoration: InputDecoration(
                label: Text(
                  "Token Name (Optional)",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.btcOrange,
                  ),
                ),
                hintText: "vBTC Token",
              ),
            ),
            TextFormField(
              controller: formProvider.tokenDescriptionController,
              decoration: InputDecoration(
                label: Text(
                  "Token Description (Optional)",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.btcOrange,
                  ),
                ),
                hintText: "vBTC Token",
              ),
              minLines: 3,
              maxLines: 3,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Token Image (Optional)",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.btcOrange,
              ),
            ),
            FileSelector(
              asset: formState.asset,
              onChange: (a) {
                formProvider.setAsset(a);
              },
            ),
            Divider(),
            Center(
              child: AppButton(
                processing: formState.isProcessing,
                label: "Compile & Mint",
                variant: AppColorVariant.Btc,
                onPressed: () async {
                  if (selectedAddress == null) {
                    Toast.error("A VFX address is required");
                  }
                  if (formState.isProcessing) {
                    return;
                  }

                  final success = await formProvider.submit();
                  if (success == true) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
