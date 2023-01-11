import 'package:rbx_wallet/core/services/base_service.dart';

class MotherData {
  final String name;
  final String password;

  const MotherData(this.name, this.password);
}

class MotherService extends BaseService {
  Future<MotherData?> getHost() async {
    try {
      final data = await getJson('/GetMother');

      if (data.containsKey("Name") && data.containsKey("Password")) {
        return MotherData(data['Name'], data['Password']);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> createHost(String name, String password) async {
    final params = {
      'Name': name,
      'Password': password,
    };
    try {
      final data = await postJson('/StartMother', params: params);
      print(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> joinHost(String ipAddress, String password) async {
    final params = {
      'IPAddress': ipAddress,
      'Password': password,
    };
    try {
      final data = await postJson('/JoinMother', params: params);
      print("JOIN:");
      print(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> stopHost() async {
    try {
      final data = await getText('/StopMother');
      print("STOP:");
      print(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
