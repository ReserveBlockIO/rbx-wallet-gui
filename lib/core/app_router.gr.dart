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
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:auto_route/empty_router_widgets.dart' as _i9;
import 'package:flutter/material.dart' as _i32;
import 'package:rbx_wallet/features/adjudicator/adjudicator_screen.dart'
    as _i15;
import 'package:rbx_wallet/features/adnr/screens/adnr_screen.dart' as _i25;
import 'package:rbx_wallet/features/beacon/screens/beacon_list_screen.dart'
    as _i29;
import 'package:rbx_wallet/features/config/screens/config_container_screen.dart'
    as _i6;
import 'package:rbx_wallet/features/datanode/screens/datanode_screen.dart'
    as _i17;
import 'package:rbx_wallet/features/dst/screens/create_listing_container_screen.dart'
    as _i24;
import 'package:rbx_wallet/features/dst/screens/create_store_container_screen.dart'
    as _i22;
import 'package:rbx_wallet/features/dst/screens/listing_detail_screen.dart'
    as _i23;
import 'package:rbx_wallet/features/dst/screens/my_store_detail_screen.dart'
    as _i21;
import 'package:rbx_wallet/features/dst/screens/my_stores_list_screen.dart'
    as _i20;
import 'package:rbx_wallet/features/home/screens/home_screen.dart' as _i10;
import 'package:rbx_wallet/features/mother/screens/mother_dashboard_screen.dart'
    as _i8;
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart' as _i18;
import 'package:rbx_wallet/features/node/screens/node_list_screen.dart' as _i16;
import 'package:rbx_wallet/features/receive/screens/receive_screen.dart'
    as _i12;
import 'package:rbx_wallet/features/root/root_container.dart' as _i1;
import 'package:rbx_wallet/features/send/screens/send_screen.dart' as _i11;
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/smart_contract_creator_main.dart'
    as _i30;
import 'package:rbx_wallet/features/smart_contracts/screens/bulk_create_screen.dart'
    as _i5;
import 'package:rbx_wallet/features/smart_contracts/screens/my_smart_contracts_screen.dart'
    as _i2;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart'
    as _i7;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_drafts_screen.dart'
    as _i3;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contracts_screen.dart'
    as _i19;
import 'package:rbx_wallet/features/smart_contracts/screens/template_chooser_screen.dart'
    as _i4;
import 'package:rbx_wallet/features/transactions/screens/transactions_screen.dart'
    as _i13;
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart'
    as _i14;
import 'package:rbx_wallet/features/voting/screens/create_topic_screen.dart'
    as _i28;
import 'package:rbx_wallet/features/voting/screens/topic_detail_screen.dart'
    as _i27;
import 'package:rbx_wallet/features/voting/screens/topic_list_screen.dart'
    as _i26;

class AppRouter extends _i31.RootStackRouter {
  AppRouter([_i32.GlobalKey<_i32.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    RootContainerRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.RootContainer(),
      );
    },
    MySmartContractsScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MySmartContractsScreen(),
      );
    },
    SmartContractDraftsScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SmartContractDraftsScreen(),
      );
    },
    TemplateChooserScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.TemplateChooserScreen(),
      );
    },
    BulkCreateScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.BulkCreateScreen(),
      );
    },
    ConfigContainerScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ConfigContainerScreen(),
      );
    },
    SmartContractCreatorContainerScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SmartContractCreatorContainerScreen(),
      );
    },
    MotherDashboardScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.MotherDashboardScreen(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    SendTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    ReceiveTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    TransactionsTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    ValidatorTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    AdjudicatorTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    NodesTabsRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    DatanodeTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    NftTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    SmartContractsTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    DstsTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    AdnrTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    VotingTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    BeaconTabRouter.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeScreen(),
      );
    },
    SendScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.SendScreen(),
      );
    },
    ReceiveScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.ReceiveScreen(),
      );
    },
    TransactionsScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.TransactionsScreen(),
      );
    },
    ValidatorScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.ValidatorScreen(),
      );
    },
    AdjudicatorScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.AdjudicatorScreen(),
      );
    },
    NodeListScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.NodeListScreen(),
      );
    },
    DataNodeScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.DataNodeScreen(),
      );
    },
    NftListScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.NftListScreen(),
      );
    },
    SmartContractsScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.SmartContractsScreen(),
      );
    },
    MyCollectionsListScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.MyCollectionsListScreen(),
      );
    },
    MyCollectionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MyCollectionDetailScreenRouteArgs>(
          orElse: () => MyCollectionDetailScreenRouteArgs(
              collectionId: pathParams.getInt('collectionId')));
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i21.MyCollectionDetailScreen(
          key: args.key,
          collectionId: args.collectionId,
        ),
      );
    },
    CreateCollectionContainerScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.CreateCollectionContainerScreen(),
      );
    },
    ListingDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ListingDetailScreenRouteArgs>(
          orElse: () => ListingDetailScreenRouteArgs(
              listingId: pathParams.getInt('listingId')));
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i23.ListingDetailScreen(
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
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i24.CreateListingContainerScreen(
          args.collectionId,
          key: args.key,
        ),
      );
    },
    AdnrScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i25.AdnrScreen(),
      );
    },
    TopicListScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i26.TopicListScreen(),
      );
    },
    TopicDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TopicDetailScreenRouteArgs>(
          orElse: () => TopicDetailScreenRouteArgs(
              topicUid: pathParams.getString('uid')));
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.TopicDetailScreen(
          key: args.key,
          topicUid: args.topicUid,
        ),
      );
    },
    CreateTopicScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.CreateTopicScreen(),
      );
    },
    BeaconListScreenRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.BeaconListScreen(),
      );
    },
    SmartContractCreatorMainRoute.name: (routeData) {
      return _i31.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i30.SmartContractCreatorMain(),
      );
    },
  };

  @override
  List<_i31.RouteConfig> get routes => [
        _i31.RouteConfig(
          RootContainerRoute.name,
          path: '/',
          children: [
            _i31.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              SendTabRouter.name,
              path: 'send',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  SendScreenRoute.name,
                  path: '',
                  parent: SendTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              ReceiveTabRouter.name,
              path: 'receive',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  ReceiveScreenRoute.name,
                  path: '',
                  parent: ReceiveTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              TransactionsTabRouter.name,
              path: 'transactions',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  TransactionsScreenRoute.name,
                  path: '',
                  parent: TransactionsTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              ValidatorTabRouter.name,
              path: 'validator',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  ValidatorScreenRoute.name,
                  path: '',
                  parent: ValidatorTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              AdjudicatorTabRouter.name,
              path: 'adjudicator',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  AdjudicatorScreenRoute.name,
                  path: '',
                  parent: AdjudicatorTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              NodesTabsRouter.name,
              path: 'nodes',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  NodeListScreenRoute.name,
                  path: '',
                  parent: NodesTabsRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              DatanodeTabRouter.name,
              path: 'datanode',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  DataNodeScreenRoute.name,
                  path: '',
                  parent: DatanodeTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              NftTabRouter.name,
              path: 'nft',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  NftListScreenRoute.name,
                  path: '',
                  parent: NftTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              SmartContractsTabRouter.name,
              path: 'smart-contracts',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  SmartContractsScreenRoute.name,
                  path: '',
                  parent: SmartContractsTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              DstsTabRouter.name,
              path: 'dsts',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  MyCollectionsListScreenRoute.name,
                  path: '',
                  parent: DstsTabRouter.name,
                ),
                _i31.RouteConfig(
                  MyCollectionDetailScreenRoute.name,
                  path: ':collectionId',
                  parent: DstsTabRouter.name,
                ),
                _i31.RouteConfig(
                  CreateCollectionContainerScreenRoute.name,
                  path: 'createCollection',
                  parent: DstsTabRouter.name,
                ),
                _i31.RouteConfig(
                  ListingDetailScreenRoute.name,
                  path: ':listingId',
                  parent: DstsTabRouter.name,
                ),
                _i31.RouteConfig(
                  CreateListingContainerScreenRoute.name,
                  path: 'createListing/:collectionId',
                  parent: DstsTabRouter.name,
                ),
              ],
            ),
            _i31.RouteConfig(
              AdnrTabRouter.name,
              path: 'adnr',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  AdnrScreenRoute.name,
                  path: '',
                  parent: AdnrTabRouter.name,
                )
              ],
            ),
            _i31.RouteConfig(
              VotingTabRouter.name,
              path: 'voting',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  TopicListScreenRoute.name,
                  path: '',
                  parent: VotingTabRouter.name,
                ),
                _i31.RouteConfig(
                  TopicDetailScreenRoute.name,
                  path: ':uid',
                  parent: VotingTabRouter.name,
                ),
                _i31.RouteConfig(
                  CreateTopicScreenRoute.name,
                  path: 'create',
                  parent: VotingTabRouter.name,
                ),
              ],
            ),
            _i31.RouteConfig(
              BeaconTabRouter.name,
              path: 'beacons',
              parent: RootContainerRoute.name,
              children: [
                _i31.RouteConfig(
                  BeaconListScreenRoute.name,
                  path: '',
                  parent: BeaconTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i31.RouteConfig(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        ),
        _i31.RouteConfig(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        ),
        _i31.RouteConfig(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        ),
        _i31.RouteConfig(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        ),
        _i31.RouteConfig(
          ConfigContainerScreenRoute.name,
          path: 'config',
        ),
        _i31.RouteConfig(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          children: [
            _i31.RouteConfig(
              '#redirect',
              path: '',
              parent: SmartContractCreatorContainerScreenRoute.name,
              redirectTo: 'main',
              fullMatch: true,
            ),
            _i31.RouteConfig(
              SmartContractCreatorMainRoute.name,
              path: 'main',
              parent: SmartContractCreatorContainerScreenRoute.name,
            ),
          ],
        ),
        _i31.RouteConfig(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        ),
      ];
}

/// generated route for
/// [_i1.RootContainer]
class RootContainerRoute extends _i31.PageRouteInfo<void> {
  const RootContainerRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RootContainerRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootContainerRoute';
}

/// generated route for
/// [_i2.MySmartContractsScreen]
class MySmartContractsScreenRoute extends _i31.PageRouteInfo<void> {
  const MySmartContractsScreenRoute()
      : super(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        );

  static const String name = 'MySmartContractsScreenRoute';
}

/// generated route for
/// [_i3.SmartContractDraftsScreen]
class SmartContractDraftsScreenRoute extends _i31.PageRouteInfo<void> {
  const SmartContractDraftsScreenRoute()
      : super(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        );

  static const String name = 'SmartContractDraftsScreenRoute';
}

/// generated route for
/// [_i4.TemplateChooserScreen]
class TemplateChooserScreenRoute extends _i31.PageRouteInfo<void> {
  const TemplateChooserScreenRoute()
      : super(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        );

  static const String name = 'TemplateChooserScreenRoute';
}

/// generated route for
/// [_i5.BulkCreateScreen]
class BulkCreateScreenRoute extends _i31.PageRouteInfo<void> {
  const BulkCreateScreenRoute()
      : super(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        );

  static const String name = 'BulkCreateScreenRoute';
}

/// generated route for
/// [_i6.ConfigContainerScreen]
class ConfigContainerScreenRoute extends _i31.PageRouteInfo<void> {
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
    extends _i31.PageRouteInfo<void> {
  const SmartContractCreatorContainerScreenRoute(
      {List<_i31.PageRouteInfo>? children})
      : super(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          initialChildren: children,
        );

  static const String name = 'SmartContractCreatorContainerScreenRoute';
}

/// generated route for
/// [_i8.MotherDashboardScreen]
class MotherDashboardScreenRoute extends _i31.PageRouteInfo<void> {
  const MotherDashboardScreenRoute()
      : super(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        );

  static const String name = 'MotherDashboardScreenRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class HomeTabRouter extends _i31.PageRouteInfo<void> {
  const HomeTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class SendTabRouter extends _i31.PageRouteInfo<void> {
  const SendTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          SendTabRouter.name,
          path: 'send',
          initialChildren: children,
        );

  static const String name = 'SendTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ReceiveTabRouter extends _i31.PageRouteInfo<void> {
  const ReceiveTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          ReceiveTabRouter.name,
          path: 'receive',
          initialChildren: children,
        );

  static const String name = 'ReceiveTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class TransactionsTabRouter extends _i31.PageRouteInfo<void> {
  const TransactionsTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          TransactionsTabRouter.name,
          path: 'transactions',
          initialChildren: children,
        );

  static const String name = 'TransactionsTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ValidatorTabRouter extends _i31.PageRouteInfo<void> {
  const ValidatorTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          ValidatorTabRouter.name,
          path: 'validator',
          initialChildren: children,
        );

  static const String name = 'ValidatorTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class AdjudicatorTabRouter extends _i31.PageRouteInfo<void> {
  const AdjudicatorTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          AdjudicatorTabRouter.name,
          path: 'adjudicator',
          initialChildren: children,
        );

  static const String name = 'AdjudicatorTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class NodesTabsRouter extends _i31.PageRouteInfo<void> {
  const NodesTabsRouter({List<_i31.PageRouteInfo>? children})
      : super(
          NodesTabsRouter.name,
          path: 'nodes',
          initialChildren: children,
        );

  static const String name = 'NodesTabsRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class DatanodeTabRouter extends _i31.PageRouteInfo<void> {
  const DatanodeTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          DatanodeTabRouter.name,
          path: 'datanode',
          initialChildren: children,
        );

  static const String name = 'DatanodeTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class NftTabRouter extends _i31.PageRouteInfo<void> {
  const NftTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          NftTabRouter.name,
          path: 'nft',
          initialChildren: children,
        );

  static const String name = 'NftTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class SmartContractsTabRouter extends _i31.PageRouteInfo<void> {
  const SmartContractsTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          SmartContractsTabRouter.name,
          path: 'smart-contracts',
          initialChildren: children,
        );

  static const String name = 'SmartContractsTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class DstsTabRouter extends _i31.PageRouteInfo<void> {
  const DstsTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          DstsTabRouter.name,
          path: 'dsts',
          initialChildren: children,
        );

  static const String name = 'DstsTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class AdnrTabRouter extends _i31.PageRouteInfo<void> {
  const AdnrTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          AdnrTabRouter.name,
          path: 'adnr',
          initialChildren: children,
        );

  static const String name = 'AdnrTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class VotingTabRouter extends _i31.PageRouteInfo<void> {
  const VotingTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          VotingTabRouter.name,
          path: 'voting',
          initialChildren: children,
        );

  static const String name = 'VotingTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class BeaconTabRouter extends _i31.PageRouteInfo<void> {
  const BeaconTabRouter({List<_i31.PageRouteInfo>? children})
      : super(
          BeaconTabRouter.name,
          path: 'beacons',
          initialChildren: children,
        );

  static const String name = 'BeaconTabRouter';
}

/// generated route for
/// [_i10.HomeScreen]
class HomeScreenRoute extends _i31.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i11.SendScreen]
class SendScreenRoute extends _i31.PageRouteInfo<void> {
  const SendScreenRoute()
      : super(
          SendScreenRoute.name,
          path: '',
        );

  static const String name = 'SendScreenRoute';
}

/// generated route for
/// [_i12.ReceiveScreen]
class ReceiveScreenRoute extends _i31.PageRouteInfo<void> {
  const ReceiveScreenRoute()
      : super(
          ReceiveScreenRoute.name,
          path: '',
        );

  static const String name = 'ReceiveScreenRoute';
}

/// generated route for
/// [_i13.TransactionsScreen]
class TransactionsScreenRoute extends _i31.PageRouteInfo<void> {
  const TransactionsScreenRoute()
      : super(
          TransactionsScreenRoute.name,
          path: '',
        );

  static const String name = 'TransactionsScreenRoute';
}

/// generated route for
/// [_i14.ValidatorScreen]
class ValidatorScreenRoute extends _i31.PageRouteInfo<void> {
  const ValidatorScreenRoute()
      : super(
          ValidatorScreenRoute.name,
          path: '',
        );

  static const String name = 'ValidatorScreenRoute';
}

/// generated route for
/// [_i15.AdjudicatorScreen]
class AdjudicatorScreenRoute extends _i31.PageRouteInfo<void> {
  const AdjudicatorScreenRoute()
      : super(
          AdjudicatorScreenRoute.name,
          path: '',
        );

  static const String name = 'AdjudicatorScreenRoute';
}

/// generated route for
/// [_i16.NodeListScreen]
class NodeListScreenRoute extends _i31.PageRouteInfo<void> {
  const NodeListScreenRoute()
      : super(
          NodeListScreenRoute.name,
          path: '',
        );

  static const String name = 'NodeListScreenRoute';
}

/// generated route for
/// [_i17.DataNodeScreen]
class DataNodeScreenRoute extends _i31.PageRouteInfo<void> {
  const DataNodeScreenRoute()
      : super(
          DataNodeScreenRoute.name,
          path: '',
        );

  static const String name = 'DataNodeScreenRoute';
}

/// generated route for
/// [_i18.NftListScreen]
class NftListScreenRoute extends _i31.PageRouteInfo<void> {
  const NftListScreenRoute()
      : super(
          NftListScreenRoute.name,
          path: '',
        );

  static const String name = 'NftListScreenRoute';
}

/// generated route for
/// [_i19.SmartContractsScreen]
class SmartContractsScreenRoute extends _i31.PageRouteInfo<void> {
  const SmartContractsScreenRoute()
      : super(
          SmartContractsScreenRoute.name,
          path: '',
        );

  static const String name = 'SmartContractsScreenRoute';
}

/// generated route for
/// [_i20.MyCollectionsListScreen]
class MyCollectionsListScreenRoute extends _i31.PageRouteInfo<void> {
  const MyCollectionsListScreenRoute()
      : super(
          MyCollectionsListScreenRoute.name,
          path: '',
        );

  static const String name = 'MyCollectionsListScreenRoute';
}

/// generated route for
/// [_i21.MyCollectionDetailScreen]
class MyCollectionDetailScreenRoute
    extends _i31.PageRouteInfo<MyCollectionDetailScreenRouteArgs> {
  MyCollectionDetailScreenRoute({
    _i32.Key? key,
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

  final _i32.Key? key;

  final int collectionId;

  @override
  String toString() {
    return 'MyCollectionDetailScreenRouteArgs{key: $key, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i22.CreateCollectionContainerScreen]
class CreateCollectionContainerScreenRoute extends _i31.PageRouteInfo<void> {
  const CreateCollectionContainerScreenRoute()
      : super(
          CreateCollectionContainerScreenRoute.name,
          path: 'createCollection',
        );

  static const String name = 'CreateCollectionContainerScreenRoute';
}

/// generated route for
/// [_i23.ListingDetailScreen]
class ListingDetailScreenRoute
    extends _i31.PageRouteInfo<ListingDetailScreenRouteArgs> {
  ListingDetailScreenRoute({
    _i32.Key? key,
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

  final _i32.Key? key;

  final int listingId;

  @override
  String toString() {
    return 'ListingDetailScreenRouteArgs{key: $key, listingId: $listingId}';
  }
}

/// generated route for
/// [_i24.CreateListingContainerScreen]
class CreateListingContainerScreenRoute
    extends _i31.PageRouteInfo<CreateListingContainerScreenRouteArgs> {
  CreateListingContainerScreenRoute({
    required int collectionId,
    _i32.Key? key,
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

  final _i32.Key? key;

  @override
  String toString() {
    return 'CreateListingContainerScreenRouteArgs{collectionId: $collectionId, key: $key}';
  }
}

/// generated route for
/// [_i25.AdnrScreen]
class AdnrScreenRoute extends _i31.PageRouteInfo<void> {
  const AdnrScreenRoute()
      : super(
          AdnrScreenRoute.name,
          path: '',
        );

  static const String name = 'AdnrScreenRoute';
}

/// generated route for
/// [_i26.TopicListScreen]
class TopicListScreenRoute extends _i31.PageRouteInfo<void> {
  const TopicListScreenRoute()
      : super(
          TopicListScreenRoute.name,
          path: '',
        );

  static const String name = 'TopicListScreenRoute';
}

/// generated route for
/// [_i27.TopicDetailScreen]
class TopicDetailScreenRoute
    extends _i31.PageRouteInfo<TopicDetailScreenRouteArgs> {
  TopicDetailScreenRoute({
    _i32.Key? key,
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

  final _i32.Key? key;

  final String topicUid;

  @override
  String toString() {
    return 'TopicDetailScreenRouteArgs{key: $key, topicUid: $topicUid}';
  }
}

/// generated route for
/// [_i28.CreateTopicScreen]
class CreateTopicScreenRoute extends _i31.PageRouteInfo<void> {
  const CreateTopicScreenRoute()
      : super(
          CreateTopicScreenRoute.name,
          path: 'create',
        );

  static const String name = 'CreateTopicScreenRoute';
}

/// generated route for
/// [_i29.BeaconListScreen]
class BeaconListScreenRoute extends _i31.PageRouteInfo<void> {
  const BeaconListScreenRoute()
      : super(
          BeaconListScreenRoute.name,
          path: '',
        );

  static const String name = 'BeaconListScreenRoute';
}

/// generated route for
/// [_i30.SmartContractCreatorMain]
class SmartContractCreatorMainRoute extends _i31.PageRouteInfo<void> {
  const SmartContractCreatorMainRoute()
      : super(
          SmartContractCreatorMainRoute.name,
          path: 'main',
        );

  static const String name = 'SmartContractCreatorMainRoute';
}
