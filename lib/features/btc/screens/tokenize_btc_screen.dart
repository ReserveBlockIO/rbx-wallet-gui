import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

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

    final wallet = session.btcSelected ? null : session.currentWallet;

    if (wallet == null || wallet.isReserved) {
      return Center(
        child: Text("Select an VFX Wallet is to proceed."),
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
                Text("VFX Wallet: "),
                Text(
                  wallet.address,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
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
