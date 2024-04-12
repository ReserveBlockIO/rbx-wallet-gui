import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/env.dart';

class OpenLogButton extends BaseComponent {
  const OpenLogButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AppButton(
      label: "Open Log",
      icon: Icons.open_in_new,
      onPressed: () async {
        final shell = Shell(throwOnError: false);

        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;

        String cmd = "";
        if (Platform.isMacOS) {
          appDocPath = appDocPath.replaceAll(
              "/Documents", Env.isTestNet ? "/rbxtest" : "/vfx");
          cmd =
              "open $appDocPath/Databases${Env.isTestNet ? 'TestNet' : ''}/rbxlog.txt";
        } else {
          appDocDir = await getApplicationSupportDirectory();

          appDocPath = appDocDir.path;

          appDocPath = appDocPath.replaceAll(
              "\\Roaming\\com.example\\rbx_wallet_gui",
              "\\Local\\VFX${Env.isTestNet ? 'Test' : ''}");
          cmd =
              "start $appDocPath\\Databases${Env.isTestNet ? 'TestNet' : ''}\\rbxlog.txt";
        }

        shell.run(cmd);
      },
    );
  }
}
