import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/validator/providers/validating_status_provider.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/guards.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../bridge/services/bridge_service.dart';
import '../../encrypt/utils.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../wallet/components/invalid_wallet.dart';
import '../../wallet/components/wallet_selector.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../providers/current_validator_provider.dart';

class ValidatorScreen extends BaseScreen {
  const ValidatorScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Masternode"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: const [WalletSelector()],
    );
  }

  Future<String?> _validatorName(String address) async {
    return await BridgeService().getValidatorInfo(address);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider).currentWallet;

    if (currentWallet == null) {
      return const InvalidWallet(message: "No wallet selected");
    }

    final validator = ref.watch(currentValidatorProvider);

    if (validator == null) {
      return InvalidWallet(
        message: "${currentWallet.address} is not eligable to be a validator",
      );
    }

    if (!currentWallet.isValidating) {
      final wallets = ref.watch(walletListProvider);
      final anyWalletIsValidating = wallets.firstWhereOrNull((w) => w.isValidating) != null;
      if (anyWalletIsValidating) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.warning,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${currentWallet.label} can not validate.",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("You can only validate with one wallet."),
            ],
          ),
        );
      }

      final port = Env.validatorPort;

      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("You must have port $port open to external networks in order to validate."),
            const SizedBox(
              height: 40,
            ),
            AppButton(
              label: "Start Validating",
              icon: Icons.star,
              variant: AppColorVariant.Success,
              onPressed: () async {
                if (!guardWalletIsSynced(ref.read)) return;
                if (!guardWalletIsNotResyncing(ref.read)) return;
                if (!await passwordRequiredGuard(context, ref, true, true)) return;

                if (currentWallet.balance < 1000.0) {
                  Toast.error("Balance not currently sufficient to validate. 1000 RBX required.");
                  return;
                }

                ref.read(globalLoadingProvider.notifier).start();

                final res = await BridgeService().turnOnValidator(currentWallet.address);

                ref.read(globalLoadingProvider.notifier).complete();

                if (res != null) {
                  Toast.message(res);
                  await ref.read(sessionProvider.notifier).mainLoop(false);
                  return;
                }

                PromptModal.show(
                    title: "Name your validator",
                    validator: (value) => formValidatorNotEmpty(value, "Validator Name"),
                    labelText: "Validator Name",
                    lines: 1,
                    onValidSubmission: (name) async {
                      ref.read(globalLoadingProvider.notifier).start();

                      final success = await ref.read(currentValidatorProvider.notifier).startValidating(name.trim().replaceAll("\n", ""));
                      ref.read(globalLoadingProvider.notifier).complete();

                      if (success) {
                        Toast.message("$name [${currentWallet.label}] is now validating.");
                        ref.read(validatingStatusProvider.notifier).check(false);
                        await ref.read(sessionProvider.notifier).mainLoop(false);
                      } else {
                        Toast.error();
                      }
                    });
              },
            ),
          ],
        ),
      );
    }

    if (!ref.watch(validatingStatusProvider)) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${currentWallet.labelWithoutTruncation} is NOT Validating...",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8),
            AppButton(
              label: "Check Again",
              onPressed: () {
                ref.read(validatingStatusProvider.notifier).check();
              },
            )
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
          style: Theme.of(context).textTheme.headline5,
        ),
        FutureBuilder(
            future: _validatorName(currentWallet.address),
            builder: (context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text("[${snapshot.data!}]"),
                  );
                }
              }
              return const SizedBox();
            }),
        const Padding(
          padding: EdgeInsets.all(32),
          child: RotatingGear(),
        ),
        AppButton(
          label: "Stop Validating",
          variant: AppColorVariant.Danger,
          onPressed: () async {
            ref.read(globalLoadingProvider.notifier).start();

            final success = await ref.read(currentValidatorProvider.notifier).stopValidating();

            if (success) {
              Toast.message("${currentWallet.label} hast stopped validating.");

              ref.read(validatingStatusProvider.notifier).check(false);
              await ref.read(sessionProvider.notifier).mainLoop(false);
            } else {
              Toast.error();
            }
            ref.read(globalLoadingProvider.notifier).complete();
          },
        ),
        const SizedBox(
          height: 8,
        ),
        AppButton(
            label: "Rename Validator",
            variant: AppColorVariant.Primary,
            onPressed: () async {
              final name = await PromptModal.show(
                title: "Validator Name",
                validator: (val) => formValidatorNotEmpty(val, "Name"),
                labelText: "New Validator Name",
                lines: 1,
              );

              if (name != null && name.isNotEmpty) {
                final success = await BridgeService().renameValidator(name.trim().replaceAll("\n", ""));
                if (success) {
                  Toast.message("Validator name changed to $name.");

                  final confirmed = await ConfirmDialog.show(
                    title: "Restart CLI",
                    body: "In order for the name to be reflected,\na restart of the CLI is required.\n\nRestart now?",
                    confirmText: "Restart",
                    cancelText: "Cancel",
                  );

                  if (confirmed) {
                    ref.read(sessionProvider.notifier).restartCli();
                    Toast.message("Restarting CLI...");
                  }
                } else {
                  Toast.error();
                }
              }
            }),
      ],
    ));
  }
}

class RotatingGear extends StatefulWidget {
  final Color? color;
  final double size;
  const RotatingGear({
    Key? key,
    this.color,
    this.size = 24,
  }) : super(key: key);

  @override
  State<RotatingGear> createState() => RotatingGearState();
}

class RotatingGearState extends State<RotatingGear> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: Icon(
              Icons.settings,
              size: widget.size,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}
