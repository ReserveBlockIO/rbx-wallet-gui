import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../core/services/explorer_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:image/image.dart' as IMG;
import 'dart:convert' show base64Encode;

import '../core/app_constants.dart';
import '../core/dialogs.dart';
import '../core/env.dart';
import '../features/asset/asset.dart';
import '../features/config/providers/config_provider.dart';

Future<void> openFile(File file) async {
  try {
    await launchUrl(file.uri);
  } catch (e) {
    print(e);
    launchUrl(File(file.parent.path).uri);
  }
}

Future<PlatformFile?> getFile(List<String> extensions) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowedExtensions: extensions,
    allowMultiple: false,
    type: FileType.custom,
  );
  if (result == null) {
    return null;
  }
  if (result.files.isEmpty) {
    return null;
  }

  final file = result.files.first;

  return file;
}

Future<String> dbPath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  if (Platform.isMacOS) {
    appDocPath = appDocPath.replaceAll("/Documents", Env.isTestNet ? "/rbxtest" : "/vfx");
  } else {
    final winDir = await getApplicationSupportDirectory();
    appDocPath = winDir.path;
    appDocPath = appDocPath.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\${Env.isTestNet ? 'RBXTest' : 'VFX'}");
  }

  return appDocPath;
}

Future<String> assetsPath() async {
  String _dbPath = await dbPath();

  if (Platform.isMacOS) {
    _dbPath = "$_dbPath/${Env.isTestNet ? 'AssetsTestNet' : 'Assets'}";
  } else {
    _dbPath = "$_dbPath\\${Env.isTestNet ? 'AssetsTestNet' : 'Assets'}";
  }

  return _dbPath;
}

Future<String> configPath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String path = appDocDir.path;

  if (Platform.isMacOS) {
    path = path.replaceAll("/Documents", Env.isTestNet ? "/rbxtest/ConfigTestNet/config.txt" : "/vfx/Config/config.txt");
  } else {
    final winDir = await getApplicationSupportDirectory();
    path = winDir.path;
    path = path.replaceAll(
        "\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\${Env.isTestNet ? 'RBXTest\\ConfigTestNet\\config.txt' : 'VFX\\Config\\config.txt'}");
  }
  return path;
}

Future<String> startupProgressPath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String path = appDocDir.path;

  if (Platform.isMacOS) {
    path = path.replaceAll("/Documents", Env.isTestNet ? "/rbxtest/DatabasesTestNet/statesynclog.txt" : "/vfx/Databases/statesynclog.txt");
  } else {
    final winDir = await getApplicationSupportDirectory();
    path = winDir.path;
    path = path.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui",
        "\\Local\\${Env.isTestNet ? 'RBXTest\\DatabasesTestNet\\statesynclog.txt' : 'VFX\\Databases\\statesynclog.txt'}");
  }
  return path;
}

Future<Asset?> selectAsset(WidgetRef ref) async {
  FilePickerResult? result;
  if (!kIsWeb) {
    final Directory currentDir = Directory.current;
    result = await FilePicker.platform.pickFiles();
    Directory.current = currentDir;
  } else {
    result = await FilePicker.platform.pickFiles();
  }

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

    final url = await ExplorerService().uploadAsset(bytes, filename, ext);

    if (url == null) return null;
    asset = Asset(
      id: '00000000-0000-0000-0000-000000000000',
      location: url,
      extension: ext,
      fileSize: result.files.single.bytes!.length,
      bytes: bytes,
      name: filename,
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

String fileNameFromPath(String path) {
  return path.split('/').last;
}

String fileTypeFromPath(String path) {
  final ext = path.split('.').last.toLowerCase();

  switch (ext) {
    case "jpg":
    case "jpeg":
    case "png":
    case "gif":
    case "webp":
      return "Image";
    case "pdf":
      return "Document";
    case "doc":
    case "docx":
      return "Word";
    case "mov":
    case "mp4":
    case "avi":
      return "Video";
    case "mp3":
    case "m4a":
    case "wav":
    case "flac":
      return "Audio";
    default:
      return "File";
  }
}

IconData iconFromPath(String path) {
  final fileType = fileTypeFromPath(path);
  switch (fileType) {
    case "Image":
      return FontAwesomeIcons.fileImage;
    case "Document":
      return FontAwesomeIcons.filePdf;
    case "Word":
      return FontAwesomeIcons.fileWord;
    case "Video":
      return FontAwesomeIcons.fileVideo;
    case "Audio":
      return FontAwesomeIcons.fileAudio;
    default:
      return FontAwesomeIcons.file;
  }
}

String? resizeImageAndBase64(String path, int size) {
  final image = IMG.decodeImage(File(path).readAsBytesSync());

  if (image != null) {
    final thumbnail = IMG.copyResizeCropSquare(image, size: size);

    final bytes = Uint8List.fromList(IMG.encodePng(thumbnail));
    return base64Encode(bytes);
  }

  return null;
}

String? resizeImageAndBase64FromBytes(Uint8List bytes, int size) {
  final image = IMG.decodeImage(bytes);

  if (image != null) {
    final thumbnail = IMG.copyResizeCropSquare(image, size: size);

    final bytes = Uint8List.fromList(IMG.encodePng(thumbnail));
    return base64Encode(bytes);
  }

  return null;
}
