import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/remote_info/models/remote_info.dart';

class RemoteInfoService {
  static Future<RemoteInfo?> fetchInfo() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: Env.explorerApiBaseUrl)).get('/applications/');
      return RemoteInfo.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
