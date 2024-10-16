import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../utils/formatting.dart';
import '../../../core/app_constants.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/components.dart';
import '../../block/latest_block.dart';
import '../../block/validated_blocks_provider.dart';
import '../providers/validating_status_provider.dart';
import '../../../core/components/back_to_home_button.dart';

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
      title: const Text("Validator"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      // leading: BackToHomeButton(),
    );
  }

  Future<String?> _validatorName(String address) async {
    return await BridgeService().getValidatorInfo(address);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final currentWallet = ref.watch(sessionProvider.select((v) => v.currentWallet));

    if (currentWallet == null) {
      return const InvalidWallet(message: "No account selected");
    }

    // final validator = ref.watch(currentValidatorProvider);

    // if (validator == null) {
    //   return InvalidWallet(
    //     message: "${currentWallet.address} is not eligable to be a validator",
    //   );
    // }

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
              const Text("You can only validate with one account."),
            ],
          ),
        );
      }

      final port = Env.validatorPort;

      if (currentWallet.balance < ASSURED_AMOUNT_TO_VALIDATE) {
        return Center(
          child: AppCard(
              padding: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Validating requires ${formatIntWithCommas(ASSURED_AMOUNT_TO_VALIDATE.round())} VFX.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.warning,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Please choose another account:",
                    style: TextStyle(
                      height: 1.2,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  WalletSelector(
                    truncatedLabel: false,
                    withOptions: false,
                    includeBtc: false,
                  ),
                  SizedBox(width: 380, child: Divider()),
                  SelectableText(
                    "Or transfer ${formatIntWithCommas((ASSURED_AMOUNT_TO_VALIDATE - currentWallet.balance).ceil())} VFX to ${currentWallet.address}.",
                    style: TextStyle(
                      height: 1.2,
                      color: Colors.white.withOpacity(.8),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        );
      }

      return Center(
        child: AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "You must have port $port and port ${Env.validatorSecondaryPort} open to external networks with a balance of ${formatIntWithCommas(ASSURED_AMOUNT_TO_VALIDATE.round())} VFX in order to validate."),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                label: "Start Validating",
                icon: Icons.check,
                variant: AppColorVariant.Success,
                onPressed: () async {
                  if (!widgetGuardWalletIsSynced(ref)) return;
                  if (!widgetGuardWalletIsNotResyncing(ref)) return;
                  if (!await passwordRequiredGuard(context, ref, true, true)) return;

                  if (currentWallet.balance < ASSURED_AMOUNT_TO_VALIDATE) {
                    Toast.error("Balance not currently sufficient to validate. $ASSURED_AMOUNT_TO_VALIDATE VFX required.");
                    return;
                  }

                  final res = await BridgeService().turnOnValidator(currentWallet.address);

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
              style: Theme.of(context).textTheme.headlineSmall,
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: RotatingGear(
                      size: 32,
                      color: AppColors.getBlue(),
                    ),
                  ),
                  Text(
                    "Validating...",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.getBlue(),
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              Text(
                "Address: ${currentWallet.labelWithoutTruncation}",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
              FutureBuilder(
                future: _validatorName(currentWallet.address),
                builder: (context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IgnorePointer(
                              ignoring: true,
                              child: Opacity(
                                opacity: 0,
                                child: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.edit),
                                  iconSize: 14,
                                  color: AppColors.getBlue(ColorShade.s50),
                                ),
                              ),
                            ),
                            Text(
                              "[${snapshot.data!}]",
                              style: TextStyle(
                                color: AppColors.getBlue(ColorShade.s50),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Tooltip(
                              message: "Rename Validator",
                              child: IconButton(
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

                                      if (confirmed == true) {
                                        ref.read(sessionProvider.notifier).restartCli();
                                        Toast.message("Restarting CLI...");
                                      }
                                    } else {
                                      Toast.error();
                                    }
                                  }
                                },
                                icon: Icon(Icons.edit),
                                iconSize: 14,
                                color: AppColors.getBlue(ColorShade.s50),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(
                height: 8,
              ),
              AppButton(
                label: "Stop Validating",
                icon: Icons.stop,
                variant: AppColorVariant.Danger,
                onPressed: () async {
                  final confirmed = await ConfirmDialog.show(
                    title: "Stop Validating",
                    body: "Are you sure you want to stop validating?",
                    confirmText: "Stop",
                    cancelText: "Cancel",
                    destructive: true,
                  );

                  if (confirmed != true) {
                    return;
                  }
                  ref.read(globalLoadingProvider.notifier).start();

                  final success = await ref.read(currentValidatorProvider.notifier).stopValidating();

                  if (success) {
                    Toast.message("${currentWallet.label} has stopped validating.");
                    ref.read(validatingStatusProvider.notifier).check(false);
                    await ref.read(sessionProvider.notifier).mainLoop(false);
                  } else {
                    Toast.error();
                  }
                  ref.read(globalLoadingProvider.notifier).complete();
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Blocks Validated (${ref.watch(validatedBlocksProvider).length})",
            style: TextStyle(
              fontSize: 13,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        ValidatedBlocksList()
      ],
    );
  }
}

class ValidatedBlocksList extends BaseComponent {
  ValidatedBlocksList({
    super.key,
  });

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocks = ref.watch(validatedBlocksProvider);
    if (blocks.isEmpty) {
      return Text("No Validated Blocks");
    }
    return SizedBox(
      height: 106,
      child: Scrollbar(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ListView.builder(
              controller: scrollController,
              itemCount: blocks.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 106,
              itemBuilder: (context, index) {
                final block = blocks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: _BlockPreview(block: block),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class _BlockPreview extends StatelessWidget {
  const _BlockPreview({
    required this.block,
  });

  final ValidatedBlock block;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final blockInfo = await BridgeService().blockInfo(block.height, null);
          if (blockInfo != null) {
            SpecialDialog<void>().show(
              context,
              title: "Block ${block.height}",
              maxWidth: 300,
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: LatestBlockContent(
                  latestBlock: blockInfo,
                ),
              ),
            );
          }
        },
        child: AppCard(
          padding: 8,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatIntWithCommas(block.height),
                  style: TextStyle(
                    color: AppColors.getBlue(),
                  ),
                ),
                Text(
                  block.parseTimeStamp,
                  style: TextStyle(fontSize: 8, color: Colors.white54),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
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
