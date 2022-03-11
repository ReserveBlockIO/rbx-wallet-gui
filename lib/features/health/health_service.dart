import 'package:dart_ipify/dart_ipify.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:rbx_wallet/core/env.dart';

class HealthService {
  Future<String> getIp() async {
    return await Ipify.ipv4();
  }

  Future<Stream<PingData>> pingPort() async {
    final ip = await getIp();
    final port = Env.validatorPort;

    final url = "$ip -p $port";
    final ping = Ping(url, count: 1);
    return ping.stream;
  }
}
