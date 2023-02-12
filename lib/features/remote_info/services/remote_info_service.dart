import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/remote_info/models/remote_info.dart';
import 'package:rbx_wallet/utils/files.dart';

class RemoteInfoService {
  static Future<RemoteInfo?> fetchInfo() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: Env.explorerApiBaseUrl)).get('/applications/');
      return RemoteInfo.fromJson(response.data);
    } catch (e, st) {
      print(e);

      final path = await dbPath();
      final debugOutputPath = "$path/Databases/debug-gui.txt";
      print(debugOutputPath);

      if (!File(debugOutputPath).existsSync()) {
        File(debugOutputPath).createSync();
      }

      final currentLines = await File(debugOutputPath).readAsLines();

      final newLines = [e.toString(), st.toString()];

      final linesToWrite = [...currentLines, "", "----", "", ...newLines];
      print(debugOutputPath);

      File(debugOutputPath).writeAsStringSync(linesToWrite.join("\n"));

      return null;
    }
  }
}
