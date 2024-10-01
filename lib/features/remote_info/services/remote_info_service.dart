// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:flutter/foundation.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/debug/debug_logger.dart';
import 'package:rbx_wallet/features/remote_info/models/remote_info.dart';

class RemoteInfoService {
  static Future<RemoteInfo?> fetchInfo() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: Env.explorerApiBaseUrl));

      if (!kIsWeb) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }

      final response = await dio.get('/applications/');
      return RemoteInfo.fromJson(response.data);
    } catch (e, st) {
      print(e);

      DebugLogger.log(e, st);

      return null;
    }
  }
}
