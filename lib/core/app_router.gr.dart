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
import 'package:auto_route/auto_route.dart' as _i39;
import 'package:auto_route/empty_router_widgets.dart' as _i10;
import 'package:flutter/material.dart' as _i40;
import 'package:rbx_wallet/features/adjudicator/adjudicator_screen.dart'
    as _i17;
import 'package:rbx_wallet/features/adnr/screens/adnr_screen.dart' as _i29;
import 'package:rbx_wallet/features/beacon/screens/beacon_list_screen.dart'
    as _i33;
import 'package:rbx_wallet/features/chat/screens/shop_chat_screen.dart' as _i37;
import 'package:rbx_wallet/features/config/screens/config_container_screen.dart'
    as _i6;
import 'package:rbx_wallet/features/datanode/screens/datanode_screen.dart'
    as _i19;
import 'package:rbx_wallet/features/dst/screens/create_collection_container_screen.dart'
    as _i25;
import 'package:rbx_wallet/features/dst/screens/create_dec_shop_container_screen.dart'
    as _i26;
import 'package:rbx_wallet/features/dst/screens/create_listing_container_screen.dart'
    as _i28;
import 'package:rbx_wallet/features/dst/screens/dst_landing_screen.dart'
    as _i22;
import 'package:rbx_wallet/features/dst/screens/listing_detail_screen.dart'
    as _i27;
import 'package:rbx_wallet/features/dst/screens/my_collection_detail_screen.dart'
    as _i24;
import 'package:rbx_wallet/features/dst/screens/my_collection_list_screen.dart'
    as _i23;
import 'package:rbx_wallet/features/home/screens/home_screen.dart' as _i11;
import 'package:rbx_wallet/features/mother/screens/mother_dashboard_screen.dart'
    as _i8;
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart' as _i20;
import 'package:rbx_wallet/features/node/screens/node_list_screen.dart' as _i18;
import 'package:rbx_wallet/features/receive/screens/receive_screen.dart'
    as _i14;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_collection_screen.dart'
    as _i38;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_container_screen.dart'
    as _i9;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_detail_screen.dart'
    as _i36;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_list_screen.dart'
    as _i35;
import 'package:rbx_wallet/features/reserve/screens/reserve_account_overview_screen.dart'
    as _i12;
import 'package:rbx_wallet/features/root/root_container.dart' as _i1;
import 'package:rbx_wallet/features/send/screens/send_screen.dart' as _i13;
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/smart_contract_creator_main.dart'
    as _i34;
import 'package:rbx_wallet/features/smart_contracts/screens/bulk_create_screen.dart'
    as _i5;
import 'package:rbx_wallet/features/smart_contracts/screens/my_smart_contracts_screen.dart'
    as _i2;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart'
    as _i7;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_drafts_screen.dart'
    as _i3;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contracts_screen.dart'
    as _i21;
import 'package:rbx_wallet/features/smart_contracts/screens/template_chooser_screen.dart'
    as _i4;
import 'package:rbx_wallet/features/transactions/screens/transactions_screen.dart'
    as _i15;
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart'
    as _i16;
import 'package:rbx_wallet/features/voting/screens/create_topic_screen.dart'
    as _i32;
import 'package:rbx_wallet/features/voting/screens/topic_detail_screen.dart'
    as _i31;
import 'package:rbx_wallet/features/voting/screens/topic_list_screen.dart'
    as _i30;

class AppRouter extends _i39.RootStackRouter {
  AppRouter([_i40.GlobalKey<_i40.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i39.PageFactory> pagesMap = {
    RootContainerRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.RootContainer(),
      );
    },
    MySmartContractsScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MySmartContractsScreen(),
      );
    },
    SmartContractDraftsScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SmartContractDraftsScreen(),
      );
    },
    TemplateChooserScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.TemplateChooserScreen(),
      );
    },
    BulkCreateScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.BulkCreateScreen(),
      );
    },
    ConfigContainerScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ConfigContainerScreen(),
      );
    },
    SmartContractCreatorContainerScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SmartContractCreatorContainerScreen(),
      );
    },
    MotherDashboardScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.MotherDashboardScreen(),
      );
    },
    RemoteShopContainerScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.RemoteShopContainerScreen(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    SendTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    ReceiveTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    TransactionsTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    ValidatorTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    AdjudicatorTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    NodesTabsRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    DatanodeTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    NftTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    SmartContractsTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    DstsTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    AdnrTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    VotingTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    BeaconTabRouter.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomeScreen(),
      );
    },
    ReserveAccountOverviewScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.ReserveAccountOverviewScreen(),
      );
    },
    SendScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.SendScreen(),
      );
    },
    ReceiveScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.ReceiveScreen(),
      );
    },
    TransactionsScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.TransactionsScreen(),
      );
    },
    ValidatorScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.ValidatorScreen(),
      );
    },
    AdjudicatorScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.AdjudicatorScreen(),
      );
    },
    NodeListScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.NodeListScreen(),
      );
    },
    DataNodeScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.DataNodeScreen(),
      );
    },
    NftListScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.NftListScreen(),
      );
    },
    SmartContractsScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.SmartContractsScreen(),
      );
    },
    DstLandingScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.DstLandingScreen(),
      );
    },
    MyCollectionsListScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.MyCollectionsListScreen(),
      );
    },
    MyCollectionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MyCollectionDetailScreenRouteArgs>(
          orElse: () => MyCollectionDetailScreenRouteArgs(
              collectionId: pathParams.getInt('collectionId')));
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i24.MyCollectionDetailScreen(
          key: args.key,
          collectionId: args.collectionId,
        ),
      );
    },
    CreateCollectionContainerScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i25.CreateCollectionContainerScreen(),
      );
    },
    CreateDecShopContainerScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i26.CreateDecShopContainerScreen(),
      );
    },
    ListingDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ListingDetailScreenRouteArgs>(
          orElse: () => ListingDetailScreenRouteArgs(
              listingId: pathParams.getInt('listingId')));
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.ListingDetailScreen(
          key: args.key,
          listingId: args.listingId,
        ),
      );
    },
    CreateListingContainerScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateListingContainerScreenRouteArgs>(
          orElse: () => CreateListingContainerScreenRouteArgs(
              collectionId: pathParams.getInt('collectionId')));
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i28.CreateListingContainerScreen(
          args.collectionId,
          key: args.key,
        ),
      );
    },
    AdnrScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.AdnrScreen(),
      );
    },
    TopicListScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i30.TopicListScreen(),
      );
    },
    TopicDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TopicDetailScreenRouteArgs>(
          orElse: () => TopicDetailScreenRouteArgs(
              topicUid: pathParams.getString('uid')));
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.TopicDetailScreen(
          key: args.key,
          topicUid: args.topicUid,
        ),
      );
    },
    CreateTopicScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i32.CreateTopicScreen(),
      );
    },
    BeaconListScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i33.BeaconListScreen(),
      );
    },
    SmartContractCreatorMainRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i34.SmartContractCreatorMain(),
      );
    },
    RemoteShopListScreenRoute.name: (routeData) {
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i35.RemoteShopListScreen(),
      );
    },
    RemoteShopDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RemoteShopDetailScreenRouteArgs>(
          orElse: () => RemoteShopDetailScreenRouteArgs(
              shopUrl: pathParams.getString('url')));
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i36.RemoteShopDetailScreen(
          key: args.key,
          shopUrl: args.shopUrl,
        ),
      );
    },
    ShopChatScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ShopChatScreenRouteArgs>(
          orElse: () =>
              ShopChatScreenRouteArgs(shopUrl: pathParams.getString('url')));
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i37.ShopChatScreen(
          key: args.key,
          shopUrl: args.shopUrl,
        ),
      );
    },
    RemoteShopCollectionScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RemoteShopCollectionScreenRouteArgs>(
          orElse: () => RemoteShopCollectionScreenRouteArgs(
                collectionId: pathParams.getInt('collectionId'),
                url: pathParams.getString('url'),
              ));
      return _i39.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i38.RemoteShopCollectionScreen(
          key: args.key,
          collectionId: args.collectionId,
          url: args.url,
        ),
      );
    },
  };

  @override
  List<_i39.RouteConfig> get routes => [
        _i39.RouteConfig(
          RootContainerRoute.name,
          path: '/',
          children: [
            _i39.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                ),
                _i39.RouteConfig(
                  ReserveAccountOverviewScreenRoute.name,
                  path: 'reserve-accounts',
                  parent: HomeTabRouter.name,
                ),
              ],
            ),
            _i39.RouteConfig(
              SendTabRouter.name,
              path: 'send',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  SendScreenRoute.name,
                  path: '',
                  parent: SendTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              ReceiveTabRouter.name,
              path: 'receive',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  ReceiveScreenRoute.name,
                  path: '',
                  parent: ReceiveTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              TransactionsTabRouter.name,
              path: 'transactions',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  TransactionsScreenRoute.name,
                  path: '',
                  parent: TransactionsTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              ValidatorTabRouter.name,
              path: 'validator',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  ValidatorScreenRoute.name,
                  path: '',
                  parent: ValidatorTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              AdjudicatorTabRouter.name,
              path: 'adjudicator',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  AdjudicatorScreenRoute.name,
                  path: '',
                  parent: AdjudicatorTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              NodesTabsRouter.name,
              path: 'nodes',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  NodeListScreenRoute.name,
                  path: '',
                  parent: NodesTabsRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              DatanodeTabRouter.name,
              path: 'datanode',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  DataNodeScreenRoute.name,
                  path: '',
                  parent: DatanodeTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              NftTabRouter.name,
              path: 'nft',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  NftListScreenRoute.name,
                  path: '',
                  parent: NftTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              SmartContractsTabRouter.name,
              path: 'smart-contracts',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  SmartContractsScreenRoute.name,
                  path: '',
                  parent: SmartContractsTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              DstsTabRouter.name,
              path: 'dsts',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  DstLandingScreenRoute.name,
                  path: '',
                  parent: DstsTabRouter.name,
                ),
                _i39.RouteConfig(
                  MyCollectionsListScreenRoute.name,
                  path: 'me',
                  parent: DstsTabRouter.name,
                ),
                _i39.RouteConfig(
                  MyCollectionDetailScreenRoute.name,
                  path: ':collectionId',
                  parent: DstsTabRouter.name,
                ),
                _i39.RouteConfig(
                  CreateCollectionContainerScreenRoute.name,
                  path: 'createCollection',
                  parent: DstsTabRouter.name,
                ),
                _i39.RouteConfig(
                  CreateDecShopContainerScreenRoute.name,
                  path: 'createDecShop',
                  parent: DstsTabRouter.name,
                ),
                _i39.RouteConfig(
                  ListingDetailScreenRoute.name,
                  path: ':listingId',
                  parent: DstsTabRouter.name,
                ),
                _i39.RouteConfig(
                  CreateListingContainerScreenRoute.name,
                  path: 'createListing/:collectionId',
                  parent: DstsTabRouter.name,
                ),
              ],
            ),
            _i39.RouteConfig(
              AdnrTabRouter.name,
              path: 'adnr',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  AdnrScreenRoute.name,
                  path: '',
                  parent: AdnrTabRouter.name,
                )
              ],
            ),
            _i39.RouteConfig(
              VotingTabRouter.name,
              path: 'voting',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  TopicListScreenRoute.name,
                  path: '',
                  parent: VotingTabRouter.name,
                ),
                _i39.RouteConfig(
                  TopicDetailScreenRoute.name,
                  path: ':uid',
                  parent: VotingTabRouter.name,
                ),
                _i39.RouteConfig(
                  CreateTopicScreenRoute.name,
                  path: 'create',
                  parent: VotingTabRouter.name,
                ),
              ],
            ),
            _i39.RouteConfig(
              BeaconTabRouter.name,
              path: 'beacons',
              parent: RootContainerRoute.name,
              children: [
                _i39.RouteConfig(
                  BeaconListScreenRoute.name,
                  path: '',
                  parent: BeaconTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i39.RouteConfig(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        ),
        _i39.RouteConfig(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        ),
        _i39.RouteConfig(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        ),
        _i39.RouteConfig(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        ),
        _i39.RouteConfig(
          ConfigContainerScreenRoute.name,
          path: 'config',
        ),
        _i39.RouteConfig(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          children: [
            _i39.RouteConfig(
              '#redirect',
              path: '',
              parent: SmartContractCreatorContainerScreenRoute.name,
              redirectTo: 'main',
              fullMatch: true,
            ),
            _i39.RouteConfig(
              SmartContractCreatorMainRoute.name,
              path: 'main',
              parent: SmartContractCreatorContainerScreenRoute.name,
            ),
          ],
        ),
        _i39.RouteConfig(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        ),
        _i39.RouteConfig(
          RemoteShopContainerScreenRoute.name,
          path: 'remote-shop-container',
          children: [
            _i39.RouteConfig(
              '#redirect',
              path: '',
              parent: RemoteShopContainerScreenRoute.name,
              redirectTo: 'shops',
              fullMatch: true,
            ),
            _i39.RouteConfig(
              RemoteShopListScreenRoute.name,
              path: 'shops',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i39.RouteConfig(
              RemoteShopDetailScreenRoute.name,
              path: 'shops/:url',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i39.RouteConfig(
              ShopChatScreenRoute.name,
              path: 'shops/:url/chat',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i39.RouteConfig(
              RemoteShopCollectionScreenRoute.name,
              path: 'shops/:url/collection/:collectionId',
              parent: RemoteShopContainerScreenRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.RootContainer]
class RootContainerRoute extends _i39.PageRouteInfo<void> {
  const RootContainerRoute({List<_i39.PageRouteInfo>? children})
      : super(
          RootContainerRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootContainerRoute';
}

/// generated route for
/// [_i2.MySmartContractsScreen]
class MySmartContractsScreenRoute extends _i39.PageRouteInfo<void> {
  const MySmartContractsScreenRoute()
      : super(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        );

  static const String name = 'MySmartContractsScreenRoute';
}

/// generated route for
/// [_i3.SmartContractDraftsScreen]
class SmartContractDraftsScreenRoute extends _i39.PageRouteInfo<void> {
  const SmartContractDraftsScreenRoute()
      : super(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        );

  static const String name = 'SmartContractDraftsScreenRoute';
}

/// generated route for
/// [_i4.TemplateChooserScreen]
class TemplateChooserScreenRoute extends _i39.PageRouteInfo<void> {
  const TemplateChooserScreenRoute()
      : super(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        );

  static const String name = 'TemplateChooserScreenRoute';
}

/// generated route for
/// [_i5.BulkCreateScreen]
class BulkCreateScreenRoute extends _i39.PageRouteInfo<void> {
  const BulkCreateScreenRoute()
      : super(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        );

  static const String name = 'BulkCreateScreenRoute';
}

/// generated route for
/// [_i6.ConfigContainerScreen]
class ConfigContainerScreenRoute extends _i39.PageRouteInfo<void> {
  const ConfigContainerScreenRoute()
      : super(
          ConfigContainerScreenRoute.name,
          path: 'config',
        );

  static const String name = 'ConfigContainerScreenRoute';
}

/// generated route for
/// [_i7.SmartContractCreatorContainerScreen]
class SmartContractCreatorContainerScreenRoute
    extends _i39.PageRouteInfo<void> {
  const SmartContractCreatorContainerScreenRoute(
      {List<_i39.PageRouteInfo>? children})
      : super(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          initialChildren: children,
        );

  static const String name = 'SmartContractCreatorContainerScreenRoute';
}

/// generated route for
/// [_i8.MotherDashboardScreen]
class MotherDashboardScreenRoute extends _i39.PageRouteInfo<void> {
  const MotherDashboardScreenRoute()
      : super(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        );

  static const String name = 'MotherDashboardScreenRoute';
}

/// generated route for
/// [_i9.RemoteShopContainerScreen]
class RemoteShopContainerScreenRoute extends _i39.PageRouteInfo<void> {
  const RemoteShopContainerScreenRoute({List<_i39.PageRouteInfo>? children})
      : super(
          RemoteShopContainerScreenRoute.name,
          path: 'remote-shop-container',
          initialChildren: children,
        );

  static const String name = 'RemoteShopContainerScreenRoute';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class HomeTabRouter extends _i39.PageRouteInfo<void> {
  const HomeTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class SendTabRouter extends _i39.PageRouteInfo<void> {
  const SendTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          SendTabRouter.name,
          path: 'send',
          initialChildren: children,
        );

  static const String name = 'SendTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class ReceiveTabRouter extends _i39.PageRouteInfo<void> {
  const ReceiveTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          ReceiveTabRouter.name,
          path: 'receive',
          initialChildren: children,
        );

  static const String name = 'ReceiveTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class TransactionsTabRouter extends _i39.PageRouteInfo<void> {
  const TransactionsTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          TransactionsTabRouter.name,
          path: 'transactions',
          initialChildren: children,
        );

  static const String name = 'TransactionsTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class ValidatorTabRouter extends _i39.PageRouteInfo<void> {
  const ValidatorTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          ValidatorTabRouter.name,
          path: 'validator',
          initialChildren: children,
        );

  static const String name = 'ValidatorTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class AdjudicatorTabRouter extends _i39.PageRouteInfo<void> {
  const AdjudicatorTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          AdjudicatorTabRouter.name,
          path: 'adjudicator',
          initialChildren: children,
        );

  static const String name = 'AdjudicatorTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class NodesTabsRouter extends _i39.PageRouteInfo<void> {
  const NodesTabsRouter({List<_i39.PageRouteInfo>? children})
      : super(
          NodesTabsRouter.name,
          path: 'nodes',
          initialChildren: children,
        );

  static const String name = 'NodesTabsRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class DatanodeTabRouter extends _i39.PageRouteInfo<void> {
  const DatanodeTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          DatanodeTabRouter.name,
          path: 'datanode',
          initialChildren: children,
        );

  static const String name = 'DatanodeTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class NftTabRouter extends _i39.PageRouteInfo<void> {
  const NftTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          NftTabRouter.name,
          path: 'nft',
          initialChildren: children,
        );

  static const String name = 'NftTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class SmartContractsTabRouter extends _i39.PageRouteInfo<void> {
  const SmartContractsTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          SmartContractsTabRouter.name,
          path: 'smart-contracts',
          initialChildren: children,
        );

  static const String name = 'SmartContractsTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class DstsTabRouter extends _i39.PageRouteInfo<void> {
  const DstsTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          DstsTabRouter.name,
          path: 'dsts',
          initialChildren: children,
        );

  static const String name = 'DstsTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class AdnrTabRouter extends _i39.PageRouteInfo<void> {
  const AdnrTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          AdnrTabRouter.name,
          path: 'adnr',
          initialChildren: children,
        );

  static const String name = 'AdnrTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class VotingTabRouter extends _i39.PageRouteInfo<void> {
  const VotingTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          VotingTabRouter.name,
          path: 'voting',
          initialChildren: children,
        );

  static const String name = 'VotingTabRouter';
}

/// generated route for
/// [_i10.EmptyRouterPage]
class BeaconTabRouter extends _i39.PageRouteInfo<void> {
  const BeaconTabRouter({List<_i39.PageRouteInfo>? children})
      : super(
          BeaconTabRouter.name,
          path: 'beacons',
          initialChildren: children,
        );

  static const String name = 'BeaconTabRouter';
}

/// generated route for
/// [_i11.HomeScreen]
class HomeScreenRoute extends _i39.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i12.ReserveAccountOverviewScreen]
class ReserveAccountOverviewScreenRoute extends _i39.PageRouteInfo<void> {
  const ReserveAccountOverviewScreenRoute()
      : super(
          ReserveAccountOverviewScreenRoute.name,
          path: 'reserve-accounts',
        );

  static const String name = 'ReserveAccountOverviewScreenRoute';
}

/// generated route for
/// [_i13.SendScreen]
class SendScreenRoute extends _i39.PageRouteInfo<void> {
  const SendScreenRoute()
      : super(
          SendScreenRoute.name,
          path: '',
        );

  static const String name = 'SendScreenRoute';
}

/// generated route for
/// [_i14.ReceiveScreen]
class ReceiveScreenRoute extends _i39.PageRouteInfo<void> {
  const ReceiveScreenRoute()
      : super(
          ReceiveScreenRoute.name,
          path: '',
        );

  static const String name = 'ReceiveScreenRoute';
}

/// generated route for
/// [_i15.TransactionsScreen]
class TransactionsScreenRoute extends _i39.PageRouteInfo<void> {
  const TransactionsScreenRoute()
      : super(
          TransactionsScreenRoute.name,
          path: '',
        );

  static const String name = 'TransactionsScreenRoute';
}

/// generated route for
/// [_i16.ValidatorScreen]
class ValidatorScreenRoute extends _i39.PageRouteInfo<void> {
  const ValidatorScreenRoute()
      : super(
          ValidatorScreenRoute.name,
          path: '',
        );

  static const String name = 'ValidatorScreenRoute';
}

/// generated route for
/// [_i17.AdjudicatorScreen]
class AdjudicatorScreenRoute extends _i39.PageRouteInfo<void> {
  const AdjudicatorScreenRoute()
      : super(
          AdjudicatorScreenRoute.name,
          path: '',
        );

  static const String name = 'AdjudicatorScreenRoute';
}

/// generated route for
/// [_i18.NodeListScreen]
class NodeListScreenRoute extends _i39.PageRouteInfo<void> {
  const NodeListScreenRoute()
      : super(
          NodeListScreenRoute.name,
          path: '',
        );

  static const String name = 'NodeListScreenRoute';
}

/// generated route for
/// [_i19.DataNodeScreen]
class DataNodeScreenRoute extends _i39.PageRouteInfo<void> {
  const DataNodeScreenRoute()
      : super(
          DataNodeScreenRoute.name,
          path: '',
        );

  static const String name = 'DataNodeScreenRoute';
}

/// generated route for
/// [_i20.NftListScreen]
class NftListScreenRoute extends _i39.PageRouteInfo<void> {
  const NftListScreenRoute()
      : super(
          NftListScreenRoute.name,
          path: '',
        );

  static const String name = 'NftListScreenRoute';
}

/// generated route for
/// [_i21.SmartContractsScreen]
class SmartContractsScreenRoute extends _i39.PageRouteInfo<void> {
  const SmartContractsScreenRoute()
      : super(
          SmartContractsScreenRoute.name,
          path: '',
        );

  static const String name = 'SmartContractsScreenRoute';
}

/// generated route for
/// [_i22.DstLandingScreen]
class DstLandingScreenRoute extends _i39.PageRouteInfo<void> {
  const DstLandingScreenRoute()
      : super(
          DstLandingScreenRoute.name,
          path: '',
        );

  static const String name = 'DstLandingScreenRoute';
}

/// generated route for
/// [_i23.MyCollectionsListScreen]
class MyCollectionsListScreenRoute extends _i39.PageRouteInfo<void> {
  const MyCollectionsListScreenRoute()
      : super(
          MyCollectionsListScreenRoute.name,
          path: 'me',
        );

  static const String name = 'MyCollectionsListScreenRoute';
}

/// generated route for
/// [_i24.MyCollectionDetailScreen]
class MyCollectionDetailScreenRoute
    extends _i39.PageRouteInfo<MyCollectionDetailScreenRouteArgs> {
  MyCollectionDetailScreenRoute({
    _i40.Key? key,
    required int collectionId,
  }) : super(
          MyCollectionDetailScreenRoute.name,
          path: ':collectionId',
          args: MyCollectionDetailScreenRouteArgs(
            key: key,
            collectionId: collectionId,
          ),
          rawPathParams: {'collectionId': collectionId},
        );

  static const String name = 'MyCollectionDetailScreenRoute';
}

class MyCollectionDetailScreenRouteArgs {
  const MyCollectionDetailScreenRouteArgs({
    this.key,
    required this.collectionId,
  });

  final _i40.Key? key;

  final int collectionId;

  @override
  String toString() {
    return 'MyCollectionDetailScreenRouteArgs{key: $key, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i25.CreateCollectionContainerScreen]
class CreateCollectionContainerScreenRoute extends _i39.PageRouteInfo<void> {
  const CreateCollectionContainerScreenRoute()
      : super(
          CreateCollectionContainerScreenRoute.name,
          path: 'createCollection',
        );

  static const String name = 'CreateCollectionContainerScreenRoute';
}

/// generated route for
/// [_i26.CreateDecShopContainerScreen]
class CreateDecShopContainerScreenRoute extends _i39.PageRouteInfo<void> {
  const CreateDecShopContainerScreenRoute()
      : super(
          CreateDecShopContainerScreenRoute.name,
          path: 'createDecShop',
        );

  static const String name = 'CreateDecShopContainerScreenRoute';
}

/// generated route for
/// [_i27.ListingDetailScreen]
class ListingDetailScreenRoute
    extends _i39.PageRouteInfo<ListingDetailScreenRouteArgs> {
  ListingDetailScreenRoute({
    _i40.Key? key,
    required int listingId,
  }) : super(
          ListingDetailScreenRoute.name,
          path: ':listingId',
          args: ListingDetailScreenRouteArgs(
            key: key,
            listingId: listingId,
          ),
          rawPathParams: {'listingId': listingId},
        );

  static const String name = 'ListingDetailScreenRoute';
}

class ListingDetailScreenRouteArgs {
  const ListingDetailScreenRouteArgs({
    this.key,
    required this.listingId,
  });

  final _i40.Key? key;

  final int listingId;

  @override
  String toString() {
    return 'ListingDetailScreenRouteArgs{key: $key, listingId: $listingId}';
  }
}

/// generated route for
/// [_i28.CreateListingContainerScreen]
class CreateListingContainerScreenRoute
    extends _i39.PageRouteInfo<CreateListingContainerScreenRouteArgs> {
  CreateListingContainerScreenRoute({
    required int collectionId,
    _i40.Key? key,
  }) : super(
          CreateListingContainerScreenRoute.name,
          path: 'createListing/:collectionId',
          args: CreateListingContainerScreenRouteArgs(
            collectionId: collectionId,
            key: key,
          ),
          rawPathParams: {'collectionId': collectionId},
        );

  static const String name = 'CreateListingContainerScreenRoute';
}

class CreateListingContainerScreenRouteArgs {
  const CreateListingContainerScreenRouteArgs({
    required this.collectionId,
    this.key,
  });

  final int collectionId;

  final _i40.Key? key;

  @override
  String toString() {
    return 'CreateListingContainerScreenRouteArgs{collectionId: $collectionId, key: $key}';
  }
}

/// generated route for
/// [_i29.AdnrScreen]
class AdnrScreenRoute extends _i39.PageRouteInfo<void> {
  const AdnrScreenRoute()
      : super(
          AdnrScreenRoute.name,
          path: '',
        );

  static const String name = 'AdnrScreenRoute';
}

/// generated route for
/// [_i30.TopicListScreen]
class TopicListScreenRoute extends _i39.PageRouteInfo<void> {
  const TopicListScreenRoute()
      : super(
          TopicListScreenRoute.name,
          path: '',
        );

  static const String name = 'TopicListScreenRoute';
}

/// generated route for
/// [_i31.TopicDetailScreen]
class TopicDetailScreenRoute
    extends _i39.PageRouteInfo<TopicDetailScreenRouteArgs> {
  TopicDetailScreenRoute({
    _i40.Key? key,
    required String topicUid,
  }) : super(
          TopicDetailScreenRoute.name,
          path: ':uid',
          args: TopicDetailScreenRouteArgs(
            key: key,
            topicUid: topicUid,
          ),
          rawPathParams: {'uid': topicUid},
        );

  static const String name = 'TopicDetailScreenRoute';
}

class TopicDetailScreenRouteArgs {
  const TopicDetailScreenRouteArgs({
    this.key,
    required this.topicUid,
  });

  final _i40.Key? key;

  final String topicUid;

  @override
  String toString() {
    return 'TopicDetailScreenRouteArgs{key: $key, topicUid: $topicUid}';
  }
}

/// generated route for
/// [_i32.CreateTopicScreen]
class CreateTopicScreenRoute extends _i39.PageRouteInfo<void> {
  const CreateTopicScreenRoute()
      : super(
          CreateTopicScreenRoute.name,
          path: 'create',
        );

  static const String name = 'CreateTopicScreenRoute';
}

/// generated route for
/// [_i33.BeaconListScreen]
class BeaconListScreenRoute extends _i39.PageRouteInfo<void> {
  const BeaconListScreenRoute()
      : super(
          BeaconListScreenRoute.name,
          path: '',
        );

  static const String name = 'BeaconListScreenRoute';
}

/// generated route for
/// [_i34.SmartContractCreatorMain]
class SmartContractCreatorMainRoute extends _i39.PageRouteInfo<void> {
  const SmartContractCreatorMainRoute()
      : super(
          SmartContractCreatorMainRoute.name,
          path: 'main',
        );

  static const String name = 'SmartContractCreatorMainRoute';
}

/// generated route for
/// [_i35.RemoteShopListScreen]
class RemoteShopListScreenRoute extends _i39.PageRouteInfo<void> {
  const RemoteShopListScreenRoute()
      : super(
          RemoteShopListScreenRoute.name,
          path: 'shops',
        );

  static const String name = 'RemoteShopListScreenRoute';
}

/// generated route for
/// [_i36.RemoteShopDetailScreen]
class RemoteShopDetailScreenRoute
    extends _i39.PageRouteInfo<RemoteShopDetailScreenRouteArgs> {
  RemoteShopDetailScreenRoute({
    _i40.Key? key,
    required String shopUrl,
  }) : super(
          RemoteShopDetailScreenRoute.name,
          path: 'shops/:url',
          args: RemoteShopDetailScreenRouteArgs(
            key: key,
            shopUrl: shopUrl,
          ),
          rawPathParams: {'url': shopUrl},
        );

  static const String name = 'RemoteShopDetailScreenRoute';
}

class RemoteShopDetailScreenRouteArgs {
  const RemoteShopDetailScreenRouteArgs({
    this.key,
    required this.shopUrl,
  });

  final _i40.Key? key;

  final String shopUrl;

  @override
  String toString() {
    return 'RemoteShopDetailScreenRouteArgs{key: $key, shopUrl: $shopUrl}';
  }
}

/// generated route for
/// [_i37.ShopChatScreen]
class ShopChatScreenRoute extends _i39.PageRouteInfo<ShopChatScreenRouteArgs> {
  ShopChatScreenRoute({
    _i40.Key? key,
    required String shopUrl,
  }) : super(
          ShopChatScreenRoute.name,
          path: 'shops/:url/chat',
          args: ShopChatScreenRouteArgs(
            key: key,
            shopUrl: shopUrl,
          ),
          rawPathParams: {'url': shopUrl},
        );

  static const String name = 'ShopChatScreenRoute';
}

class ShopChatScreenRouteArgs {
  const ShopChatScreenRouteArgs({
    this.key,
    required this.shopUrl,
  });

  final _i40.Key? key;

  final String shopUrl;

  @override
  String toString() {
    return 'ShopChatScreenRouteArgs{key: $key, shopUrl: $shopUrl}';
  }
}

/// generated route for
/// [_i38.RemoteShopCollectionScreen]
class RemoteShopCollectionScreenRoute
    extends _i39.PageRouteInfo<RemoteShopCollectionScreenRouteArgs> {
  RemoteShopCollectionScreenRoute({
    _i40.Key? key,
    required int collectionId,
    required String url,
  }) : super(
          RemoteShopCollectionScreenRoute.name,
          path: 'shops/:url/collection/:collectionId',
          args: RemoteShopCollectionScreenRouteArgs(
            key: key,
            collectionId: collectionId,
            url: url,
          ),
          rawPathParams: {
            'collectionId': collectionId,
            'url': url,
          },
        );

  static const String name = 'RemoteShopCollectionScreenRoute';
}

class RemoteShopCollectionScreenRouteArgs {
  const RemoteShopCollectionScreenRouteArgs({
    this.key,
    required this.collectionId,
    required this.url,
  });

  final _i40.Key? key;

  final int collectionId;

  final String url;

  @override
  String toString() {
    return 'RemoteShopCollectionScreenRouteArgs{key: $key, collectionId: $collectionId, url: $url}';
  }
}
