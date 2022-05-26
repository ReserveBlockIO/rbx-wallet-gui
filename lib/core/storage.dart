// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  static const CURRENT_WALLET_ADDRESS_KEY = "CURRENT_WALLET_ADDRESS_KEY";
  static const DELETED_WALLETS_KEY = "DELETED_WALLETS";
  static const RENAMED_WALLETS_KEY = "RENAMED_WALLETS";
  static const LOCAL_SMART_CONTRACTS = "LOCAL_SMART_CONTRACTS2";
  static const MANAGABLE_NFT_IDS = "MANAGABLE_NFT_IDS";

  bool isInitialized = false;

  Future<void> init();
  void remove(String key);

  String? getString(String key);
  void setString(String key, String value);

  bool? getBool(String key);
  void setBool(String key, bool value);

  int? getInt(String key);
  void setInt(String key, int value);

  Map<String, dynamic>? getMap(String key);
  void setMap(String key, Map<String, dynamic> value);

  List<dynamic>? getList(String key);
  void setList(String key, List<dynamic> value);

  List<String>? getStringList(String key);
  void setStringList(String key, List<String> value);
}

class StorageImplementation extends Storage {
  late final SharedPreferences _instance;

  StorageImplementation() {
    init();
  }

  @override
  Future<void> init() async {
    _instance = singleton<SharedPreferences>();
    isInitialized = true;
  }

  String _buildKey(String key) => "${Env.storagePrefix}_$key";

  @override
  void remove(String key) => _instance.remove(_buildKey(key));

  @override
  String? getString(String key) => _instance.getString(_buildKey(key));
  @override
  void setString(String key, String value) =>
      _instance.setString(_buildKey(key), value);

  @override
  bool? getBool(String key) => _instance.getBool(_buildKey(key));
  @override
  void setBool(String key, bool value) =>
      _instance.setBool(_buildKey(key), value);

  @override
  int? getInt(String key) => _instance.getInt(_buildKey(key));
  @override
  void setInt(String key, int value) => _instance.setInt(_buildKey(key), value);

  @override
  Map<String, dynamic>? getMap(String key) {
    final str = _instance.getString(key);
    if (str == null) {
      return null;
    }
    return jsonDecode(str);
  }

  @override
  void setMap(String key, Map<String, dynamic> value) {
    final str = jsonEncode(value);
    _instance.setString(key, str);
  }

  @override
  List<dynamic>? getList(String key) {
    final str = _instance.getString(key);
    if (str == null) {
      return null;
    }
    return jsonDecode(str);
  }

  @override
  void setList(String key, List<dynamic> value) {
    final str = jsonEncode(value);
    _instance.setString(key, str);
  }

  @override
  List<String>? getStringList(String key) {
    final str = _instance.getString(key);

    if (str == null) {
      return null;
    }
    final List<dynamic> data = jsonDecode(str);

    final List<String> items = data.map((item) => item.toString()).toList();

    return items;
  }

  @override
  void setStringList(String key, List<dynamic> value) {
    final str = jsonEncode(value);
    _instance.setString(key, str);
  }
}
