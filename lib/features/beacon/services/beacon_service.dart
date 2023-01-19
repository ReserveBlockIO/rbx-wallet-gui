import 'dart:convert';

import '../../../core/services/base_service.dart';
import '../models/beacon.dart';

class BeaconService extends BaseService {
  BeaconService() : super(apiBasePathOverride: "/bcapi/BCV1");

  Future<List<Beacon>> list() async {
    try {
      final response = await getText("/GetBeacons");
      final items = jsonDecode(response);

      final List<Beacon> beacons = [];
      for (final item in items) {
        beacons.add(Beacon.fromJson(item));
      }
      return beacons;
    } catch (e, st) {
      print(e);
      print(st);
      return [];
    }
  }

  Future<String?> add(String name, String ip, [int port = 0]) async {
    try {
      // final path = port != 0 ? "/AddBeacon/$name/$port/$ip" : "/AddBeacon/$name/$ip";
      final path = "/AddBeacon/$name/$port/$ip";

      final response = await getText(path, cleanPath: false);
      final data = jsonDecode(response);

      if (data['Result'] != null && data['Result'] == 'Success') {
        return null;
      }
      return data['Message'] ?? "A problem occurred";
    } catch (e) {
      print(e);
      return "A problem occurred";
    }
  }

  Future<String?> create({
    required String name,
    required int port,
    required bool isPrivate,
    required bool autoDelete,
    required int fileCacheDays,
  }) async {
    try {
      final url = '/CreateBeacon/$name/$isPrivate/$autoDelete/$fileCacheDays/$port';
      print(url);
      final response = await getText(url, cleanPath: false);
      final data = jsonDecode(response);

      if (data['Result'] != null && data['Result'] == 'Success') {
        return null;
      }
      return data['Message'] ?? "A problem occurred";
    } catch (e) {
      print(e);
      return "A problem occurred";
    }
  }

  Future<bool> delete(int id) async {
    try {
      await getText("/DeleteBeacon/$id", cleanPath: false);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
