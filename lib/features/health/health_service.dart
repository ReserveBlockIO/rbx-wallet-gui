import 'package:dart_ipify/dart_ipify.dart';
import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/env.dart';

class HealthService {
  Future<String> getIp() async {
    return await Ipify.ipv4();
  }

  Future<bool> pingPort() async {
    final ip = await getIp();
    final port = Env.validatorPort;

    final response = await Dio(BaseOptions(baseUrl: Env.portCheckerUrl))
        .get('/', queryParameters: {'host': ip, 'port': port});

    if (response.data['success'] == true) {
      return true;
    }

    return false;
  }
}
