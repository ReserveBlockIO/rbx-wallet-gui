import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_router.gr.dart';
import 'core/components/boot_container.dart';
import 'core/components/centered_loader.dart';
import 'core/env.dart';
import 'core/providers/ready_provider.dart';
import 'core/providers/session_provider.dart';
import 'core/providers/web_session_provider.dart';
import 'core/singletons.dart';
import 'core/storage.dart';
import 'core/theme/app_theme.dart';
import 'core/web_router.gr.dart';
import 'features/encrypt/providers/password_required_provider.dart';
import 'features/encrypt/providers/wallet_is_encrypted_provider.dart';
import 'features/global_loader/global_loading_provider.dart';
import 'features/root/components/system_manager.dart';
import 'features/transactions/components/notification_overlay.dart';

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
    ref.read(passwordRequiredProvider.notifier);
    ref.read(walletIsEncryptedProvider.notifier);

    singleton<Storage>().setStringList(Storage.BURNED_NFT_IDS, []);
    singleton<Storage>().setStringList(Storage.TRANSFERRED_NFT_IDS, []);
    singleton<Storage>().setStringList(Storage.PENDING_ADNRS, []);

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
            NotificationOverlay(),
            if (ref.watch(globalLoadingProvider))
              Container(
                color: Colors.black54,
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "Loading...",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 72.0),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => ref.read(globalLoadingProvider.notifier).complete(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "[CLOSE]",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
          ],
        );
      },
      title: 'RBX Wallet',
    );
  }
}
