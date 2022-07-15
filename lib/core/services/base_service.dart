import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/env.dart';

class BaseService {
  final String? hostOverride;
  final String? apiBasePathOverride;

  BaseService({
    this.apiBasePathOverride,
    this.hostOverride,
  });

  Map<String, dynamic> _headers([bool auth = true, bool json = false]) {
    return json
        ? {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.acceptHeader: "application/json",
          }
        : {};
  }

  BaseOptions _options({
    bool auth = true,
    bool json = false,
  }) {
    String host = Env.apiBaseUrl;
    if (hostOverride != null) {
      host = hostOverride!;
    }

    final baseUrl = apiBasePathOverride == null ? host : host.replaceAll("/api/V1", apiBasePathOverride!);
    return BaseOptions(baseUrl: baseUrl, headers: _headers(auth, json));
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
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).get(
        cleanPath ? _cleanPath(path) : path,
        queryParameters: params,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getJson(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
    bool cleanPath = true,
  }) async {
    try {
      final url = cleanPath ? _cleanPath(path) : path;
      var response = await Dio(_options(auth: auth)).get(
        url,
        queryParameters: params,
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
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postJson(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
    bool responseIsJson = false,
  }) async {
    try {
      var response = await Dio(_options(auth: auth, json: true)).post(
        _cleanPath(path),
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

  // Future<Map<String, dynamic>> patchHttp(
  //   String path, {
  //   Map<String, dynamic> params = const {},
  //   bool auth = true,
  // }) async {
  //   try {
  //     var response = await Dio(_options(auth: auth)).patch(
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
  }) async {
    var response = await Dio(_options(json: false, auth: false)).post(
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
