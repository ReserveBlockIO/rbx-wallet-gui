import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/adnr/components/adrn_list.dart';
import 'package:rbx_wallet/features/adnr/components/create_adnr_dialog.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class AdnrScreen extends BaseScreen {
  const AdnrScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("RBX Domain Service"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create an RBX Domain as an alias to your wallet's address for receiving funds.",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "RBX domains cost $ADNR_COST RBX plus the transaction fee.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(child: AdnrList(wallets: wallets)),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                label: "Create New Wallet",
                onPressed: () async {
                  await ref.read(walletListProvider.notifier).create();
                },
              ),
              AppButton(
                label: "Import Wallet",
                onPressed: () {
                  PromptModal.show(
                    title: "Import Wallet",
                    validator: (String? value) =>
                        formValidatorNotEmpty(value, "Private Key"),
                    labelText: "Private Key",
                    onValidSubmission: (value) async {
                      final wallet = await ref
                          .read(walletListProvider.notifier)
                          .import(value);

                      if (wallet == null) return;
                      if (wallet.balance >=
                              (ADNR_COST + MIN_RBX_FOR_SC_ACTION) &&
                          wallet.adnr == null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CreateAdnrDialog(
                              address: wallet.address,
                              adnr: wallet.adnr,
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
