import 'package:flutter/foundation.dart';
import 'app_constants.dart';

abstract class ApiTokenManager {
  String token = "";

  void set(String value);
  String get();
}

class ApiTokenManagerImplementation extends ApiTokenManager {
  @override
  void set(String value) {
    token = kDebugMode ? DEV_API_TOKEN : value;
  }

  @override
  String get() {
    return kDebugMode ? DEV_API_TOKEN : token;
  }
}
