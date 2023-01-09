import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openFile(File file) async {
  try {
    await launchUrl(file.uri);
  } catch (e) {
    launchUrl(File(file.parent.path).uri);
  }
}

Future<String> configPath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String path = appDocDir.path;

  if (Platform.isMacOS) {
    path = path.replaceAll("/Documents", Env.isTestNet ? "/rbxtest/ConfigTestNet/config.txt" : "/rbx/Config/config.txt");
  } else {
    final winDir = await getApplicationSupportDirectory();
    path = winDir.path;
    path = path.replaceAll(
        "\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\${Env.isTestNet ? 'RBXTest\\ConfigTextNet\\config.txt' : 'RBX\\Config\\config.txt'}");
  }
  return path;
}
