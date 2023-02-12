import 'dart:io';
import 'package:rbx_wallet/utils/files.dart';

class DebugLogger {
  static Future<void> log(Object error, StackTrace stackTrace) async {
    final path = await dbPath();
    final debugOutputPath = "$path/Databases/debug-gui.txt";
    if (!File(debugOutputPath).existsSync()) {
      File(debugOutputPath).createSync();
    }
    final currentLines = await File(debugOutputPath).readAsLines();
    final newLines = [error.toString(), stackTrace.toString()];
    final linesToWrite = [...currentLines, "", "----", "", ...newLines];
    File(debugOutputPath).writeAsStringSync(linesToWrite.join("\n"));
  }
}
