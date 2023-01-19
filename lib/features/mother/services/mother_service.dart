import 'dart:convert';

import '../../../core/services/base_service.dart';
import '../models/mother_child.dart';

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

  Future<List<MotherChild>> getChildren() async {
    try {
      final data = await getText('/MothersKids');

      print(data);
      final items = jsonDecode(data);
      final List<MotherChild> children = [];
      for (final item in items) {
        children.add(MotherChild.fromJson(item));
      }
      return children;
    } catch (e) {
      print(e);
      return [];
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
      await postJson('/JoinMother', params: params);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> stopHost() async {
    try {
      await getText('/StopMother');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
