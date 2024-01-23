import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/env.dart';

class OpenLogButton extends BaseComponent {
  final bool forBtc;

  const OpenLogButton({
    Key? key,
    this.forBtc = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AppButton(
      label: "Open Log",
      icon: Icons.open_in_new,
      variant: forBtc ? AppColorVariant.Btc : AppColorVariant.Primary,
      onPressed: () async {
        final shell = Shell(throwOnError: false);

        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;

        String cmd = "";
        if (Platform.isMacOS) {
          appDocPath = appDocPath.replaceAll("/Documents", Env.isTestNet ? "/rbxtest" : "/rbx");
          cmd = "open $appDocPath/Databases${Env.isTestNet ? 'TestNet' : ''}/rbxlog.txt";
        } else {
          appDocDir = await getApplicationSupportDirectory();

          appDocPath = appDocDir.path;

          appDocPath = appDocPath.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\RBX${Env.isTestNet ? 'Test' : ''}");
          cmd = "start $appDocPath\\Databases${Env.isTestNet ? 'TestNet' : ''}\\rbxlog.txt";
        }

        shell.run(cmd);
      },
    );
  }
}
