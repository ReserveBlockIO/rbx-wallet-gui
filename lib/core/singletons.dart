import 'package:get_it/get_it.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

final singleton = GetIt.instance;

Future<void> initSingletons() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  singleton.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  singleton.registerSingleton<AppRouter>(AppRouter());
  singleton.registerSingleton<WebRouter>(WebRouter());

  singleton.registerLazySingleton<Storage>(
    () => StorageImplementation(),
  );
}
