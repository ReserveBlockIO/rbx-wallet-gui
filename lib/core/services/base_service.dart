import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rbx_wallet/core/api_token_manager.dart';
import 'package:rbx_wallet/core/singletons.dart';

import '../../features/inspector/network_inspector.dart';
import '../env.dart';

class BaseService {
  final String? hostOverride;
  final String? apiBasePathOverride;

  BaseService({
    this.apiBasePathOverride,
    this.hostOverride,
  });

  Map<String, dynamic> _headers([bool auth = true, bool json = false]) {
    final token = singleton<ApiTokenManager>().get();

    return json
        ? {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json",
            ...!kIsWeb && !Env.isTestNet ? {'apitoken': token} : {},
          }
        : {
            ...!kIsWeb && !Env.isTestNet ? {'apitoken': token} : {},
          };
  }

  BaseOptions _options({
    bool auth = true,
    bool json = false,
    int timeout = 30000,
  }) {
    String host = Env.apiBaseUrl;
    if (hostOverride != null) {
      host = hostOverride!;
    }

    final baseUrl = apiBasePathOverride == null ? host : host.replaceAll("/api/V1", apiBasePathOverride!);
    return BaseOptions(
      baseUrl: baseUrl,
      headers: _headers(auth, json),
      connectTimeout: 10000,
      receiveTimeout: timeout,
    );
  }

  String _cleanPath(String path) {
    if (!path.endsWith("/")) {
      return "$path/";
    }

    return path;
  }

  Future<String> getText(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
    bool cleanPath = true,
    int timeout = 30000,
    bool inspect = false,
    bool preventError = false,
  }) async {
    try {
      final dio = Dio(_options(auth: auth, timeout: timeout));
      if (!kIsWeb) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }

      if (inspect) {
        NetworkInspector.attach(dio);
      }
      final p = cleanPath ? _cleanPath(path) : path;
      var response = await dio.get(
        p,
        queryParameters: params,
      );

      if (response.data != null) {
        return response.data.toString();
      }

      return response.toString();
    } catch (e, st) {
      print(e);
      print(st);
      if (!preventError) {
        rethrow;
      }
      return "";
    }
  }

  Future<Map<String, dynamic>> getJson(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
    bool cleanPath = true,
    bool responseIsJson = false,
    int timeout = 30000,
    bool inspect = false,
  }) async {
    try {
      final dio = Dio(_options(auth: auth, timeout: timeout));
      if (!kIsWeb) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      if (inspect) {
        NetworkInspector.attach(dio);
      }
      final url = cleanPath ? _cleanPath(path) : path;
      var response = await dio.get(
        url,
        queryParameters: params,
      );

      if (responseIsJson) {
        return {'data': response.data};
      }

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return jsonDecode(response.data);
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postJson(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
    bool responseIsJson = false,
    int timeout = 30000,
    bool inspect = false,
    bool cleanPath = true,
  }) async {
    try {
      final dio = Dio(_options(auth: auth, json: true, timeout: timeout));
      if (!kIsWeb) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      if (inspect) {
        NetworkInspector.attach(dio);
      }
      var response = await dio.post(
        cleanPath ? _cleanPath(path) : path,
        data: params,
      );

      final data = responseIsJson ? response.data : jsonDecode(response.toString());

      return {'data': data};

      // if (response.statusCode == 204) {
      //   return {};
      // }
      // if (response.data == null) {
      //   return {};
      // }

      // if (response.data.runtimeType == String) {
      //   return {};
      // }
      // return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> patchJson(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
    bool responseIsJson = false,
    int timeout = 30000,
    bool inspect = false,
    bool cleanPath = true,
  }) async {
    try {
      final dio = Dio(_options(auth: auth, json: true, timeout: timeout));
      if (!kIsWeb) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      if (inspect) {
        NetworkInspector.attach(dio);
      }
      var response = await dio.patch(
        cleanPath ? _cleanPath(path) : path,
        data: params,
      );

      final data = responseIsJson ? response.data : jsonDecode(response.toString());

      return {'data': data};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteJson(
    String path, {
    bool auth = true,
    bool responseIsJson = false,
    int timeout = 30000,
    bool inspect = false,
    bool cleanPath = true,
  }) async {
    try {
      final dio = Dio(_options(auth: auth, json: true, timeout: timeout));
      if (!kIsWeb) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }
      if (inspect) {
        NetworkInspector.attach(dio);
      }
      var response = await dio.delete(
        cleanPath ? _cleanPath(path) : path,
      );

      final data = responseIsJson ? response.data : jsonDecode(response.toString());

      return {'data': data};
    } catch (e) {
      rethrow;
    }
  }

  // Future<Map<String, dynamic>> putHttp(
  //   String path, {
  //   Map<String, dynamic> params = const {},
  //   bool auth = true,
  // }) async {
  //   try {
  //     var response = await Dio(_options(auth: auth)).put(
  //       _cleanPath(path),
  //       data: params,
  //     );
  //     if (response.statusCode == 204) {
  //       return {};
  //     }
  //     if (response.data == null) {
  //       return {};
  //     }
  //     if (response.data.runtimeType == String) {
  //       return {};
  //     }
  //     return response.data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<Map<String, dynamic>> deleteHttp(
  //   String path, {
  //   bool auth = true,
  // }) async {
  //   try {
  //     var response = await Dio(_options(auth: auth)).delete(
  //       _cleanPath(path),
  //     );

  //     if (response.statusCode == 204) {
  //       return {};
  //     }
  //     if (response.data == null) {
  //       return {};
  //     }
  //     if (response.data.runtimeType == String) {
  //       return {};
  //     }

  //     return response.data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Map<String, dynamic>> postFormData(
    String path, {
    required FormData data,
    int timeout = 30000,
  }) async {
    final dio = Dio(_options(json: false, auth: false, timeout: timeout));
    if (!kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    var response = await dio.post(
      _cleanPath(path),
      data: data,
    );

    if (response.statusCode == 204) {
      return {};
    }
    if (response.data == null) {
      return {};
    }
    if (response.data.runtimeType == String) {
      return jsonDecode(response.data);
    }

    return response.data;
  }
}
