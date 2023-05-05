import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

class NetworkInspector {
  static attach(Dio dio) {
    if (!kDebugMode) return;

    dio.interceptors.add(
      AwesomeDioInterceptor(
        // Disabling headers and timeout would minimize the logging output.
        // Optional, defaults to true
        logRequestTimeout: false,
        logRequestHeaders: false,
        logResponseHeaders: false,

        // Optional, defaults to the 'log' function in the 'dart:developer' package.
        logger: debugPrint,
      ),
    );
  }
}
