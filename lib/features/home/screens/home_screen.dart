import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/home/components/log_window.dart';
import 'package:rbx_wallet/features/home/components/transaction_window.dart';
import 'package:rbx_wallet/features/root/components/reload_button.dart';
import 'package:rbx_wallet/features/validator/providers/validator_list_provider.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
          // includeMainDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Dashboard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      leading: ReloadButton(),
      actions: [WalletSelector()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "General Tools",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Print Addresses",
                  onPressed: () {
                    final _log = ref.read(logProvider.notifier);

                    _log.append(LogEntry(
                      message: "Wallet Addresses:",
                      variant: AppColorVariant.Secondary,
                    ));

                    final wallets = ref.read(walletListProvider);
                    for (final wallet in wallets) {
                      _log.append(LogEntry(
                        message: "${wallet.address} (${wallet.balance} RBX)",
                        variant: AppColorVariant.Success,
                        textToCopy: wallet.address,
                      ));
                    }
                  },
                  size: AppSizeVariant.Lg,
                ),
                AppButton(
                  label: "Print Validators",
                  onPressed: () async {
                    final _log = ref.read(logProvider.notifier);

                    final validators = ref.read(validatorListProvider);

                    if (validators.isEmpty) {
                      _log.append(LogEntry(
                        message: "No validators",
                        variant: AppColorVariant.Danger,
                      ));
                      return;
                    }
                    _log.append(LogEntry(
                      message: "Validators:",
                      variant: AppColorVariant.Secondary,
                    ));

                    for (final validator in validators) {
                      _log.append(
                        LogEntry(
                          message:
                              "${validator.address} => ${validator.isValidating ? 'Validating' : 'Not Validating'}",
                          variant: validator.isValidating
                              ? AppColorVariant.Success
                              : AppColorVariant.Info,
                          textToCopy: validator.address,
                        ),
                      );
                    }
                  },
                  size: AppSizeVariant.Lg,
                ),
                AppButton(
                  label: "Get Blockchain",
                  onPressed: () async {
                    await ref.read(sessionProvider.notifier).load();
                  },
                  size: AppSizeVariant.Lg,
                ),
                AppButton(
                  label: "Restart CLI",
                  // variant: AppColorVariant.Warning,
                  onPressed: () async {
                    // BridgeService().killCli();

                    final confirmed = await ConfirmDialog.show(
                      title: "Restart",
                      body: "Are you sure you want to restart the CLI?",
                      confirmText: "Restart",
                      cancelText: "Cancel",
                      destructive: true,
                    );

                    if (confirmed) {
                      ref.read(sessionProvider.notifier).restartCli();
                    }
                  },
                ),
              ],
            ),
            Divider(),
            LogWindow(),
            Divider(),
            TransactionWindow(),
          ],
        ),
      ),
    );
  }
}
