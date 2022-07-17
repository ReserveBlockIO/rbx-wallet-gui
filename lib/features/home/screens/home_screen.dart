import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/features/home/components/log_window.dart';
import 'package:rbx_wallet/features/home/components/transaction_window.dart';

import 'package:rbx_wallet/features/keygen/components/keygen_cta.dart'
    if (dart.library.io) 'package:rbx_wallet/features/keygen/components/keygen_cta_mock.dart';

import 'package:rbx_wallet/features/root/components/reload_button.dart';
import 'package:rbx_wallet/features/validator/providers/validator_list_provider.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

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
      title: const Text("Dashboard"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      leading: const ReloadButton(),
      actions: const [WalletSelector()],
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
            if (kIsWeb)
              Text(
                "Keys",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            if (kIsWeb) const Divider(),
            if (kIsWeb) const KeygenCta(),
            if (!kIsWeb)
              Text(
                "General Tools",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            if (!kIsWeb) const Divider(),
            if (!kIsWeb)
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.spaceEvenly,
                spacing: 12.0,
                runSpacing: 12.0,
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
                  ),
                  AppButton(
                    label: "Get Blockchain",
                    onPressed: () async {
                      await ref.read(walletInfoProvider.notifier).fetch();
                    },
                  ),
                  AppButton(
                    label: "Show Debug Data",
                    onPressed: () async {
                      final data = await BridgeService().getDebugInfo();
                      InfoDialog.show(
                        title: "Debug Data",
                        content: Container(
                          color: Colors.black54,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppButton(
                                    label: "Copy",
                                    icon: Icons.copy,
                                    variant: AppColorVariant.Success,
                                    onPressed: () async {
                                      await Clipboard.setData(
                                          ClipboardData(text: data));
                                      Toast.message(
                                          "Debug data copied to clipboard");
                                    },
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SelectableText(
                                    data,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Courier",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (!kIsWeb)
                    AppButton(
                      label: "Open DB Folder",
                      onPressed: () async {
                        // final shell = Shell(throwOnError: false);

                        Directory appDocDir =
                            await getApplicationDocumentsDirectory();
                        String appDocPath = appDocDir.path;

                        if (Platform.isMacOS) {
                          appDocPath = appDocPath.replaceAll("/Documents",
                              Env.isTestNet ? "/rbxtest" : "/rbx");
                        } else {
                          final winDir = await getApplicationSupportDirectory();
                          appDocPath = winDir.path;
                          appDocPath = appDocPath.replaceAll(
                              "\\Roaming\\com.example\\rbx_wallet_gui",
                              "\\Local\\${Env.isTestNet ? 'RBXTest' : 'RBX'}");
                        }

                        openFile(File(appDocPath));

                        // String cmd = "";
                        // if (Platform.isMacOS) {
                        //   appDocPath = appDocPath.replaceAll("/Documents", "/rbx");
                        //   cmd = "open $appDocPath";
                        // } else {
                        //   appDocDir = await getApplicationSupportDirectory();

                        //   appDocPath = appDocDir.path;

                        //   appDocPath = appDocPath.replaceAll(
                        //       "\\Roaming\\com.example\\rbx_wallet_gui",
                        //       "\\Local\\rbx");
                        //   cmd = "start $appDocPath";
                        // }

                        // shell.run(cmd);
                      },
                    ),
                  if (!kIsWeb)
                    AppButton(
                      label: "Open Log",
                      onPressed: () async {
                        final shell = Shell(throwOnError: false);

                        Directory appDocDir =
                            await getApplicationDocumentsDirectory();
                        String appDocPath = appDocDir.path;

                        String cmd = "";
                        if (Platform.isMacOS) {
                          appDocPath = appDocPath.replaceAll("/Documents",
                              Env.isTestNet ? "/rbxtest" : "/rbx");
                          cmd =
                              "open $appDocPath/Databases${Env.isTestNet ? 'TestNet' : ''}/rbxlog.txt";
                        } else {
                          appDocDir = await getApplicationSupportDirectory();

                          appDocPath = appDocDir.path;

                          appDocPath = appDocPath.replaceAll(
                              "\\Roaming\\com.example\\rbx_wallet_gui",
                              "\\Local\\RBX${Env.isTestNet ? 'Test' : ''}");
                          cmd =
                              "start $appDocPath\\Databases${Env.isTestNet ? 'TestNet' : ''}\\rbxlog.txt";
                        }

                        shell.run(cmd);
                      },
                    ),
                  if (Platform.isWindows)
                    AppButton(
                      label: "Clear Log",
                      onPressed: () async {
                        final confirmed = await ConfirmDialog.show(
                          title: "Clear Log",
                          body: "Are you sure you want to clear the log?",
                          destructive: true,
                          confirmText: "Clear",
                          cancelText: "Cancel",
                        );

                        if (confirmed == true) {
                          final success = await BridgeService().clearLog();
                          if (success) {
                            Toast.message("Log cleared");
                          } else {
                            Toast.error();
                          }
                        }
                      },
                    ),
                  AppButton(
                    label: "Rollback Blocks",
                    onPressed: () {
                      if (!guardWalletIsNotResyncing(ref.read)) return;

                      PromptModal.show(
                        title: "Rollback Blocks",
                        validator: (value) =>
                            formValidatorNotEmpty(value, "Number of blocks"),
                        labelText: "Number of blocks to rollback",
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onValidSubmission: (value) async {
                          Toast.message("Rolling back $value blocks...");
                          ref.read(logProvider.notifier).append(
                                LogEntry(
                                  message: "Rolling back $value blocks...",
                                  variant: AppColorVariant.Danger,
                                ),
                              );
                          ref.read(walletInfoProvider.notifier).fetch();

                          final success = await BridgeService().rollback(value);

                          if (success) {
                            ref.read(walletInfoProvider.notifier).fetch();
                            final msg = "Rolled back $value blocks";
                            Toast.message(msg);
                            ref.read(logProvider.notifier).append(
                                  LogEntry(
                                    message: msg,
                                    variant: AppColorVariant.Danger,
                                  ),
                                );
                          } else {
                            Toast.error();
                          }
                        },
                      );
                    },
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
            const Divider(),
            const LogWindow(),
            const Divider(),
            const TransactionWindow(),
          ],
        ),
      ),
    );
  }
}
