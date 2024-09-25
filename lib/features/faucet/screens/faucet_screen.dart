import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/faucet/components/faucet_form.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class FaucetScreen extends BaseScreen {
  const FaucetScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("VFX Faucet"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isBtc = ref.watch(sessionProvider).btcSelected;

    final wallet = ref.watch(sessionProvider).currentWallet;

    if (isBtc || wallet == null) {
      return Center(
        child: Text("Please choose a VFX account to continue"),
      );
    }
    return FutureBuilder<double>(
        future: _getInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "The community has allocated some VFX to lower the barrier to entry for trying out this feature. In order to prevent abuse, a phone number is required for an SMS authorization. Only a hash of your phone number will be stored.",
                    textAlign: TextAlign.center,
                  ),
                  Divider(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Max Amount: ${snapshot.data} VFX",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  const FaucetForm(),
                ],
              ),
            );
          }
          return CenteredLoader();
        });
  }

  Future<double> _getInfo() async {
    return await ExplorerService().faucetInfo();
  }
}
