import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_constants.dart';
import '../core/dialogs.dart';
import '../core/env.dart';
import '../core/services/transaction_service.dart';
import '../features/asset/asset.dart';
import '../features/config/providers/config_provider.dart';

Future<void> openFile(File file) async {
  try {
    await launchUrl(file.uri);
  } catch (e) {
    launchUrl(File(file.parent.path).uri);
  }
}

Future<String> dbPath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  if (Platform.isMacOS) {
    appDocPath = appDocPath.replaceAll("/Documents", Env.isTestNet ? "/rbxtest" : "/rbx");
  } else {
    final winDir = await getApplicationSupportDirectory();
    appDocPath = winDir.path;
    appDocPath = appDocPath.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\${Env.isTestNet ? 'RBXTest' : 'RBX'}");
  }

  return appDocPath;
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
        "\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\${Env.isTestNet ? 'RBXTest\\ConfigTestNet\\config.txt' : 'RBX\\Config\\config.txt'}");
  }
  return path;
}

Future<String> startupProgressPath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String path = appDocDir.path;

  if (Platform.isMacOS) {
    path = path.replaceAll("/Documents", Env.isTestNet ? "/rbxtest/DatabasesTestNet/statesynclog.txt" : "/rbx/Databases/statesynclog.txt");
  } else {
    final winDir = await getApplicationSupportDirectory();
    path = winDir.path;
    path = path.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui",
        "\\Local\\${Env.isTestNet ? 'RBXTest\\DatabasesTestNet\\statesynclog.txt' : 'RBX\\Databases\\statesynclog.txt'}");
  }
  return path;
}

Future<Asset?> selectAsset(WidgetRef ref) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result == null) {
    return null;
  }

  File? file;
  Asset? asset;

  if (kIsWeb) {
    final bytes = result.files.single.bytes;
    if (bytes == null) {
      return null;
    }

    final ext = result.files.single.extension;
    final filename = result.files.single.name;

    final webAsset = await TransactionService().uploadAsset(bytes, filename, ext);

    if (webAsset == null) return null;
    asset = Asset(
      id: '00000000-0000-0000-0000-000000000000',
      location: webAsset.location,
      extension: webAsset.extension,
      fileSize: result.files.single.bytes!.length,
      bytes: bytes,
      name: webAsset.filename,
    );
  } else {
    file = File(result.files.single.path!);
    final filePath = file.path;

    final slash = Platform.isWindows ? "\\" : "/";
    final name = filePath.split(slash).last;
    final extension = name.split(".").last;
    final fileSize = (await File(filePath).readAsBytes()).length;

    if (fileSize > MAX_ASSET_BYTES) {
      // Toast.error("Max file size is 150MB.");
      InfoDialog.show(title: "File is too large", body: "Max file size is 150MB.");
      return null;
    }

    if (MALWARE_FILE_EXTENSIONS.contains(extension) || ref.read(configProvider).rejectAssetExtensionTypes.contains(extension.toLowerCase())) {
      InfoDialog.show(title: "Unsupported File", body: "This file extension (.$extension) is not permitted.");
      return null;
    }

    asset = Asset(
      id: "00000000-0000-0000-0000-000000000000",
      name: name,
      authorName: "",
      location: filePath,
      extension: extension,
      fileSize: fileSize,
    );
  }
  return asset;
}
