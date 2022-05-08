import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/env.dart';

class BaseService {
  final String? apiBasePathOverride;

  BaseService({this.apiBasePathOverride});

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
    final baseUrl = apiBasePathOverride == null
        ? Env.apiBaseUrl
        : Env.apiBaseUrl.replaceAll("/api/V1", apiBasePathOverride!);
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
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).get(
        _cleanPath(path),
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
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).get(
        _cleanPath(path),
        queryParameters: params,
      );

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
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
  }) async {
    try {
      var response = await Dio(_options(auth: auth, json: true)).post(
        _cleanPath(path),
        data: params,
      );

      return jsonDecode(response.toString());

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
}
