import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/health/health_service.dart';
import 'package:rbx_wallet/features/validator/providers/current_validator_provider.dart';
import 'package:rbx_wallet/features/wallet/components/invalid_wallet.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class AdjudicatorScreen extends BaseScreen {
  const AdjudicatorScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Adjudicator"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  Future<bool> checkPort([bool withSuccessMessage = true]) async {
    final port = Env.validatorPort;

    final open = await HealthService().pingPort();

    if (open) {
      if (withSuccessMessage) {
        Toast.message("Port $port is open!");
      }
      return true;
    } else {
      Toast.error("Port $port is NOT open. Please configure your firewall.");
      return false;
    }
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;

    if (currentWallet == null) {
      return const InvalidWallet(message: "No wallet selected");
    }

    // final validator = ref.watch(currentValidatorProvider);

    // if (validator == null) {
    //   return InvalidWallet(
    //     message: "${currentWallet.address} is not eligable to be a validator",
    //   );
    // }
    if (!currentWallet.isValidating) {
      // final port = Env.validatorPort;

      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              label: "Start Adjudicating",
              icon: Icons.star,
              variant: AppColorVariant.Success,
              onPressed: () async {
                if (!guardWalletIsSynced(ref.read)) return;
                if (!guardWalletIsNotResyncing(ref.read)) return;

                // if (!await checkPort(false)) return;

                ref.read(globalLoadingProvider.notifier).start();

                await Future.delayed(Duration(milliseconds: 750));

                // final res = await BridgeService().turnOnValidator(currentWallet.address);

                ref.read(globalLoadingProvider.notifier).complete();
              },
            ),
          ],
        ),
      );
    }

    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${currentWallet.labelWithoutTruncation}  is Adjudicating...",
          style: Theme.of(context).textTheme.headline4,
        ),
        const Padding(
          padding: EdgeInsets.all(32),
          child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white70,
                ),
              )),
        ),
        AppButton(
          label: "Stop Adjudicating",
          variant: AppColorVariant.Danger,
          onPressed: () async {
            // ref.read(globalLoadingProvider.notifier).start();

            // final success = await ref.read(currentValidatorProvider.notifier).stopValidating();

            // if (success) {
            //   Toast.message("${currentWallet.label} hast stopped validating.");
            //   await ref.read(sessionProvider.notifier).load();
            // } else {
            //   Toast.error();
            // }
            // ref.read(globalLoadingProvider.notifier).complete();
          },
        ),
      ],
    ));
  }
}
