import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/root/components/system_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final GlobalKey<ScaffoldState> rootScaffoldKey = GlobalKey<ScaffoldState>();

GlobalKey<NavigatorState> rootNavigatorKey =
    singleton<AppRouter>().navigatorKey;

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = singleton<AppRouter>();

    return AppSystemManager(
      child: MaterialApp.router(
        restorationScopeId: "app",
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        theme: AppTheme.dark().themeData,
        routeInformationParser:
            appRouter.defaultRouteParser(includePrefixMatches: true),
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        builder: (context, widget) {
          if (!ref.watch(sessionProvider).ready) {
            return const CenteredLoader();
          }

          return widget!;

          // return ResponsiveWrapper.builder(
          //   BouncingScrollWrapper.builder(context, widget!),
          //   defaultScale: true,
          //   // breakpoints: BreakPoints.breakpoints,
          // );
        },
        title: 'RBX',
      ),
    );
  }
}
