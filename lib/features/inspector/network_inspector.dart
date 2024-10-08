import 'package:dio/dio.dart';
// import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/foundation.dart';

class NetworkInspector {
  static attach(Dio dio) {
    if (!kDebugMode) return;

    // dio.interceptors.add(
    //   DioLoggingInterceptor(
    //     level: Level.body,
    //     compact: false,
    //   ),
    // );
  }
}
