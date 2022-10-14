import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/components/boot_container.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/providers/ready_provider.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/root/components/system_manager.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

final GlobalKey<ScaffoldState> rootScaffoldKey = GlobalKey<ScaffoldState>();

GlobalKey<NavigatorState> rootNavigatorKey = Env.isWeb ? singleton<WebRouter>().navigatorKey : singleton<AppRouter>().navigatorKey;

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("App Build");

    if (kIsWeb) {
      ref.read(webSessionProvider.notifier);
      return const AppContainer();
    }
    ref.read(sessionProvider.notifier);

    singleton<Storage>().setStringList(Storage.BURNED_NFT_IDS, []);
    singleton<Storage>().setStringList(Storage.TRANSFERRED_NFT_IDS, []);

    return const AppSystemManager(child: AppContainer());
  }
}

class AppContainer extends ConsumerWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = singleton<AppRouter>();
    final webRouter = singleton<WebRouter>();

    final router = Env.isWeb ? webRouter : appRouter;

    return MaterialApp.router(
      restorationScopeId: "app",
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: AppTheme.dark().themeData,
      routeInformationParser: router.defaultRouteParser(),
      // routerDelegate: AutoRouterDelegate(
      //   router,
      //   navigatorObservers: () => [AutoRouteObserver()],
      // ),
      routerDelegate: router.delegate(),
      builder: (context, widget) {
        if (!ref.watch(readyProvider)) {
          if (kIsWeb) {
            return const CenteredLoader();
          }

          return const Material(
            child: Center(child: BootContainer()),
          );
        }

        return Stack(
          children: [
            widget!,
            if (ref.watch(globalLoadingProvider))
              Container(
                color: Colors.black54,
                child: Center(
                  child: Text(
                    "Loading...",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
          ],
        );
      },
      title: 'RBX Wallet',
    );
  }
}
