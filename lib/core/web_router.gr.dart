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
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i34;
import 'package:rbx_wallet/features/adnr/screens/web_adnr_screen.dart' as _i14;
import 'package:rbx_wallet/features/auth/screens/web_auth_screen.dart' as _i3;
import 'package:rbx_wallet/features/chat/screens/web_seller_chat_screen.dart'
    as _i26;
import 'package:rbx_wallet/features/chat/screens/web_seller_chat_thread_list_screen.dart'
    as _i24;
import 'package:rbx_wallet/features/chat/screens/web_shop_chat_screen.dart'
    as _i25;
import 'package:rbx_wallet/features/home/screens/web_home_screen.dart' as _i5;
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart' as _i13;
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart' as _i12;
import 'package:rbx_wallet/features/receive/screens/web_receive_screen.dart'
    as _i9;
import 'package:rbx_wallet/features/reserve/screens/web_reserve_account_overview_screen.dart'
    as _i8;
import 'package:rbx_wallet/features/root/web_dashboard_container.dart' as _i2;
import 'package:rbx_wallet/features/send/screens/web_prefilled_send_screen.dart'
    as _i7;
import 'package:rbx_wallet/features/send/screens/web_send_screen.dart' as _i6;
import 'package:rbx_wallet/features/smart_contracts/screens/bulk_create_screen.dart'
    as _i17;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_wizard_screen.dart'
    as _i18;
import 'package:rbx_wallet/features/smart_contracts/screens/web_create_smart_contract_screen.dart'
    as _i16;
import 'package:rbx_wallet/features/smart_contracts/screens/web_smart_contract_landing_screen.dart'
    as _i15;
import 'package:rbx_wallet/features/token/screens/token_list_screen.dart'
    as _i19;
import 'package:rbx_wallet/features/token/screens/web_token_create_screen.dart'
    as _i20;
import 'package:rbx_wallet/features/transactions/screens/web_transaction_detail_screen.dart'
    as _i11;
import 'package:rbx_wallet/features/transactions/screens/web_transactions_screen.dart'
    as _i10;
import 'package:rbx_wallet/features/web_shop/screens/build_sale_start_tx_screen.dart'
    as _i32;
import 'package:rbx_wallet/features/web_shop/screens/create_web_listing_screen.dart'
    as _i28;
import 'package:rbx_wallet/features/web_shop/screens/create_web_shop_container_screen.dart'
    as _i27;
import 'package:rbx_wallet/features/web_shop/screens/my_web_shops_list_screen.dart'
    as _i23;
import 'package:rbx_wallet/features/web_shop/screens/web_collection_detail_screen.dart'
    as _i30;
import 'package:rbx_wallet/features/web_shop/screens/web_listing_detail_screen.dart'
    as _i31;
import 'package:rbx_wallet/features/web_shop/screens/web_shop_container_screen.dart'
    as _i4;
import 'package:rbx_wallet/features/web_shop/screens/web_shop_detail_screen.dart'
    as _i29;
import 'package:rbx_wallet/features/web_shop/screens/web_shop_landing_screen.dart'
    as _i21;
import 'package:rbx_wallet/features/web_shop/screens/web_shop_list_screen.dart'
    as _i22;

class WebRouter extends _i33.RootStackRouter {
  WebRouter([_i34.GlobalKey<_i34.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    WebAuthRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebDashboardContainerRoute.name: (routeData) {
      final args = routeData.argsAs<WebDashboardContainerRouteArgs>(
          orElse: () => const WebDashboardContainerRouteArgs());
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.WebDashboardContainer(key: args.key),
      );
    },
    WebAuthScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.WebAuthScreen(),
      );
    },
    WebHomeTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebSendTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebReserveAccountsTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebReceiveTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebTransactionsTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebNftTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebAdnrTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebSmartContractTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebTokenTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebShopTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.WebShopContainerScreen(),
      );
    },
    WebSignTxTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WebHomeScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.WebHomeScreen(),
      );
    },
    WebSendScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.WebSendScreen(),
      );
    },
    WebPrefilledSendScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebPrefilledSendScreenRouteArgs>(
          orElse: () => WebPrefilledSendScreenRouteArgs(
                toAddress: pathParams.getString('toAddress'),
                amount: pathParams.getDouble('amount'),
              ));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.WebPrefilledSendScreen(
          key: args.key,
          toAddress: args.toAddress,
          amount: args.amount,
        ),
      );
    },
    WebReserveAccountOverviewScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.WebReserveAccountOverviewScreen(),
      );
    },
    WebReceiveScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.WebReceiveScreen(),
      );
    },
    WebTransactionScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.WebTransactionScreen(),
      );
    },
    WebTransactionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebTransactionDetailScreenRouteArgs>(
          orElse: () => WebTransactionDetailScreenRouteArgs(
              hash: pathParams.getString('hash')));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.WebTransactionDetailScreen(
          key: args.key,
          hash: args.hash,
        ),
      );
    },
    NftListScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.NftListScreen(),
      );
    },
    NftDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NftDetailScreenRouteArgs>(
          orElse: () =>
              NftDetailScreenRouteArgs(id: pathParams.getString('id')));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.NftDetailScreen(
          id: args.id,
          key: args.key,
          fromCreator: args.fromCreator,
        ),
      );
    },
    WebAdnrScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.WebAdnrScreen(),
      );
    },
    WebSmartContractLandingScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.WebSmartContractLandingScreen(),
      );
    },
    WebCreateSmartContractScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.WebCreateSmartContractScreen(),
      );
    },
    WebBulkCreateScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.BulkCreateScreen(),
      );
    },
    WebSmartContractWizardScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.SmartContractWizardScreen(),
      );
    },
    TokenListScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.TokenListScreen(),
      );
    },
    WebTokenCreateScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.WebTokenCreateScreen(),
      );
    },
    WebShopLandingScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.WebShopLandingScreen(),
      );
    },
    WebShopListScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.WebShopListScreen(),
      );
    },
    MyWebShopListScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.MyWebShopListScreen(),
      );
    },
    WebSellerChatThreadListScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebSellerChatThreadListScreenRouteArgs>(
          orElse: () => WebSellerChatThreadListScreenRouteArgs(
              shopId: pathParams.getInt('shopId')));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i24.WebSellerChatThreadListScreen(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    WebShopChatScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebShopChatScreenRouteArgs>(
          orElse: () => WebShopChatScreenRouteArgs(
              identifier: pathParams.getString('identifier')));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i25.WebShopChatScreen(
          key: args.key,
          identifier: args.identifier,
        ),
      );
    },
    WebSellerChatScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebSellerChatScreenRouteArgs>(
          orElse: () => WebSellerChatScreenRouteArgs(
                address: pathParams.getString('address'),
                shopId: pathParams.getInt('shopId'),
              ));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i26.WebSellerChatScreen(
          key: args.key,
          address: args.address,
          shopId: args.shopId,
        ),
      );
    },
    CreateWebShopContainerScreenRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i27.CreateWebShopContainerScreen(),
      );
    },
    CreateWebListingScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateWebListingScreenRouteArgs>(
          orElse: () => CreateWebListingScreenRouteArgs(
                shopId: pathParams.getInt('shopId'),
                collectionId: pathParams.getInt('collectionId'),
              ));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i28.CreateWebListingScreen(
          key: args.key,
          shopId: args.shopId,
          collectionId: args.collectionId,
        ),
      );
    },
    WebShopDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebShopDetailScreenRouteArgs>(
          orElse: () => WebShopDetailScreenRouteArgs(
              shopId: pathParams.getInt('shopId')));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i29.WebShopDetailScreen(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    WebCollectionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebCollectionDetailScreenRouteArgs>(
          orElse: () => WebCollectionDetailScreenRouteArgs(
                shopId: pathParams.getInt('shopId'),
                collectionId: pathParams.getInt('collectionId'),
              ));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i30.WebCollectionDetailScreen(
          key: args.key,
          shopId: args.shopId,
          collectionId: args.collectionId,
        ),
      );
    },
    WebListingDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebListingDetailScreenRouteArgs>(
          orElse: () => WebListingDetailScreenRouteArgs(
                shopId: pathParams.getInt('shopId'),
                collectionId: pathParams.getInt('collectionId'),
                listingId: pathParams.getInt('listingId'),
              ));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.WebListingDetailScreen(
          key: args.key,
          shopId: args.shopId,
          collectionId: args.collectionId,
          listingId: args.listingId,
        ),
      );
    },
    BuildSaleStartTxScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BuildSaleStartTxScreenRouteArgs>(
          orElse: () => BuildSaleStartTxScreenRouteArgs(
                scId: pathParams.getString('scId'),
                bidId: pathParams.getInt('bidId'),
                ownerAddress: pathParams.getString('ownerAddress'),
              ));
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i32.BuildSaleStartTxScreen(
          key: args.key,
          scId: args.scId,
          bidId: args.bidId,
          ownerAddress: args.ownerAddress,
        ),
      );
    },
  };

  @override
  List<_i33.RouteConfig> get routes => [
        _i33.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i33.RouteConfig(
          WebAuthRouter.name,
          path: '',
          children: [
            _i33.RouteConfig(
              WebAuthScreenRoute.name,
              path: '',
              parent: WebAuthRouter.name,
            )
          ],
        ),
        _i33.RouteConfig(
          WebDashboardContainerRoute.name,
          path: 'dashboard',
          children: [
            _i33.RouteConfig(
              WebHomeTabRouter.name,
              path: 'home',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  WebHomeScreenRoute.name,
                  path: '',
                  parent: WebHomeTabRouter.name,
                )
              ],
            ),
            _i33.RouteConfig(
              WebSendTabRouter.name,
              path: 'send',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  WebSendScreenRoute.name,
                  path: '',
                  parent: WebSendTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebPrefilledSendScreenRoute.name,
                  path: ':toAddress/:amount',
                  parent: WebSendTabRouter.name,
                ),
              ],
            ),
            _i33.RouteConfig(
              WebReserveAccountsTabRouter.name,
              path: 'vault-accounts',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  WebReserveAccountOverviewScreenRoute.name,
                  path: '',
                  parent: WebReserveAccountsTabRouter.name,
                )
              ],
            ),
            _i33.RouteConfig(
              WebReceiveTabRouter.name,
              path: 'receive',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  WebReceiveScreenRoute.name,
                  path: '',
                  parent: WebReceiveTabRouter.name,
                )
              ],
            ),
            _i33.RouteConfig(
              WebTransactionsTabRouter.name,
              path: 'transactions',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  WebTransactionScreenRoute.name,
                  path: '',
                  parent: WebTransactionsTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebTransactionDetailScreenRoute.name,
                  path: 'detail/:hash',
                  parent: WebTransactionsTabRouter.name,
                ),
              ],
            ),
            _i33.RouteConfig(
              WebNftTabRouter.name,
              path: 'nfts',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  NftListScreenRoute.name,
                  path: '',
                  parent: WebNftTabRouter.name,
                ),
                _i33.RouteConfig(
                  NftDetailScreenRoute.name,
                  path: 'detail/:id',
                  parent: WebNftTabRouter.name,
                ),
              ],
            ),
            _i33.RouteConfig(
              WebAdnrTabRouter.name,
              path: 'adnrs',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  WebAdnrScreenRoute.name,
                  path: '',
                  parent: WebAdnrTabRouter.name,
                )
              ],
            ),
            _i33.RouteConfig(
              WebSmartContractTabRouter.name,
              path: 'smart-contract',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  WebSmartContractLandingScreenRoute.name,
                  path: '',
                  parent: WebSmartContractTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebCreateSmartContractScreenRoute.name,
                  path: 'create',
                  parent: WebSmartContractTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebBulkCreateScreenRoute.name,
                  path: 'bulk',
                  parent: WebSmartContractTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebSmartContractWizardScreenRoute.name,
                  path: 'create',
                  parent: WebSmartContractTabRouter.name,
                ),
              ],
            ),
            _i33.RouteConfig(
              WebTokenTabRouter.name,
              path: 'fungible-token',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  TokenListScreenRoute.name,
                  path: '',
                  parent: WebTokenTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebTokenCreateScreenRoute.name,
                  path: 'create',
                  parent: WebTokenTabRouter.name,
                ),
              ],
            ),
            _i33.RouteConfig(
              WebShopTabRouter.name,
              path: 'p2p',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: WebShopTabRouter.name,
                  redirectTo: 'landing',
                  fullMatch: true,
                ),
                _i33.RouteConfig(
                  WebShopLandingScreenRoute.name,
                  path: 'landing',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebShopListScreenRoute.name,
                  path: 'shops',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  MyWebShopListScreenRoute.name,
                  path: 'mine',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebSellerChatThreadListScreenRoute.name,
                  path: 'chat/:shopId',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebShopChatScreenRoute.name,
                  path: 'chat/:identifier',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebSellerChatScreenRoute.name,
                  path: 'chat/:shopId/:address',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  CreateWebShopContainerScreenRoute.name,
                  path: 'createWebShop',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  CreateWebListingScreenRoute.name,
                  path: 'shop/:shopId/collection/:collectionId/create-listing',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebShopDetailScreenRoute.name,
                  path: 'shop/:shopId',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebCollectionDetailScreenRoute.name,
                  path: 'shop/:shopId/collection/:collectionId',
                  parent: WebShopTabRouter.name,
                ),
                _i33.RouteConfig(
                  WebListingDetailScreenRoute.name,
                  path:
                      'shop/:shopId/collection/:collectionId/listing/:listingId',
                  parent: WebShopTabRouter.name,
                ),
              ],
            ),
            _i33.RouteConfig(
              WebSignTxTabRouter.name,
              path: 'sign-tx',
              parent: WebDashboardContainerRoute.name,
              children: [
                _i33.RouteConfig(
                  BuildSaleStartTxScreenRoute.name,
                  path: 'build-sale-start/:scId/:bidId/:ownerAddress',
                  parent: WebSignTxTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i33.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebAuthRouter extends _i33.PageRouteInfo<void> {
  const WebAuthRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebAuthRouter.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'WebAuthRouter';
}

/// generated route for
/// [_i2.WebDashboardContainer]
class WebDashboardContainerRoute
    extends _i33.PageRouteInfo<WebDashboardContainerRouteArgs> {
  WebDashboardContainerRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
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

  final _i34.Key? key;

  @override
  String toString() {
    return 'WebDashboardContainerRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.WebAuthScreen]
class WebAuthScreenRoute extends _i33.PageRouteInfo<void> {
  const WebAuthScreenRoute()
      : super(
          WebAuthScreenRoute.name,
          path: '',
        );

  static const String name = 'WebAuthScreenRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebHomeTabRouter extends _i33.PageRouteInfo<void> {
  const WebHomeTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebHomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'WebHomeTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebSendTabRouter extends _i33.PageRouteInfo<void> {
  const WebSendTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebSendTabRouter.name,
          path: 'send',
          initialChildren: children,
        );

  static const String name = 'WebSendTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebReserveAccountsTabRouter extends _i33.PageRouteInfo<void> {
  const WebReserveAccountsTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebReserveAccountsTabRouter.name,
          path: 'vault-accounts',
          initialChildren: children,
        );

  static const String name = 'WebReserveAccountsTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebReceiveTabRouter extends _i33.PageRouteInfo<void> {
  const WebReceiveTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebReceiveTabRouter.name,
          path: 'receive',
          initialChildren: children,
        );

  static const String name = 'WebReceiveTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebTransactionsTabRouter extends _i33.PageRouteInfo<void> {
  const WebTransactionsTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebTransactionsTabRouter.name,
          path: 'transactions',
          initialChildren: children,
        );

  static const String name = 'WebTransactionsTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebNftTabRouter extends _i33.PageRouteInfo<void> {
  const WebNftTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebNftTabRouter.name,
          path: 'nfts',
          initialChildren: children,
        );

  static const String name = 'WebNftTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebAdnrTabRouter extends _i33.PageRouteInfo<void> {
  const WebAdnrTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebAdnrTabRouter.name,
          path: 'adnrs',
          initialChildren: children,
        );

  static const String name = 'WebAdnrTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebSmartContractTabRouter extends _i33.PageRouteInfo<void> {
  const WebSmartContractTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebSmartContractTabRouter.name,
          path: 'smart-contract',
          initialChildren: children,
        );

  static const String name = 'WebSmartContractTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebTokenTabRouter extends _i33.PageRouteInfo<void> {
  const WebTokenTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebTokenTabRouter.name,
          path: 'fungible-token',
          initialChildren: children,
        );

  static const String name = 'WebTokenTabRouter';
}

/// generated route for
/// [_i4.WebShopContainerScreen]
class WebShopTabRouter extends _i33.PageRouteInfo<void> {
  const WebShopTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebShopTabRouter.name,
          path: 'p2p',
          initialChildren: children,
        );

  static const String name = 'WebShopTabRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class WebSignTxTabRouter extends _i33.PageRouteInfo<void> {
  const WebSignTxTabRouter({List<_i33.PageRouteInfo>? children})
      : super(
          WebSignTxTabRouter.name,
          path: 'sign-tx',
          initialChildren: children,
        );

  static const String name = 'WebSignTxTabRouter';
}

/// generated route for
/// [_i5.WebHomeScreen]
class WebHomeScreenRoute extends _i33.PageRouteInfo<void> {
  const WebHomeScreenRoute()
      : super(
          WebHomeScreenRoute.name,
          path: '',
        );

  static const String name = 'WebHomeScreenRoute';
}

/// generated route for
/// [_i6.WebSendScreen]
class WebSendScreenRoute extends _i33.PageRouteInfo<void> {
  const WebSendScreenRoute()
      : super(
          WebSendScreenRoute.name,
          path: '',
        );

  static const String name = 'WebSendScreenRoute';
}

/// generated route for
/// [_i7.WebPrefilledSendScreen]
class WebPrefilledSendScreenRoute
    extends _i33.PageRouteInfo<WebPrefilledSendScreenRouteArgs> {
  WebPrefilledSendScreenRoute({
    _i34.Key? key,
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

  final _i34.Key? key;

  final String toAddress;

  final double amount;

  @override
  String toString() {
    return 'WebPrefilledSendScreenRouteArgs{key: $key, toAddress: $toAddress, amount: $amount}';
  }
}

/// generated route for
/// [_i8.WebReserveAccountOverviewScreen]
class WebReserveAccountOverviewScreenRoute extends _i33.PageRouteInfo<void> {
  const WebReserveAccountOverviewScreenRoute()
      : super(
          WebReserveAccountOverviewScreenRoute.name,
          path: '',
        );

  static const String name = 'WebReserveAccountOverviewScreenRoute';
}

/// generated route for
/// [_i9.WebReceiveScreen]
class WebReceiveScreenRoute extends _i33.PageRouteInfo<void> {
  const WebReceiveScreenRoute()
      : super(
          WebReceiveScreenRoute.name,
          path: '',
        );

  static const String name = 'WebReceiveScreenRoute';
}

/// generated route for
/// [_i10.WebTransactionScreen]
class WebTransactionScreenRoute extends _i33.PageRouteInfo<void> {
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
    extends _i33.PageRouteInfo<WebTransactionDetailScreenRouteArgs> {
  WebTransactionDetailScreenRoute({
    _i34.Key? key,
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

  final _i34.Key? key;

  final String hash;

  @override
  String toString() {
    return 'WebTransactionDetailScreenRouteArgs{key: $key, hash: $hash}';
  }
}

/// generated route for
/// [_i12.NftListScreen]
class NftListScreenRoute extends _i33.PageRouteInfo<void> {
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
    extends _i33.PageRouteInfo<NftDetailScreenRouteArgs> {
  NftDetailScreenRoute({
    required String id,
    _i34.Key? key,
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

  final _i34.Key? key;

  final bool fromCreator;

  @override
  String toString() {
    return 'NftDetailScreenRouteArgs{id: $id, key: $key, fromCreator: $fromCreator}';
  }
}

/// generated route for
/// [_i14.WebAdnrScreen]
class WebAdnrScreenRoute extends _i33.PageRouteInfo<void> {
  const WebAdnrScreenRoute()
      : super(
          WebAdnrScreenRoute.name,
          path: '',
        );

  static const String name = 'WebAdnrScreenRoute';
}

/// generated route for
/// [_i15.WebSmartContractLandingScreen]
class WebSmartContractLandingScreenRoute extends _i33.PageRouteInfo<void> {
  const WebSmartContractLandingScreenRoute()
      : super(
          WebSmartContractLandingScreenRoute.name,
          path: '',
        );

  static const String name = 'WebSmartContractLandingScreenRoute';
}

/// generated route for
/// [_i16.WebCreateSmartContractScreen]
class WebCreateSmartContractScreenRoute extends _i33.PageRouteInfo<void> {
  const WebCreateSmartContractScreenRoute()
      : super(
          WebCreateSmartContractScreenRoute.name,
          path: 'create',
        );

  static const String name = 'WebCreateSmartContractScreenRoute';
}

/// generated route for
/// [_i17.BulkCreateScreen]
class WebBulkCreateScreenRoute extends _i33.PageRouteInfo<void> {
  const WebBulkCreateScreenRoute()
      : super(
          WebBulkCreateScreenRoute.name,
          path: 'bulk',
        );

  static const String name = 'WebBulkCreateScreenRoute';
}

/// generated route for
/// [_i18.SmartContractWizardScreen]
class WebSmartContractWizardScreenRoute extends _i33.PageRouteInfo<void> {
  const WebSmartContractWizardScreenRoute()
      : super(
          WebSmartContractWizardScreenRoute.name,
          path: 'create',
        );

  static const String name = 'WebSmartContractWizardScreenRoute';
}

/// generated route for
/// [_i19.TokenListScreen]
class TokenListScreenRoute extends _i33.PageRouteInfo<void> {
  const TokenListScreenRoute()
      : super(
          TokenListScreenRoute.name,
          path: '',
        );

  static const String name = 'TokenListScreenRoute';
}

/// generated route for
/// [_i20.WebTokenCreateScreen]
class WebTokenCreateScreenRoute extends _i33.PageRouteInfo<void> {
  const WebTokenCreateScreenRoute()
      : super(
          WebTokenCreateScreenRoute.name,
          path: 'create',
        );

  static const String name = 'WebTokenCreateScreenRoute';
}

/// generated route for
/// [_i21.WebShopLandingScreen]
class WebShopLandingScreenRoute extends _i33.PageRouteInfo<void> {
  const WebShopLandingScreenRoute()
      : super(
          WebShopLandingScreenRoute.name,
          path: 'landing',
        );

  static const String name = 'WebShopLandingScreenRoute';
}

/// generated route for
/// [_i22.WebShopListScreen]
class WebShopListScreenRoute extends _i33.PageRouteInfo<void> {
  const WebShopListScreenRoute()
      : super(
          WebShopListScreenRoute.name,
          path: 'shops',
        );

  static const String name = 'WebShopListScreenRoute';
}

/// generated route for
/// [_i23.MyWebShopListScreen]
class MyWebShopListScreenRoute extends _i33.PageRouteInfo<void> {
  const MyWebShopListScreenRoute()
      : super(
          MyWebShopListScreenRoute.name,
          path: 'mine',
        );

  static const String name = 'MyWebShopListScreenRoute';
}

/// generated route for
/// [_i24.WebSellerChatThreadListScreen]
class WebSellerChatThreadListScreenRoute
    extends _i33.PageRouteInfo<WebSellerChatThreadListScreenRouteArgs> {
  WebSellerChatThreadListScreenRoute({
    _i34.Key? key,
    required int shopId,
  }) : super(
          WebSellerChatThreadListScreenRoute.name,
          path: 'chat/:shopId',
          args: WebSellerChatThreadListScreenRouteArgs(
            key: key,
            shopId: shopId,
          ),
          rawPathParams: {'shopId': shopId},
        );

  static const String name = 'WebSellerChatThreadListScreenRoute';
}

class WebSellerChatThreadListScreenRouteArgs {
  const WebSellerChatThreadListScreenRouteArgs({
    this.key,
    required this.shopId,
  });

  final _i34.Key? key;

  final int shopId;

  @override
  String toString() {
    return 'WebSellerChatThreadListScreenRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i25.WebShopChatScreen]
class WebShopChatScreenRoute
    extends _i33.PageRouteInfo<WebShopChatScreenRouteArgs> {
  WebShopChatScreenRoute({
    _i34.Key? key,
    required String identifier,
  }) : super(
          WebShopChatScreenRoute.name,
          path: 'chat/:identifier',
          args: WebShopChatScreenRouteArgs(
            key: key,
            identifier: identifier,
          ),
          rawPathParams: {'identifier': identifier},
        );

  static const String name = 'WebShopChatScreenRoute';
}

class WebShopChatScreenRouteArgs {
  const WebShopChatScreenRouteArgs({
    this.key,
    required this.identifier,
  });

  final _i34.Key? key;

  final String identifier;

  @override
  String toString() {
    return 'WebShopChatScreenRouteArgs{key: $key, identifier: $identifier}';
  }
}

/// generated route for
/// [_i26.WebSellerChatScreen]
class WebSellerChatScreenRoute
    extends _i33.PageRouteInfo<WebSellerChatScreenRouteArgs> {
  WebSellerChatScreenRoute({
    _i34.Key? key,
    required String address,
    required int shopId,
  }) : super(
          WebSellerChatScreenRoute.name,
          path: 'chat/:shopId/:address',
          args: WebSellerChatScreenRouteArgs(
            key: key,
            address: address,
            shopId: shopId,
          ),
          rawPathParams: {
            'address': address,
            'shopId': shopId,
          },
        );

  static const String name = 'WebSellerChatScreenRoute';
}

class WebSellerChatScreenRouteArgs {
  const WebSellerChatScreenRouteArgs({
    this.key,
    required this.address,
    required this.shopId,
  });

  final _i34.Key? key;

  final String address;

  final int shopId;

  @override
  String toString() {
    return 'WebSellerChatScreenRouteArgs{key: $key, address: $address, shopId: $shopId}';
  }
}

/// generated route for
/// [_i27.CreateWebShopContainerScreen]
class CreateWebShopContainerScreenRoute extends _i33.PageRouteInfo<void> {
  const CreateWebShopContainerScreenRoute()
      : super(
          CreateWebShopContainerScreenRoute.name,
          path: 'createWebShop',
        );

  static const String name = 'CreateWebShopContainerScreenRoute';
}

/// generated route for
/// [_i28.CreateWebListingScreen]
class CreateWebListingScreenRoute
    extends _i33.PageRouteInfo<CreateWebListingScreenRouteArgs> {
  CreateWebListingScreenRoute({
    _i34.Key? key,
    required int shopId,
    required int collectionId,
  }) : super(
          CreateWebListingScreenRoute.name,
          path: 'shop/:shopId/collection/:collectionId/create-listing',
          args: CreateWebListingScreenRouteArgs(
            key: key,
            shopId: shopId,
            collectionId: collectionId,
          ),
          rawPathParams: {
            'shopId': shopId,
            'collectionId': collectionId,
          },
        );

  static const String name = 'CreateWebListingScreenRoute';
}

class CreateWebListingScreenRouteArgs {
  const CreateWebListingScreenRouteArgs({
    this.key,
    required this.shopId,
    required this.collectionId,
  });

  final _i34.Key? key;

  final int shopId;

  final int collectionId;

  @override
  String toString() {
    return 'CreateWebListingScreenRouteArgs{key: $key, shopId: $shopId, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i29.WebShopDetailScreen]
class WebShopDetailScreenRoute
    extends _i33.PageRouteInfo<WebShopDetailScreenRouteArgs> {
  WebShopDetailScreenRoute({
    _i34.Key? key,
    required int shopId,
  }) : super(
          WebShopDetailScreenRoute.name,
          path: 'shop/:shopId',
          args: WebShopDetailScreenRouteArgs(
            key: key,
            shopId: shopId,
          ),
          rawPathParams: {'shopId': shopId},
        );

  static const String name = 'WebShopDetailScreenRoute';
}

class WebShopDetailScreenRouteArgs {
  const WebShopDetailScreenRouteArgs({
    this.key,
    required this.shopId,
  });

  final _i34.Key? key;

  final int shopId;

  @override
  String toString() {
    return 'WebShopDetailScreenRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i30.WebCollectionDetailScreen]
class WebCollectionDetailScreenRoute
    extends _i33.PageRouteInfo<WebCollectionDetailScreenRouteArgs> {
  WebCollectionDetailScreenRoute({
    _i34.Key? key,
    required int shopId,
    required int collectionId,
  }) : super(
          WebCollectionDetailScreenRoute.name,
          path: 'shop/:shopId/collection/:collectionId',
          args: WebCollectionDetailScreenRouteArgs(
            key: key,
            shopId: shopId,
            collectionId: collectionId,
          ),
          rawPathParams: {
            'shopId': shopId,
            'collectionId': collectionId,
          },
        );

  static const String name = 'WebCollectionDetailScreenRoute';
}

class WebCollectionDetailScreenRouteArgs {
  const WebCollectionDetailScreenRouteArgs({
    this.key,
    required this.shopId,
    required this.collectionId,
  });

  final _i34.Key? key;

  final int shopId;

  final int collectionId;

  @override
  String toString() {
    return 'WebCollectionDetailScreenRouteArgs{key: $key, shopId: $shopId, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i31.WebListingDetailScreen]
class WebListingDetailScreenRoute
    extends _i33.PageRouteInfo<WebListingDetailScreenRouteArgs> {
  WebListingDetailScreenRoute({
    _i34.Key? key,
    required int shopId,
    required int collectionId,
    required int listingId,
  }) : super(
          WebListingDetailScreenRoute.name,
          path: 'shop/:shopId/collection/:collectionId/listing/:listingId',
          args: WebListingDetailScreenRouteArgs(
            key: key,
            shopId: shopId,
            collectionId: collectionId,
            listingId: listingId,
          ),
          rawPathParams: {
            'shopId': shopId,
            'collectionId': collectionId,
            'listingId': listingId,
          },
        );

  static const String name = 'WebListingDetailScreenRoute';
}

class WebListingDetailScreenRouteArgs {
  const WebListingDetailScreenRouteArgs({
    this.key,
    required this.shopId,
    required this.collectionId,
    required this.listingId,
  });

  final _i34.Key? key;

  final int shopId;

  final int collectionId;

  final int listingId;

  @override
  String toString() {
    return 'WebListingDetailScreenRouteArgs{key: $key, shopId: $shopId, collectionId: $collectionId, listingId: $listingId}';
  }
}

/// generated route for
/// [_i32.BuildSaleStartTxScreen]
class BuildSaleStartTxScreenRoute
    extends _i33.PageRouteInfo<BuildSaleStartTxScreenRouteArgs> {
  BuildSaleStartTxScreenRoute({
    _i34.Key? key,
    required String scId,
    required int bidId,
    required String ownerAddress,
  }) : super(
          BuildSaleStartTxScreenRoute.name,
          path: 'build-sale-start/:scId/:bidId/:ownerAddress',
          args: BuildSaleStartTxScreenRouteArgs(
            key: key,
            scId: scId,
            bidId: bidId,
            ownerAddress: ownerAddress,
          ),
          rawPathParams: {
            'scId': scId,
            'bidId': bidId,
            'ownerAddress': ownerAddress,
          },
        );

  static const String name = 'BuildSaleStartTxScreenRoute';
}

class BuildSaleStartTxScreenRouteArgs {
  const BuildSaleStartTxScreenRouteArgs({
    this.key,
    required this.scId,
    required this.bidId,
    required this.ownerAddress,
  });

  final _i34.Key? key;

  final String scId;

  final int bidId;

  final String ownerAddress;

  @override
  String toString() {
    return 'BuildSaleStartTxScreenRouteArgs{key: $key, scId: $scId, bidId: $bidId, ownerAddress: $ownerAddress}';
  }
}
