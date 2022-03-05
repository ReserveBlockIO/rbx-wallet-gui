import 'package:dart_ipify/dart_ipify.dart';
import 'package:dart_ping/dart_ping.dart';

class HealthService {
  Future<String> getIp() async {
    return await Ipify.ipv4();
  }

  Future<Stream<PingData>> pingPort([int port = 3338]) async {
    final ip = await getIp();
    final url = "$ip -p $port";
    final ping = Ping(url, count: 1);
    return ping.stream;
  }
}
