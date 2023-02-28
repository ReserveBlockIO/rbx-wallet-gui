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
import 'package:auto_route/auto_route.dart' as _i29;
import 'package:auto_route/empty_router_widgets.dart' as _i9;
import 'package:flutter/material.dart' as _i30;
import 'package:rbx_wallet/features/adjudicator/adjudicator_screen.dart' as _i15;
import 'package:rbx_wallet/features/adnr/screens/adnr_screen.dart' as _i23;
import 'package:rbx_wallet/features/beacon/screens/beacon_list_screen.dart' as _i27;
import 'package:rbx_wallet/features/config/screens/config_container_screen.dart' as _i6;
import 'package:rbx_wallet/features/datanode/screens/datanode_screen.dart' as _i17;
import 'package:rbx_wallet/features/dst/screens/create_store_container_screen.dart' as _i22;
import 'package:rbx_wallet/features/dst/screens/my_store_detail_screen.dart' as _i21;
import 'package:rbx_wallet/features/dst/screens/my_stores_list_screen.dart' as _i20;
import 'package:rbx_wallet/features/home/screens/home_screen.dart' as _i10;
import 'package:rbx_wallet/features/mother/screens/mother_dashboard_screen.dart' as _i8;
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart' as _i18;
import 'package:rbx_wallet/features/node/screens/node_list_screen.dart' as _i16;
import 'package:rbx_wallet/features/receive/screens/receive_screen.dart' as _i12;
import 'package:rbx_wallet/features/root/root_container.dart' as _i1;
import 'package:rbx_wallet/features/send/screens/send_screen.dart' as _i11;
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/smart_contract_creator_main.dart' as _i28;
import 'package:rbx_wallet/features/smart_contracts/screens/bulk_create_screen.dart' as _i5;
import 'package:rbx_wallet/features/smart_contracts/screens/my_smart_contracts_screen.dart' as _i2;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart' as _i7;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_drafts_screen.dart' as _i3;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contracts_screen.dart' as _i19;
import 'package:rbx_wallet/features/smart_contracts/screens/template_chooser_screen.dart' as _i4;
import 'package:rbx_wallet/features/transactions/screens/transactions_screen.dart' as _i13;
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart' as _i14;
import 'package:rbx_wallet/features/voting/screens/create_topic_screen.dart' as _i26;
import 'package:rbx_wallet/features/voting/screens/topic_detail_screen.dart' as _i25;
import 'package:rbx_wallet/features/voting/screens/topic_list_screen.dart' as _i24;

class AppRouter extends _i29.RootStackRouter {
  AppRouter([_i30.GlobalKey<_i30.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i29.PageFactory> pagesMap = {
    RootContainerRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.RootContainer(),
      );
    },
    MySmartContractsScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MySmartContractsScreen(),
      );
    },
    SmartContractDraftsScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SmartContractDraftsScreen(),
      );
    },
    TemplateChooserScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.TemplateChooserScreen(),
      );
    },
    BulkCreateScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.BulkCreateScreen(),
      );
    },
    ConfigContainerScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ConfigContainerScreen(),
      );
    },
    SmartContractCreatorContainerScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SmartContractCreatorContainerScreen(),
      );
    },
    MotherDashboardScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.MotherDashboardScreen(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    SendTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    ReceiveTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    TransactionsTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    ValidatorTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    AdjudicatorTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    NodesTabsRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    DatanodeTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    NftTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    SmartContractsTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    DstsTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    AdnrTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    VotingTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    BeaconTabRouter.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeScreen(),
      );
    },
    SendScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.SendScreen(),
      );
    },
    ReceiveScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.ReceiveScreen(),
      );
    },
    TransactionsScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.TransactionsScreen(),
      );
    },
    ValidatorScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.ValidatorScreen(),
      );
    },
    AdjudicatorScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.AdjudicatorScreen(),
      );
    },
    NodeListScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.NodeListScreen(),
      );
    },
    DataNodeScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.DataNodeScreen(),
      );
    },
    NftListScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.NftListScreen(),
      );
    },
    SmartContractsScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.SmartContractsScreen(),
      );
    },
    MyStoresListScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.MyStoresListScreen(),
      );
    },
    MyStoreDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MyStoreDetailScreenRouteArgs>(orElse: () => MyStoreDetailScreenRouteArgs(storeId: pathParams.getInt('storeId')));
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i21.MyStoreDetailScreen(
          key: args.key,
          storeId: args.storeId,
        ),
      );
    },
    CreateStoreContainerScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.CreateStoreContainerScreen(),
      );
    },
    AdnrScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.AdnrScreen(),
      );
    },
    TopicListScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.TopicListScreen(),
      );
    },
    TopicDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TopicDetailScreenRouteArgs>(orElse: () => TopicDetailScreenRouteArgs(topicUid: pathParams.getString('uid')));
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i25.TopicDetailScreen(
          key: args.key,
          topicUid: args.topicUid,
        ),
      );
    },
    CreateTopicScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i26.CreateTopicScreen(),
      );
    },
    BeaconListScreenRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i27.BeaconListScreen(),
      );
    },
    SmartContractCreatorMainRoute.name: (routeData) {
      return _i29.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.SmartContractCreatorMain(),
      );
    },
  };

  @override
  List<_i29.RouteConfig> get routes => [
        _i29.RouteConfig(
          RootContainerRoute.name,
          path: '/',
          children: [
            _i29.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              SendTabRouter.name,
              path: 'send',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  SendScreenRoute.name,
                  path: '',
                  parent: SendTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              ReceiveTabRouter.name,
              path: 'receive',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  ReceiveScreenRoute.name,
                  path: '',
                  parent: ReceiveTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              TransactionsTabRouter.name,
              path: 'transactions',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  TransactionsScreenRoute.name,
                  path: '',
                  parent: TransactionsTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              ValidatorTabRouter.name,
              path: 'validator',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  ValidatorScreenRoute.name,
                  path: '',
                  parent: ValidatorTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              AdjudicatorTabRouter.name,
              path: 'adjudicator',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  AdjudicatorScreenRoute.name,
                  path: '',
                  parent: AdjudicatorTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              NodesTabsRouter.name,
              path: 'nodes',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  NodeListScreenRoute.name,
                  path: '',
                  parent: NodesTabsRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              DatanodeTabRouter.name,
              path: 'datanode',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  DataNodeScreenRoute.name,
                  path: '',
                  parent: DatanodeTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              NftTabRouter.name,
              path: 'nft',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  NftListScreenRoute.name,
                  path: '',
                  parent: NftTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              SmartContractsTabRouter.name,
              path: 'smart-contracts',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  SmartContractsScreenRoute.name,
                  path: '',
                  parent: SmartContractsTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              DstsTabRouter.name,
              path: 'dsts',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  MyStoresListScreenRoute.name,
                  path: '',
                  parent: DstsTabRouter.name,
                ),
                _i29.RouteConfig(
                  MyStoreDetailScreenRoute.name,
                  path: ':storeId',
                  parent: DstsTabRouter.name,
                ),
                _i29.RouteConfig(
                  CreateStoreContainerScreenRoute.name,
                  path: 'createStore',
                  parent: DstsTabRouter.name,
                ),
              ],
            ),
            _i29.RouteConfig(
              AdnrTabRouter.name,
              path: 'adnr',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  AdnrScreenRoute.name,
                  path: '',
                  parent: AdnrTabRouter.name,
                )
              ],
            ),
            _i29.RouteConfig(
              VotingTabRouter.name,
              path: 'voting',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  TopicListScreenRoute.name,
                  path: '',
                  parent: VotingTabRouter.name,
                ),
                _i29.RouteConfig(
                  TopicDetailScreenRoute.name,
                  path: ':uid',
                  parent: VotingTabRouter.name,
                ),
                _i29.RouteConfig(
                  CreateTopicScreenRoute.name,
                  path: 'create',
                  parent: VotingTabRouter.name,
                ),
              ],
            ),
            _i29.RouteConfig(
              BeaconTabRouter.name,
              path: 'beacons',
              parent: RootContainerRoute.name,
              children: [
                _i29.RouteConfig(
                  BeaconListScreenRoute.name,
                  path: '',
                  parent: BeaconTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i29.RouteConfig(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        ),
        _i29.RouteConfig(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        ),
        _i29.RouteConfig(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        ),
        _i29.RouteConfig(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        ),
        _i29.RouteConfig(
          ConfigContainerScreenRoute.name,
          path: 'config',
        ),
        _i29.RouteConfig(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          children: [
            _i29.RouteConfig(
              '#redirect',
              path: '',
              parent: SmartContractCreatorContainerScreenRoute.name,
              redirectTo: 'main',
              fullMatch: true,
            ),
            _i29.RouteConfig(
              SmartContractCreatorMainRoute.name,
              path: 'main',
              parent: SmartContractCreatorContainerScreenRoute.name,
            ),
          ],
        ),
        _i29.RouteConfig(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        ),
      ];
}

/// generated route for
/// [_i1.RootContainer]
class RootContainerRoute extends _i29.PageRouteInfo<void> {
  const RootContainerRoute({List<_i29.PageRouteInfo>? children})
      : super(
          RootContainerRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootContainerRoute';
}

/// generated route for
/// [_i2.MySmartContractsScreen]
class MySmartContractsScreenRoute extends _i29.PageRouteInfo<void> {
  const MySmartContractsScreenRoute()
      : super(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        );

  static const String name = 'MySmartContractsScreenRoute';
}

/// generated route for
/// [_i3.SmartContractDraftsScreen]
class SmartContractDraftsScreenRoute extends _i29.PageRouteInfo<void> {
  const SmartContractDraftsScreenRoute()
      : super(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        );

  static const String name = 'SmartContractDraftsScreenRoute';
}

/// generated route for
/// [_i4.TemplateChooserScreen]
class TemplateChooserScreenRoute extends _i29.PageRouteInfo<void> {
  const TemplateChooserScreenRoute()
      : super(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        );

  static const String name = 'TemplateChooserScreenRoute';
}

/// generated route for
/// [_i5.BulkCreateScreen]
class BulkCreateScreenRoute extends _i29.PageRouteInfo<void> {
  const BulkCreateScreenRoute()
      : super(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        );

  static const String name = 'BulkCreateScreenRoute';
}

/// generated route for
/// [_i6.ConfigContainerScreen]
class ConfigContainerScreenRoute extends _i29.PageRouteInfo<void> {
  const ConfigContainerScreenRoute()
      : super(
          ConfigContainerScreenRoute.name,
          path: 'config',
        );

  static const String name = 'ConfigContainerScreenRoute';
}

/// generated route for
/// [_i7.SmartContractCreatorContainerScreen]
class SmartContractCreatorContainerScreenRoute extends _i29.PageRouteInfo<void> {
  const SmartContractCreatorContainerScreenRoute({List<_i29.PageRouteInfo>? children})
      : super(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          initialChildren: children,
        );

  static const String name = 'SmartContractCreatorContainerScreenRoute';
}

/// generated route for
/// [_i8.MotherDashboardScreen]
class MotherDashboardScreenRoute extends _i29.PageRouteInfo<void> {
  const MotherDashboardScreenRoute()
      : super(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        );

  static const String name = 'MotherDashboardScreenRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class HomeTabRouter extends _i29.PageRouteInfo<void> {
  const HomeTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class SendTabRouter extends _i29.PageRouteInfo<void> {
  const SendTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          SendTabRouter.name,
          path: 'send',
          initialChildren: children,
        );

  static const String name = 'SendTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ReceiveTabRouter extends _i29.PageRouteInfo<void> {
  const ReceiveTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          ReceiveTabRouter.name,
          path: 'receive',
          initialChildren: children,
        );

  static const String name = 'ReceiveTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class TransactionsTabRouter extends _i29.PageRouteInfo<void> {
  const TransactionsTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          TransactionsTabRouter.name,
          path: 'transactions',
          initialChildren: children,
        );

  static const String name = 'TransactionsTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ValidatorTabRouter extends _i29.PageRouteInfo<void> {
  const ValidatorTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          ValidatorTabRouter.name,
          path: 'validator',
          initialChildren: children,
        );

  static const String name = 'ValidatorTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class AdjudicatorTabRouter extends _i29.PageRouteInfo<void> {
  const AdjudicatorTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          AdjudicatorTabRouter.name,
          path: 'adjudicator',
          initialChildren: children,
        );

  static const String name = 'AdjudicatorTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class NodesTabsRouter extends _i29.PageRouteInfo<void> {
  const NodesTabsRouter({List<_i29.PageRouteInfo>? children})
      : super(
          NodesTabsRouter.name,
          path: 'nodes',
          initialChildren: children,
        );

  static const String name = 'NodesTabsRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class DatanodeTabRouter extends _i29.PageRouteInfo<void> {
  const DatanodeTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          DatanodeTabRouter.name,
          path: 'datanode',
          initialChildren: children,
        );

  static const String name = 'DatanodeTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class NftTabRouter extends _i29.PageRouteInfo<void> {
  const NftTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          NftTabRouter.name,
          path: 'nft',
          initialChildren: children,
        );

  static const String name = 'NftTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class SmartContractsTabRouter extends _i29.PageRouteInfo<void> {
  const SmartContractsTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          SmartContractsTabRouter.name,
          path: 'smart-contracts',
          initialChildren: children,
        );

  static const String name = 'SmartContractsTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class DstsTabRouter extends _i29.PageRouteInfo<void> {
  const DstsTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          DstsTabRouter.name,
          path: 'dsts',
          initialChildren: children,
        );

  static const String name = 'DstsTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class AdnrTabRouter extends _i29.PageRouteInfo<void> {
  const AdnrTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          AdnrTabRouter.name,
          path: 'adnr',
          initialChildren: children,
        );

  static const String name = 'AdnrTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class VotingTabRouter extends _i29.PageRouteInfo<void> {
  const VotingTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          VotingTabRouter.name,
          path: 'voting',
          initialChildren: children,
        );

  static const String name = 'VotingTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class BeaconTabRouter extends _i29.PageRouteInfo<void> {
  const BeaconTabRouter({List<_i29.PageRouteInfo>? children})
      : super(
          BeaconTabRouter.name,
          path: 'beacons',
          initialChildren: children,
        );

  static const String name = 'BeaconTabRouter';
}

/// generated route for
/// [_i10.HomeScreen]
class HomeScreenRoute extends _i29.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i11.SendScreen]
class SendScreenRoute extends _i29.PageRouteInfo<void> {
  const SendScreenRoute()
      : super(
          SendScreenRoute.name,
          path: '',
        );

  static const String name = 'SendScreenRoute';
}

/// generated route for
/// [_i12.ReceiveScreen]
class ReceiveScreenRoute extends _i29.PageRouteInfo<void> {
  const ReceiveScreenRoute()
      : super(
          ReceiveScreenRoute.name,
          path: '',
        );

  static const String name = 'ReceiveScreenRoute';
}

/// generated route for
/// [_i13.TransactionsScreen]
class TransactionsScreenRoute extends _i29.PageRouteInfo<void> {
  const TransactionsScreenRoute()
      : super(
          TransactionsScreenRoute.name,
          path: '',
        );

  static const String name = 'TransactionsScreenRoute';
}

/// generated route for
/// [_i14.ValidatorScreen]
class ValidatorScreenRoute extends _i29.PageRouteInfo<void> {
  const ValidatorScreenRoute()
      : super(
          ValidatorScreenRoute.name,
          path: '',
        );

  static const String name = 'ValidatorScreenRoute';
}

/// generated route for
/// [_i15.AdjudicatorScreen]
class AdjudicatorScreenRoute extends _i29.PageRouteInfo<void> {
  const AdjudicatorScreenRoute()
      : super(
          AdjudicatorScreenRoute.name,
          path: '',
        );

  static const String name = 'AdjudicatorScreenRoute';
}

/// generated route for
/// [_i16.NodeListScreen]
class NodeListScreenRoute extends _i29.PageRouteInfo<void> {
  const NodeListScreenRoute()
      : super(
          NodeListScreenRoute.name,
          path: '',
        );

  static const String name = 'NodeListScreenRoute';
}

/// generated route for
/// [_i17.DataNodeScreen]
class DataNodeScreenRoute extends _i29.PageRouteInfo<void> {
  const DataNodeScreenRoute()
      : super(
          DataNodeScreenRoute.name,
          path: '',
        );

  static const String name = 'DataNodeScreenRoute';
}

/// generated route for
/// [_i18.NftListScreen]
class NftListScreenRoute extends _i29.PageRouteInfo<void> {
  const NftListScreenRoute()
      : super(
          NftListScreenRoute.name,
          path: '',
        );

  static const String name = 'NftListScreenRoute';
}

/// generated route for
/// [_i19.SmartContractsScreen]
class SmartContractsScreenRoute extends _i29.PageRouteInfo<void> {
  const SmartContractsScreenRoute()
      : super(
          SmartContractsScreenRoute.name,
          path: '',
        );

  static const String name = 'SmartContractsScreenRoute';
}

/// generated route for
/// [_i20.MyStoresListScreen]
class MyStoresListScreenRoute extends _i29.PageRouteInfo<void> {
  const MyStoresListScreenRoute()
      : super(
          MyStoresListScreenRoute.name,
          path: '',
        );

  static const String name = 'MyStoresListScreenRoute';
}

/// generated route for
/// [_i21.MyStoreDetailScreen]
class MyStoreDetailScreenRoute extends _i29.PageRouteInfo<MyStoreDetailScreenRouteArgs> {
  MyStoreDetailScreenRoute({
    _i30.Key? key,
    required int storeId,
  }) : super(
          MyStoreDetailScreenRoute.name,
          path: ':storeId',
          args: MyStoreDetailScreenRouteArgs(
            key: key,
            storeId: storeId,
          ),
          rawPathParams: {'storeId': storeId},
        );

  static const String name = 'MyStoreDetailScreenRoute';
}

class MyStoreDetailScreenRouteArgs {
  const MyStoreDetailScreenRouteArgs({
    this.key,
    required this.storeId,
  });

  final _i30.Key? key;

  final int storeId;

  @override
  String toString() {
    return 'MyStoreDetailScreenRouteArgs{key: $key, storeId: $storeId}';
  }
}

/// generated route for
/// [_i22.CreateStoreContainerScreen]
class CreateStoreContainerScreenRoute extends _i29.PageRouteInfo<void> {
  const CreateStoreContainerScreenRoute()
      : super(
          CreateStoreContainerScreenRoute.name,
          path: 'createStore',
        );

  static const String name = 'CreateStoreContainerScreenRoute';
}

/// generated route for
/// [_i23.AdnrScreen]
class AdnrScreenRoute extends _i29.PageRouteInfo<void> {
  const AdnrScreenRoute()
      : super(
          AdnrScreenRoute.name,
          path: '',
        );

  static const String name = 'AdnrScreenRoute';
}

/// generated route for
/// [_i24.TopicListScreen]
class TopicListScreenRoute extends _i29.PageRouteInfo<void> {
  const TopicListScreenRoute()
      : super(
          TopicListScreenRoute.name,
          path: '',
        );

  static const String name = 'TopicListScreenRoute';
}

/// generated route for
/// [_i25.TopicDetailScreen]
class TopicDetailScreenRoute extends _i29.PageRouteInfo<TopicDetailScreenRouteArgs> {
  TopicDetailScreenRoute({
    _i30.Key? key,
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

  final _i30.Key? key;

  final String topicUid;

  @override
  String toString() {
    return 'TopicDetailScreenRouteArgs{key: $key, topicUid: $topicUid}';
  }
}

/// generated route for
/// [_i26.CreateTopicScreen]
class CreateTopicScreenRoute extends _i29.PageRouteInfo<void> {
  const CreateTopicScreenRoute()
      : super(
          CreateTopicScreenRoute.name,
          path: 'create',
        );

  static const String name = 'CreateTopicScreenRoute';
}

/// generated route for
/// [_i27.BeaconListScreen]
class BeaconListScreenRoute extends _i29.PageRouteInfo<void> {
  const BeaconListScreenRoute()
      : super(
          BeaconListScreenRoute.name,
          path: '',
        );

  static const String name = 'BeaconListScreenRoute';
}

/// generated route for
/// [_i28.SmartContractCreatorMain]
class SmartContractCreatorMainRoute extends _i29.PageRouteInfo<void> {
  const SmartContractCreatorMainRoute()
      : super(
          SmartContractCreatorMainRoute.name,
          path: 'main',
        );

  static const String name = 'SmartContractCreatorMainRoute';
}
