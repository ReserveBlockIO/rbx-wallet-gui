import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_token_manager.dart';
import 'app_router.gr.dart';
import 'storage.dart';
import 'web_router.gr.dart';

final singleton = GetIt.instance;

Future<void> initSingletons() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  singleton.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  singleton.registerSingleton<AppRouter>(AppRouter());
  singleton.registerSingleton<WebRouter>(WebRouter());
  singleton.registerSingleton<ApiTokenManager>(ApiTokenManagerImplementation());
  singleton.registerLazySingleton<Storage>(
    () {
      if (kIsWeb) {
        return StorageWebImplementation();
      }
      return StorageImplementation();
    },
  );
}
