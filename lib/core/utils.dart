import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import '../features/btc/services/btc_service.dart';
import '../features/transactions/models/transaction.dart';

import '../features/wallet/providers/wallet_list_provider.dart';
import '../utils/files.dart';
import '../utils/toast.dart';
import 'env.dart';

Future<bool> backupKeys(BuildContext context, WidgetRef ref) async {
  try {
    final wallets = ref.read(walletListProvider).where((w) => !w.isReserved);

    String output = "";

    for (final w in wallets) {
      output += "Address:\n${w.address}\n\n";
      output += "Public Key:\n${w.publicKey}\n\n";
      output += "Private Key:\n${w.privateKey}\n\n";
      output += "===================================\n\n";
    }

    output += "FOR BULK IMPORT:\n\n";

    for (final w in wallets) {
      if (w.privateKey != '0') {
        output += "${w.privateKey}\n";
      }
    }
    output += "\n===================================\n\n";

    final btcAccounts = await BtcService().listAccounts(false);

    if (btcAccounts.isNotEmpty) {
      output += "BTC Accounts:\n\n";

      for (final b in btcAccounts) {
        output += "Addresss: \n${b.address}\n\n";
        output += "Private Key: \n${b.privateKey}\n\n";
        output += "WIF Private Key: \n${b.wifKey}\n\n";
        output += "===================================\n\n";
      }
    }

    List<int> bytes = utf8.encode(output);

    final date = DateTime.now();
    final d = "${date.year}-${date.month}-${date.day}";
    if (Platform.isMacOS) {
      await FileSaver.instance.saveAs(name: "vfx-keys-backup-$d", bytes: Uint8List.fromList(bytes), ext: 'txt', mimeType: MimeType.text);
    } else {
      final data =
          await FileSaver.instance.saveFile(name: "vfx-keys-backup-$d", bytes: Uint8List.fromList(bytes), ext: 'txt', mimeType: MimeType.text);
      Toast.message("Saved to $data");
    }

    return true;
  } catch (e) {
    print("Error on backupKeys");
    print(e);
    return false;
  }
}

Future<bool?> importMedia(BuildContext context, WidgetRef ref) async {
  final file = await getFile(['zip']);
  if (file == null) {
    return null;
  }

  try {
    final zipPath = file.path;
    final _assetsPath = await assetsPath();
    final dir = Directory(_assetsPath);

    final bytes = await File(zipPath!).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    for (final file in archive) {
      String filename = file.name;

      if (filename.contains('/')) {
        final list = filename.split('/');
        if (filename.contains('thumbs')) {
          filename = [list[list.length - 3], list[list.length - 2], list.last].join('/');
        } else {
          filename = [list[list.length - 2], list.last].join('/');
        }
      }

      if (file.isFile) {
        final data = file.content as List<int>;

        final p = "$_assetsPath/$filename";
        File(p)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory("$_assetsPath/$filename").create(recursive: true);
      }
    }

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> backupMedia(BuildContext context, WidgetRef ref) async {
  try {
    Directory appDocDir = Platform.isMacOS ? await getApplicationDocumentsDirectory() : await getApplicationSupportDirectory();

    String rbxPath = appDocDir.path;

    final assetsFolderName = Env.isTestNet ? "AssetsTestNet" : "Assets";

    if (Platform.isMacOS) {
      rbxPath = rbxPath.replaceAll("/Documents", Env.isTestNet ? "/rbxtest" : "/vfx");
    } else {
      rbxPath = rbxPath.replaceAll("\\Roaming\\com.example\\rbx_wallet_gui", "\\Local\\VFX${Env.isTestNet ? 'Test' : ''}");
    }

    String inputPath = "$rbxPath${Platform.isWindows ? '\\' : '/'}$assetsFolderName";

    final archive =
        Platform.isMacOS ? createArchiveFromDirectory(Directory.fromUri(Uri.parse(inputPath))) : createArchiveFromDirectory(Directory(inputPath));

    var bytes = ZipEncoder().encode(archive);
    if (bytes == null) {
      return false;
    }

    final date = DateTime.now();
    final d = "${date.year}-${date.month}-${date.day}";
    if (Platform.isMacOS) {
      await FileSaver.instance.saveAs(name: "vfx-media-backup-$d", ext: "zip", mimeType: MimeType.zip, bytes: Uint8List.fromList(bytes));
    } else {
      final data =
          await FileSaver.instance.saveFile(name: "vfx-media-backup-$d", ext: "zip", mimeType: MimeType.zip, bytes: Uint8List.fromList(bytes));
      Toast.message("Saved to $data");
    }

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

String generateRandomString(int len, [String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890']) {
  var r = Random();
  return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
}

bool isNumeric(String str) {
  return RegExp(r'^-?[0-9]+$').hasMatch(str);
}

String truncatedText(String str, [int maxLength = 16]) {
  const maxLength = 16;
  if (maxLength >= str.length) {
    return str;
  }
  return str.replaceRange(maxLength, str.length, "...");
}

Map<String, dynamic>? parseNftData(Transaction transaction) {
  try {
    if (transaction.nftData == null) {
      return null;
    }

    final data = jsonDecode(transaction.nftData);
    if (data is Map) {
      return data as Map<String, dynamic>;
    }

    if (data == null || data.isEmpty) {
      return null;
    }

    if (data[0] == null) {
      return null;
    }

    final Map<String, dynamic> d = data[0];

    return d;
  } catch (e) {
    print("Problem parsing NFT data on TX ${transaction.hash}");
    print(e);
    return null;
  }
}

String? nftDataValue(Map<String, dynamic> nftData, String key) {
  if (nftData.containsKey(key)) {
    final val = nftData[key];
    if (val is double) {
      return formatDecimal(val);
    }
    return nftData[key].toString();
  }
  return null;
}

String getExtensionFromMimeType(String mimeType) {
  switch (mimeType) {
    case 'image/jpeg':
      return 'jpg';
    case 'image/png':
      return 'png';
    case 'image/gif':
      return 'gif';
    case 'image/webp':
      return 'webp';
    case 'application/pdf':
      return 'pdf';
    case 'text/plain':
      return 'txt';
    case 'video/mp4':
      return 'mp4';
    case 'video/mpeg':
      return 'mpeg';
    case 'video/quicktime':
      return 'mov';
    default:
      return '';
  }
}

String? cleanPhoneNumber(String phoneNumber) {
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  if (cleanedNumber.length >= 10) {
    // Check if the number is valid
    if (cleanedNumber.length == 10) {
      // If it's a 10-digit number, add "+1" at the beginning
      cleanedNumber = '1$cleanedNumber';
    }
    return "+$cleanedNumber";
  }
  return null;
}

String formatDecimal(double number) {
  NumberFormat formatter = NumberFormat('#.##########'); // Adjust the number of '#' as needed
  String formatted = formatter.format(number);

  // Ensure at least one decimal place if it's an integer
  if (formatted.contains('.')) {
    formatted = formatted.replaceAll(RegExp(r'0*$'), '');
    formatted = formatted.replaceAll(RegExp(r'\.$'), '.0');
  } else {
    formatted = '$formatted.0';
  }

  return formatted;
}
