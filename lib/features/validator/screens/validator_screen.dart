import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/health/health_service.dart';
import 'package:rbx_wallet/features/validator/providers/current_validator_provider.dart';
import 'package:rbx_wallet/features/wallet/components/invalid_wallet.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class ValidatorScreen extends BaseScreen {
  const ValidatorScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Masternode"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;

    if (currentWallet == null) {
      return InvalidWallet(message: "No wallet selected");
    }

    final validator = ref.watch(currentValidatorProvider);

    if (validator == null) {
      return InvalidWallet(
        message: "${currentWallet.address} is not eligable to be a validator",
      );
    }
    if (!currentWallet.isValidating) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "You must have port 3338 open to external networks in order to craft blocks."),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                label: "Check Port",
                type: AppButtonType.Outlined,
                variant: AppColorVariant.Secondary,
                onPressed: () async {
                  final stream = await HealthService().pingPort();

                  bool open = false;

                  stream.listen((event) {
                    if (event.summary != null) {
                      if (event.summary!.transmitted > 0) {
                        open = true;
                      }
                    }
                  });
                  await Future.delayed(Duration(milliseconds: 300));

                  if (open) {
                    Toast.message("Port 3338 is open!");
                  } else {
                    Toast.error(
                        "Port 3338 is NOT open. Please configure your firewall.");
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            AppButton(
              label: "Start Validating",
              icon: Icons.star,
              variant: AppColorVariant.Success,
              onPressed: () async {
                PromptModal.show(
                    title: "Name your validator",
                    validator: (value) =>
                        formValidatorNotEmpty(value, "Validator Name"),
                    labelText: "Validator Name",
                    onValidSubmission: (name) async {
                      final success = await ref
                          .read(currentValidatorProvider.notifier)
                          .startValidating(name);

                      Toast.message(
                          "$name[${currentWallet.label}] is now validating.");
                    });
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
          "${currentWallet.labelWithoutTruncation} is Validating...",
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.all(32),
          child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary),
              )),
        ),
        AppButton(
          label: "Stop Validating",
          variant: AppColorVariant.Danger,
          onPressed: () {},
        ),
      ],
    ));
  }
}
