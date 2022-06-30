// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i8;
import 'package:rbx_wallet/features/auth/screens/web_auth_screen.dart' as _i3;
import 'package:rbx_wallet/features/home/screens/web_home_screen.dart' as _i4;
import 'package:rbx_wallet/features/nft/screens/web_nft_detail_screen.dart'
    as _i7;
import 'package:rbx_wallet/features/nft/screens/web_nft_list_screen.dart'
    as _i6;
import 'package:rbx_wallet/features/root/web_dashboard_container.dart' as _i2;
import 'package:rbx_wallet/features/send/screens/web_send_screen.dart' as _i5;

class WebRouter extends _i1.RootStackRouter {
  WebRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WebAuthRouter.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    WebDashboardContainerRoute.name: (routeData) {
      final args = routeData.argsAs<WebDashboardContainerRouteArgs>(
          orElse: () => const WebDashboardContainerRouteArgs());
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.WebDashboardContainer(key: args.key));
    },
    WebAuthScreenRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.WebAuthScreen());
    },
    WebHomeTabRouter.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    WebSendTabRouter.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    WebNftTabRouter.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    WebHomeScreenRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.WebHomeScreen());
    },
    WebSendScreenRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.WebSendScreen());
    },
    WebNftListScreenRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.WebNftListScreen());
    },
    WebNftDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebNftDetailScreenRouteArgs>(
          orElse: () => WebNftDetailScreenRouteArgs(
              identifier: pathParams.getString('identifier')));
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.WebNftDetailScreen(
              key: args.key, identifier: args.identifier));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: 'dashboard', fullMatch: true),
        _i1.RouteConfig(WebAuthRouter.name, path: '', children: [
          _i1.RouteConfig(WebAuthScreenRoute.name,
              path: '', parent: WebAuthRouter.name)
        ]),
        _i1.RouteConfig(WebDashboardContainerRoute.name,
            path: 'dashboard',
            children: [
              _i1.RouteConfig('#redirect',
                  path: '',
                  parent: WebDashboardContainerRoute.name,
                  redirectTo: 'home',
                  fullMatch: true),
              _i1.RouteConfig(WebHomeTabRouter.name,
                  path: 'home',
                  parent: WebDashboardContainerRoute.name,
                  children: [
                    _i1.RouteConfig(WebHomeScreenRoute.name,
                        path: '', parent: WebHomeTabRouter.name)
                  ]),
              _i1.RouteConfig(WebSendTabRouter.name,
                  path: 'send',
                  parent: WebDashboardContainerRoute.name,
                  children: [
                    _i1.RouteConfig(WebSendScreenRoute.name,
                        path: '', parent: WebSendTabRouter.name)
                  ]),
              _i1.RouteConfig(WebNftTabRouter.name,
                  path: 'nfts',
                  parent: WebDashboardContainerRoute.name,
                  children: [
                    _i1.RouteConfig(WebNftListScreenRoute.name,
                        path: '', parent: WebNftTabRouter.name),
                    _i1.RouteConfig(WebNftDetailScreenRoute.name,
                        path: 'detail/:identifier',
                        parent: WebNftTabRouter.name)
                  ])
            ]),
        _i1.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebAuthRouter extends _i1.PageRouteInfo<void> {
  const WebAuthRouter({List<_i1.PageRouteInfo>? children})
      : super(WebAuthRouter.name, path: '', initialChildren: children);

  static const String name = 'WebAuthRouter';
}

/// generated route for
/// [_i2.WebDashboardContainer]
class WebDashboardContainerRoute
    extends _i1.PageRouteInfo<WebDashboardContainerRouteArgs> {
  WebDashboardContainerRoute({_i8.Key? key, List<_i1.PageRouteInfo>? children})
      : super(WebDashboardContainerRoute.name,
            path: 'dashboard',
            args: WebDashboardContainerRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'WebDashboardContainerRoute';
}

class WebDashboardContainerRouteArgs {
  const WebDashboardContainerRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'WebDashboardContainerRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.WebAuthScreen]
class WebAuthScreenRoute extends _i1.PageRouteInfo<void> {
  const WebAuthScreenRoute() : super(WebAuthScreenRoute.name, path: '');

  static const String name = 'WebAuthScreenRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebHomeTabRouter extends _i1.PageRouteInfo<void> {
  const WebHomeTabRouter({List<_i1.PageRouteInfo>? children})
      : super(WebHomeTabRouter.name, path: 'home', initialChildren: children);

  static const String name = 'WebHomeTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebSendTabRouter extends _i1.PageRouteInfo<void> {
  const WebSendTabRouter({List<_i1.PageRouteInfo>? children})
      : super(WebSendTabRouter.name, path: 'send', initialChildren: children);

  static const String name = 'WebSendTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebNftTabRouter extends _i1.PageRouteInfo<void> {
  const WebNftTabRouter({List<_i1.PageRouteInfo>? children})
      : super(WebNftTabRouter.name, path: 'nfts', initialChildren: children);

  static const String name = 'WebNftTabRouter';
}

/// generated route for
/// [_i4.WebHomeScreen]
class WebHomeScreenRoute extends _i1.PageRouteInfo<void> {
  const WebHomeScreenRoute() : super(WebHomeScreenRoute.name, path: '');

  static const String name = 'WebHomeScreenRoute';
}

/// generated route for
/// [_i5.WebSendScreen]
class WebSendScreenRoute extends _i1.PageRouteInfo<void> {
  const WebSendScreenRoute() : super(WebSendScreenRoute.name, path: '');

  static const String name = 'WebSendScreenRoute';
}

/// generated route for
/// [_i6.WebNftListScreen]
class WebNftListScreenRoute extends _i1.PageRouteInfo<void> {
  const WebNftListScreenRoute() : super(WebNftListScreenRoute.name, path: '');

  static const String name = 'WebNftListScreenRoute';
}

/// generated route for
/// [_i7.WebNftDetailScreen]
class WebNftDetailScreenRoute
    extends _i1.PageRouteInfo<WebNftDetailScreenRouteArgs> {
  WebNftDetailScreenRoute({_i8.Key? key, required String identifier})
      : super(WebNftDetailScreenRoute.name,
            path: 'detail/:identifier',
            args: WebNftDetailScreenRouteArgs(key: key, identifier: identifier),
            rawPathParams: {'identifier': identifier});

  static const String name = 'WebNftDetailScreenRoute';
}

class WebNftDetailScreenRouteArgs {
  const WebNftDetailScreenRouteArgs({this.key, required this.identifier});

  final _i8.Key? key;

  final String identifier;

  @override
  String toString() {
    return 'WebNftDetailScreenRouteArgs{key: $key, identifier: $identifier}';
  }
}
