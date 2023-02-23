// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i22;
import 'package:rbx_wallet/features/adnr/screens/web_adnr_screen.dart' as _i14;
import 'package:rbx_wallet/features/auth/screens/web_auth_screen.dart' as _i5;
import 'package:rbx_wallet/features/dsts/screens/create_store_screen.dart'
    as _i18;
import 'package:rbx_wallet/features/dsts/screens/web_dst_screen.dart' as _i17;
import 'package:rbx_wallet/features/home/screens/web_home_screen.dart' as _i6;
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart' as _i13;
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart' as _i12;
import 'package:rbx_wallet/features/receive/screens/web_receive_screen.dart'
    as _i9;
import 'package:rbx_wallet/features/root/web_dashboard_container.dart' as _i4;
import 'package:rbx_wallet/features/send/screens/web_prefilled_send_screen.dart'
    as _i8;
import 'package:rbx_wallet/features/send/screens/web_send_screen.dart' as _i7;
import 'package:rbx_wallet/features/smart_contracts/screens/web_create_smart_contract_screen.dart'
    as _i16;
import 'package:rbx_wallet/features/smart_contracts/screens/web_smart_contract_landing_screen.dart'
    as _i15;
import 'package:rbx_wallet/features/store/screens/create_listing_screen.dart'
    as _i20;
import 'package:rbx_wallet/features/store/screens/store_collection_screen.dart'
    as _i2;
import 'package:rbx_wallet/features/store/screens/store_listing_screen.dart'
    as _i3;
import 'package:rbx_wallet/features/store/screens/store_screen.dart' as _i19;
import 'package:rbx_wallet/features/transactions/screens/web_transaction_detail_screen.dart'
    as _i11;
import 'package:rbx_wallet/features/transactions/screens/web_transactions_screen.dart'
    as _i10;

class WebRouter extends _i21.RootStackRouter {
  WebRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    WebAuthRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    StoreCollectionScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<StoreCollectionScreenRouteArgs>(
          orElse: () => StoreCollectionScreenRouteArgs(
              slug: pathParams.getString('slug')));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.StoreCollectionScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    StoreListingScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<StoreListingScreenRouteArgs>(
          orElse: () =>
              StoreListingScreenRouteArgs(slug: pathParams.getString('slug')));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.StoreListingScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    WebDashboardContainerRoute.name: (routeData) {
      final args = routeData.argsAs<WebDashboardContainerRouteArgs>(
          orElse: () => const WebDashboardContainerRouteArgs());
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.WebDashboardContainer(key: args.key),
      );
    },
    WebAuthScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.WebAuthScreen(),
      );
    },
    WebHomeTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebSendTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebReceiveTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebTransactionsTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebNftTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebAdnrTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebSmartContractTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebDstTabRouter.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebHomeScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.WebHomeScreen(),
      );
    },
    WebSendScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.WebSendScreen(),
      );
    },
    WebPrefilledSendScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebPrefilledSendScreenRouteArgs>(
          orElse: () => WebPrefilledSendScreenRouteArgs(
                toAddress: pathParams.getString('toAddress'),
                amount: pathParams.getDouble('amount'),
              ));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.WebPrefilledSendScreen(
          key: args.key,
          toAddress: args.toAddress,
          amount: args.amount,
        ),
      );
    },
    WebReceiveScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.WebReceiveScreen(),
      );
    },
    WebTransactionScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.WebTransactionScreen(),
      );
    },
    WebTransactionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebTransactionDetailScreenRouteArgs>(
          orElse: () => WebTransactionDetailScreenRouteArgs(
              hash: pathParams.getString('hash')));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.WebTransactionDetailScreen(
          key: args.key,
          hash: args.hash,
        ),
      );
    },
    NftListScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.NftListScreen(),
      );
    },
    NftDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NftDetailScreenRouteArgs>(
          orElse: () =>
              NftDetailScreenRouteArgs(id: pathParams.getString('id')));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.NftDetailScreen(
          id: args.id,
          key: args.key,
          fromCreator: args.fromCreator,
        ),
      );
    },
    WebAdnrScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.WebAdnrScreen(),
      );
    },
    WebSmartContractLandingScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.WebSmartContractLandingScreen(),
      );
    },
    WebCreateSmartContractScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.WebCreateSmartContractScreen(),
      );
    },
    WebDstScreenRoute.name: (routeData) {
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.WebDstScreen(),
      );
    },
    CreateStoreScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateStoreScreenRouteArgs>(
          orElse: () => CreateStoreScreenRouteArgs(
              accountId: pathParams.getString('accountId')));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.CreateStoreScreen(
          key: args.key,
          accountId: args.accountId,
        ),
      );
    },
    StoreScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<StoreScreenRouteArgs>(
          orElse: () =>
              StoreScreenRouteArgs(slug: pathParams.getString('slug')));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i19.StoreScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    CreateListingScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateListingScreenRouteArgs>(
          orElse: () => CreateListingScreenRouteArgs(
              storeId: pathParams.getInt('storeId')));
      return _i21.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i20.CreateListingScreen(
          key: args.key,
          storeId: args.storeId,
        ),
      );
    },
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i21.RouteConfig(
          WebAuthRouter.name,
          path: '',
          children: [
            _i21.RouteConfig(
              WebAuthScreenRoute.name,
              path: '',
              parent: WebAuthRouter.name,
            )
          ],
        ),
        _i21.RouteConfig(
          StoreCollectionScreenRoute.name,
          path: 'store/collection/:slug',
        ),
        _i21.RouteConfig(
          StoreListingScreenRoute.name,
          path: 'store/auction/:slug',
        ),
        _i21.RouteConfig(
          WebDashboardContainerRoute.name,
          path: 'dashboard',
          children: [
            _i21.RouteConfig(
              WebHomeTabRouter.name,
              path: 'home',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  WebHomeScreenRoute.name,
                  path: '',
                  parent: WebHomeTabRouter.name,
                )
              ],
            ),
            _i21.RouteConfig(
              WebSendTabRouter.name,
              path: 'send',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  WebSendScreenRoute.name,
                  path: '',
                  parent: WebSendTabRouter.name,
                ),
                _i21.RouteConfig(
                  WebPrefilledSendScreenRoute.name,
                  path: ':toAddress/:amount',
                  parent: WebSendTabRouter.name,
                ),
              ],
            ),
            _i21.RouteConfig(
              WebReceiveTabRouter.name,
              path: 'receive',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  WebReceiveScreenRoute.name,
                  path: '',
                  parent: WebReceiveTabRouter.name,
                )
              ],
            ),
            _i21.RouteConfig(
              WebTransactionsTabRouter.name,
              path: 'transactions',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  WebTransactionScreenRoute.name,
                  path: '',
                  parent: WebTransactionsTabRouter.name,
                ),
                _i21.RouteConfig(
                  WebTransactionDetailScreenRoute.name,
                  path: 'detail/:hash',
                  parent: WebTransactionsTabRouter.name,
                ),
              ],
            ),
            _i21.RouteConfig(
              WebNftTabRouter.name,
              path: 'nfts',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  NftListScreenRoute.name,
                  path: '',
                  parent: WebNftTabRouter.name,
                ),
                _i21.RouteConfig(
                  NftDetailScreenRoute.name,
                  path: 'detail/:id',
                  parent: WebNftTabRouter.name,
                ),
              ],
            ),
            _i21.RouteConfig(
              WebAdnrTabRouter.name,
              path: 'adnrs',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  WebAdnrScreenRoute.name,
                  path: '',
                  parent: WebAdnrTabRouter.name,
                )
              ],
            ),
            _i21.RouteConfig(
              WebSmartContractTabRouter.name,
              path: 'smart-contract',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  WebSmartContractLandingScreenRoute.name,
                  path: '',
                  parent: WebSmartContractTabRouter.name,
                ),
                _i21.RouteConfig(
                  WebCreateSmartContractScreenRoute.name,
                  path: 'create',
                  parent: WebSmartContractTabRouter.name,
                ),
              ],
            ),
            _i21.RouteConfig(
              WebDstTabRouter.name,
              path: 'dst',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i21.RouteConfig(
                  WebDstScreenRoute.name,
                  path: '',
                  parent: WebDstTabRouter.name,
                ),
                _i21.RouteConfig(
                  CreateStoreScreenRoute.name,
                  path: 'create/:accountId',
                  parent: WebDstTabRouter.name,
                ),
                _i21.RouteConfig(
                  StoreScreenRoute.name,
                  path: 'store/:slug',
                  parent: WebDstTabRouter.name,
                ),
                _i21.RouteConfig(
                  CreateListingScreenRoute.name,
                  path: 'store/:storeId/create-listing',
                  parent: WebDstTabRouter.name,
                ),
              ],
            ),
          ],
        ),
        _i21.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebAuthRouter extends _i21.PageRouteInfo<void> {
  const WebAuthRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebAuthRouter.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'WebAuthRouter';
}

/// generated route for
/// [_i2.StoreCollectionScreen]
class StoreCollectionScreenRoute
    extends _i21.PageRouteInfo<StoreCollectionScreenRouteArgs> {
  StoreCollectionScreenRoute({
    _i22.Key? key,
    required String slug,
  }) : super(
          StoreCollectionScreenRoute.name,
          path: 'store/collection/:slug',
          args: StoreCollectionScreenRouteArgs(
            key: key,
            slug: slug,
          ),
          rawPathParams: {'slug': slug},
        );

  static const String name = 'StoreCollectionScreenRoute';
}

class StoreCollectionScreenRouteArgs {
  const StoreCollectionScreenRouteArgs({
    this.key,
    required this.slug,
  });

  final _i22.Key? key;

  final String slug;

  @override
  String toString() {
    return 'StoreCollectionScreenRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i3.StoreListingScreen]
class StoreListingScreenRoute
    extends _i21.PageRouteInfo<StoreListingScreenRouteArgs> {
  StoreListingScreenRoute({
    _i22.Key? key,
    required String slug,
  }) : super(
          StoreListingScreenRoute.name,
          path: 'store/auction/:slug',
          args: StoreListingScreenRouteArgs(
            key: key,
            slug: slug,
          ),
          rawPathParams: {'slug': slug},
        );

  static const String name = 'StoreListingScreenRoute';
}

class StoreListingScreenRouteArgs {
  const StoreListingScreenRouteArgs({
    this.key,
    required this.slug,
  });

  final _i22.Key? key;

  final String slug;

  @override
  String toString() {
    return 'StoreListingScreenRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i4.WebDashboardContainer]
class WebDashboardContainerRoute
    extends _i21.PageRouteInfo<WebDashboardContainerRouteArgs> {
  WebDashboardContainerRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          WebDashboardContainerRoute.name,
          path: 'dashboard',
          args: WebDashboardContainerRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WebDashboardContainerRoute';
}

class WebDashboardContainerRouteArgs {
  const WebDashboardContainerRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'WebDashboardContainerRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.WebAuthScreen]
class WebAuthScreenRoute extends _i21.PageRouteInfo<void> {
  const WebAuthScreenRoute()
      : super(
          WebAuthScreenRoute.name,
          path: '',
        );

  static const String name = 'WebAuthScreenRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebHomeTabRouter extends _i21.PageRouteInfo<void> {
  const WebHomeTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebHomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'WebHomeTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebSendTabRouter extends _i21.PageRouteInfo<void> {
  const WebSendTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebSendTabRouter.name,
          path: 'send',
          initialChildren: children,
        );

  static const String name = 'WebSendTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebReceiveTabRouter extends _i21.PageRouteInfo<void> {
  const WebReceiveTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebReceiveTabRouter.name,
          path: 'receive',
          initialChildren: children,
        );

  static const String name = 'WebReceiveTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebTransactionsTabRouter extends _i21.PageRouteInfo<void> {
  const WebTransactionsTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebTransactionsTabRouter.name,
          path: 'transactions',
          initialChildren: children,
        );

  static const String name = 'WebTransactionsTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebNftTabRouter extends _i21.PageRouteInfo<void> {
  const WebNftTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebNftTabRouter.name,
          path: 'nfts',
          initialChildren: children,
        );

  static const String name = 'WebNftTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebAdnrTabRouter extends _i21.PageRouteInfo<void> {
  const WebAdnrTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebAdnrTabRouter.name,
          path: 'adnrs',
          initialChildren: children,
        );

  static const String name = 'WebAdnrTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebSmartContractTabRouter extends _i21.PageRouteInfo<void> {
  const WebSmartContractTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebSmartContractTabRouter.name,
          path: 'smart-contract',
          initialChildren: children,
        );

  static const String name = 'WebSmartContractTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebDstTabRouter extends _i21.PageRouteInfo<void> {
  const WebDstTabRouter({List<_i21.PageRouteInfo>? children})
      : super(
          WebDstTabRouter.name,
          path: 'dst',
          initialChildren: children,
        );

  static const String name = 'WebDstTabRouter';
}

/// generated route for
/// [_i6.WebHomeScreen]
class WebHomeScreenRoute extends _i21.PageRouteInfo<void> {
  const WebHomeScreenRoute()
      : super(
          WebHomeScreenRoute.name,
          path: '',
        );

  static const String name = 'WebHomeScreenRoute';
}

/// generated route for
/// [_i7.WebSendScreen]
class WebSendScreenRoute extends _i21.PageRouteInfo<void> {
  const WebSendScreenRoute()
      : super(
          WebSendScreenRoute.name,
          path: '',
        );

  static const String name = 'WebSendScreenRoute';
}

/// generated route for
/// [_i8.WebPrefilledSendScreen]
class WebPrefilledSendScreenRoute
    extends _i21.PageRouteInfo<WebPrefilledSendScreenRouteArgs> {
  WebPrefilledSendScreenRoute({
    _i22.Key? key,
    required String toAddress,
    required double amount,
  }) : super(
          WebPrefilledSendScreenRoute.name,
          path: ':toAddress/:amount',
          args: WebPrefilledSendScreenRouteArgs(
            key: key,
            toAddress: toAddress,
            amount: amount,
          ),
          rawPathParams: {
            'toAddress': toAddress,
            'amount': amount,
          },
        );

  static const String name = 'WebPrefilledSendScreenRoute';
}

class WebPrefilledSendScreenRouteArgs {
  const WebPrefilledSendScreenRouteArgs({
    this.key,
    required this.toAddress,
    required this.amount,
  });

  final _i22.Key? key;

  final String toAddress;

  final double amount;

  @override
  String toString() {
    return 'WebPrefilledSendScreenRouteArgs{key: $key, toAddress: $toAddress, amount: $amount}';
  }
}

/// generated route for
/// [_i9.WebReceiveScreen]
class WebReceiveScreenRoute extends _i21.PageRouteInfo<void> {
  const WebReceiveScreenRoute()
      : super(
          WebReceiveScreenRoute.name,
          path: '',
        );

  static const String name = 'WebReceiveScreenRoute';
}

/// generated route for
/// [_i10.WebTransactionScreen]
class WebTransactionScreenRoute extends _i21.PageRouteInfo<void> {
  const WebTransactionScreenRoute()
      : super(
          WebTransactionScreenRoute.name,
          path: '',
        );

  static const String name = 'WebTransactionScreenRoute';
}

/// generated route for
/// [_i11.WebTransactionDetailScreen]
class WebTransactionDetailScreenRoute
    extends _i21.PageRouteInfo<WebTransactionDetailScreenRouteArgs> {
  WebTransactionDetailScreenRoute({
    _i22.Key? key,
    required String hash,
  }) : super(
          WebTransactionDetailScreenRoute.name,
          path: 'detail/:hash',
          args: WebTransactionDetailScreenRouteArgs(
            key: key,
            hash: hash,
          ),
          rawPathParams: {'hash': hash},
        );

  static const String name = 'WebTransactionDetailScreenRoute';
}

class WebTransactionDetailScreenRouteArgs {
  const WebTransactionDetailScreenRouteArgs({
    this.key,
    required this.hash,
  });

  final _i22.Key? key;

  final String hash;

  @override
  String toString() {
    return 'WebTransactionDetailScreenRouteArgs{key: $key, hash: $hash}';
  }
}

/// generated route for
/// [_i12.NftListScreen]
class NftListScreenRoute extends _i21.PageRouteInfo<void> {
  const NftListScreenRoute()
      : super(
          NftListScreenRoute.name,
          path: '',
        );

  static const String name = 'NftListScreenRoute';
}

/// generated route for
/// [_i13.NftDetailScreen]
class NftDetailScreenRoute
    extends _i21.PageRouteInfo<NftDetailScreenRouteArgs> {
  NftDetailScreenRoute({
    required String id,
    _i22.Key? key,
    bool fromCreator = false,
  }) : super(
          NftDetailScreenRoute.name,
          path: 'detail/:id',
          args: NftDetailScreenRouteArgs(
            id: id,
            key: key,
            fromCreator: fromCreator,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'NftDetailScreenRoute';
}

class NftDetailScreenRouteArgs {
  const NftDetailScreenRouteArgs({
    required this.id,
    this.key,
    this.fromCreator = false,
  });

  final String id;

  final _i22.Key? key;

  final bool fromCreator;

  @override
  String toString() {
    return 'NftDetailScreenRouteArgs{id: $id, key: $key, fromCreator: $fromCreator}';
  }
}

/// generated route for
/// [_i14.WebAdnrScreen]
class WebAdnrScreenRoute extends _i21.PageRouteInfo<void> {
  const WebAdnrScreenRoute()
      : super(
          WebAdnrScreenRoute.name,
          path: '',
        );

  static const String name = 'WebAdnrScreenRoute';
}

/// generated route for
/// [_i15.WebSmartContractLandingScreen]
class WebSmartContractLandingScreenRoute extends _i21.PageRouteInfo<void> {
  const WebSmartContractLandingScreenRoute()
      : super(
          WebSmartContractLandingScreenRoute.name,
          path: '',
        );

  static const String name = 'WebSmartContractLandingScreenRoute';
}

/// generated route for
/// [_i16.WebCreateSmartContractScreen]
class WebCreateSmartContractScreenRoute extends _i21.PageRouteInfo<void> {
  const WebCreateSmartContractScreenRoute()
      : super(
          WebCreateSmartContractScreenRoute.name,
          path: 'create',
        );

  static const String name = 'WebCreateSmartContractScreenRoute';
}

/// generated route for
/// [_i17.WebDstScreen]
class WebDstScreenRoute extends _i21.PageRouteInfo<void> {
  const WebDstScreenRoute()
      : super(
          WebDstScreenRoute.name,
          path: '',
        );

  static const String name = 'WebDstScreenRoute';
}

/// generated route for
/// [_i18.CreateStoreScreen]
class CreateStoreScreenRoute
    extends _i21.PageRouteInfo<CreateStoreScreenRouteArgs> {
  CreateStoreScreenRoute({
    _i22.Key? key,
    required String accountId,
  }) : super(
          CreateStoreScreenRoute.name,
          path: 'create/:accountId',
          args: CreateStoreScreenRouteArgs(
            key: key,
            accountId: accountId,
          ),
          rawPathParams: {'accountId': accountId},
        );

  static const String name = 'CreateStoreScreenRoute';
}

class CreateStoreScreenRouteArgs {
  const CreateStoreScreenRouteArgs({
    this.key,
    required this.accountId,
  });

  final _i22.Key? key;

  final String accountId;

  @override
  String toString() {
    return 'CreateStoreScreenRouteArgs{key: $key, accountId: $accountId}';
  }
}

/// generated route for
/// [_i19.StoreScreen]
class StoreScreenRoute extends _i21.PageRouteInfo<StoreScreenRouteArgs> {
  StoreScreenRoute({
    _i22.Key? key,
    required String slug,
  }) : super(
          StoreScreenRoute.name,
          path: 'store/:slug',
          args: StoreScreenRouteArgs(
            key: key,
            slug: slug,
          ),
          rawPathParams: {'slug': slug},
        );

  static const String name = 'StoreScreenRoute';
}

class StoreScreenRouteArgs {
  const StoreScreenRouteArgs({
    this.key,
    required this.slug,
  });

  final _i22.Key? key;

  final String slug;

  @override
  String toString() {
    return 'StoreScreenRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i20.CreateListingScreen]
class CreateListingScreenRoute
    extends _i21.PageRouteInfo<CreateListingScreenRouteArgs> {
  CreateListingScreenRoute({
    _i22.Key? key,
    required int storeId,
  }) : super(
          CreateListingScreenRoute.name,
          path: 'store/:storeId/create-listing',
          args: CreateListingScreenRouteArgs(
            key: key,
            storeId: storeId,
          ),
          rawPathParams: {'storeId': storeId},
        );

  static const String name = 'CreateListingScreenRoute';
}

class CreateListingScreenRouteArgs {
  const CreateListingScreenRouteArgs({
    this.key,
    required this.storeId,
  });

  final _i22.Key? key;

  final int storeId;

  @override
  String toString() {
    return 'CreateListingScreenRouteArgs{key: $key, storeId: $storeId}';
  }
}
