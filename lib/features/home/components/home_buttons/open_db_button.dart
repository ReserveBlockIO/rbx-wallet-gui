import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../utils/files.dart';

class OpenDbFolderButton extends BaseComponent {
  const OpenDbFolderButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return AppButton(
      label: "Open DB Folder",
      icon: Icons.folder_open_rounded,
      onPressed: () async {
        // final shell = Shell(throwOnError: false);

        // Directory appDocDir = await getApplicationDocumentsDirectory();
        // String appDocPath = appDocDir.path;

        // if (Platform.isMacOS) {
        //   appDocPath = appDocPath.replaceAll("/Documents", Env.isTestNet ? "/rbxtest" : "/vfx");
        // } else {
        //   final winDir = await getApplicationSupportDirectory();
        //   appDocPath = winDir.path;
        //   appDocPath = appDocPath.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\${Env.isTestNet ? 'RBXTest' : 'VFX'}");
        // }

        final path = await dbPath();

        openFile(File(path));

        // String cmd = "";
        // if (Platform.isMacOS) {
        //   appDocPath = appDocPath.replaceAll("/Documents", "/vfx");
        //   cmd = "open $appDocPath";
        // } else {
        //   appDocDir = await getApplicationSupportDirectory();

        //   appDocPath = appDocDir.path;

        //   appDocPath = appDocPath.replaceAll(
        //       "\\Roaming\\com.example\\rbx_wallet_gui",
        //       "\\Local\\vfx");
        //   cmd = "start $appDocPath";
        // }

        // shell.run(cmd);
      },
    );
  }
}
