// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i18;
import 'package:rbx_wallet/features/datanode/screens/datanode_screen.dart'
    as _i12;
import 'package:rbx_wallet/features/dsts/screens/dst_screen.dart' as _i15;
import 'package:rbx_wallet/features/explorer/screens/explorer_screen.dart'
    as _i16;
import 'package:rbx_wallet/features/home/screens/home_screen.dart' as _i6;
import 'package:rbx_wallet/features/nft/screens/nft_screen.dart' as _i13;
import 'package:rbx_wallet/features/node/screens/node_list_screen.dart' as _i11;
import 'package:rbx_wallet/features/receive/screens/receive_screen.dart' as _i8;
import 'package:rbx_wallet/features/root/root_container.dart' as _i1;
import 'package:rbx_wallet/features/send/screens/send_screen.dart' as _i7;
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/sc_creator_main.dart'
    as _i17;
import 'package:rbx_wallet/features/smart_contracts/screens/my_smart_contracts_screen.dart'
    as _i2;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart'
    as _i4;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contracts_screen.dart'
    as _i14;
import 'package:rbx_wallet/features/smart_contracts/screens/template_chooser_screen.dart'
    as _i3;
import 'package:rbx_wallet/features/transactions/screens/transactions_screen.dart'
    as _i9;
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart'
    as _i10;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    RootContainerRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.RootContainer());
    },
    MySmartContractsScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MySmartContractsScreen());
    },
    TemplateChooserScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.TemplateChooserScreen());
    },
    SmartContractCreatorContainerScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i4.SmartContractCreatorContainerScreen());
    },
    HomeTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SendTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ReceiveTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    TransactionsTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ValidatorTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    NodesTabsRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    DatanodeTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    NftTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SmartContractsTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    DstsTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ExplorerTabRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    SendScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.SendScreen());
    },
    ReceiveScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.ReceiveScreen());
    },
    TransactionsScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.TransactionsScreen());
    },
    ValidatorScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.ValidatorScreen());
    },
    NodeListScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.NodeListScreen());
    },
    DataNodeScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.DataNodeScreen());
    },
    NftScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.NftScreen());
    },
    SmartContractsScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i14.SmartContractsScreen());
    },
    DstsScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i15.DstsScreen());
    },
    ExplorerScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i16.ExplorerScreen());
    },
    ScCreatorMainRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.ScCreatorMain());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(RootContainerRoute.name, path: '/', children: [
          _i5.RouteConfig(HomeTabRouter.name,
              path: 'home',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(HomeScreenRoute.name,
                    path: '', parent: HomeTabRouter.name)
              ]),
          _i5.RouteConfig(SendTabRouter.name,
              path: 'send',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(SendScreenRoute.name,
                    path: '', parent: SendTabRouter.name)
              ]),
          _i5.RouteConfig(ReceiveTabRouter.name,
              path: 'receive',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(ReceiveScreenRoute.name,
                    path: '', parent: ReceiveTabRouter.name)
              ]),
          _i5.RouteConfig(TransactionsTabRouter.name,
              path: 'transactions',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(TransactionsScreenRoute.name,
                    path: '', parent: TransactionsTabRouter.name)
              ]),
          _i5.RouteConfig(ValidatorTabRouter.name,
              path: 'validator',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(ValidatorScreenRoute.name,
                    path: '', parent: ValidatorTabRouter.name)
              ]),
          _i5.RouteConfig(NodesTabsRouter.name,
              path: 'nodes',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(NodeListScreenRoute.name,
                    path: '', parent: NodesTabsRouter.name)
              ]),
          _i5.RouteConfig(DatanodeTabRouter.name,
              path: 'datanode',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(DataNodeScreenRoute.name,
                    path: '', parent: DatanodeTabRouter.name)
              ]),
          _i5.RouteConfig(NftTabRouter.name,
              path: 'nft',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(NftScreenRoute.name,
                    path: '', parent: NftTabRouter.name)
              ]),
          _i5.RouteConfig(SmartContractsTabRouter.name,
              path: 'smart-contracts',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(SmartContractsScreenRoute.name,
                    path: '', parent: SmartContractsTabRouter.name)
              ]),
          _i5.RouteConfig(DstsTabRouter.name,
              path: 'dsts',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(DstsScreenRoute.name,
                    path: '', parent: DstsTabRouter.name)
              ]),
          _i5.RouteConfig(ExplorerTabRouter.name,
              path: 'explorer',
              parent: RootContainerRoute.name,
              children: [
                _i5.RouteConfig(ExplorerScreenRoute.name,
                    path: '', parent: ExplorerTabRouter.name)
              ])
        ]),
        _i5.RouteConfig(MySmartContractsScreenRoute.name,
            path: 'my-smart-contracts'),
        _i5.RouteConfig(TemplateChooserScreenRoute.name,
            path: 'smart-contract-templates'),
        _i5.RouteConfig(SmartContractCreatorContainerScreenRoute.name,
            path: 'create-smart-contract',
            children: [
              _i5.RouteConfig('#redirect',
                  path: '',
                  parent: SmartContractCreatorContainerScreenRoute.name,
                  redirectTo: 'main',
                  fullMatch: true),
              _i5.RouteConfig(ScCreatorMainRoute.name,
                  path: 'main',
                  parent: SmartContractCreatorContainerScreenRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.RootContainer]
class RootContainerRoute extends _i5.PageRouteInfo<void> {
  const RootContainerRoute({List<_i5.PageRouteInfo>? children})
      : super(RootContainerRoute.name, path: '/', initialChildren: children);

  static const String name = 'RootContainerRoute';
}

/// generated route for
/// [_i2.MySmartContractsScreen]
class MySmartContractsScreenRoute extends _i5.PageRouteInfo<void> {
  const MySmartContractsScreenRoute()
      : super(MySmartContractsScreenRoute.name, path: 'my-smart-contracts');

  static const String name = 'MySmartContractsScreenRoute';
}

/// generated route for
/// [_i3.TemplateChooserScreen]
class TemplateChooserScreenRoute extends _i5.PageRouteInfo<void> {
  const TemplateChooserScreenRoute()
      : super(TemplateChooserScreenRoute.name,
            path: 'smart-contract-templates');

  static const String name = 'TemplateChooserScreenRoute';
}

/// generated route for
/// [_i4.SmartContractCreatorContainerScreen]
class SmartContractCreatorContainerScreenRoute extends _i5.PageRouteInfo<void> {
  const SmartContractCreatorContainerScreenRoute(
      {List<_i5.PageRouteInfo>? children})
      : super(SmartContractCreatorContainerScreenRoute.name,
            path: 'create-smart-contract', initialChildren: children);

  static const String name = 'SmartContractCreatorContainerScreenRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeTabRouter extends _i5.PageRouteInfo<void> {
  const HomeTabRouter({List<_i5.PageRouteInfo>? children})
      : super(HomeTabRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class SendTabRouter extends _i5.PageRouteInfo<void> {
  const SendTabRouter({List<_i5.PageRouteInfo>? children})
      : super(SendTabRouter.name, path: 'send', initialChildren: children);

  static const String name = 'SendTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ReceiveTabRouter extends _i5.PageRouteInfo<void> {
  const ReceiveTabRouter({List<_i5.PageRouteInfo>? children})
      : super(ReceiveTabRouter.name,
            path: 'receive', initialChildren: children);

  static const String name = 'ReceiveTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class TransactionsTabRouter extends _i5.PageRouteInfo<void> {
  const TransactionsTabRouter({List<_i5.PageRouteInfo>? children})
      : super(TransactionsTabRouter.name,
            path: 'transactions', initialChildren: children);

  static const String name = 'TransactionsTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ValidatorTabRouter extends _i5.PageRouteInfo<void> {
  const ValidatorTabRouter({List<_i5.PageRouteInfo>? children})
      : super(ValidatorTabRouter.name,
            path: 'validator', initialChildren: children);

  static const String name = 'ValidatorTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class NodesTabsRouter extends _i5.PageRouteInfo<void> {
  const NodesTabsRouter({List<_i5.PageRouteInfo>? children})
      : super(NodesTabsRouter.name, path: 'nodes', initialChildren: children);

  static const String name = 'NodesTabsRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class DatanodeTabRouter extends _i5.PageRouteInfo<void> {
  const DatanodeTabRouter({List<_i5.PageRouteInfo>? children})
      : super(DatanodeTabRouter.name,
            path: 'datanode', initialChildren: children);

  static const String name = 'DatanodeTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class NftTabRouter extends _i5.PageRouteInfo<void> {
  const NftTabRouter({List<_i5.PageRouteInfo>? children})
      : super(NftTabRouter.name, path: 'nft', initialChildren: children);

  static const String name = 'NftTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class SmartContractsTabRouter extends _i5.PageRouteInfo<void> {
  const SmartContractsTabRouter({List<_i5.PageRouteInfo>? children})
      : super(SmartContractsTabRouter.name,
            path: 'smart-contracts', initialChildren: children);

  static const String name = 'SmartContractsTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class DstsTabRouter extends _i5.PageRouteInfo<void> {
  const DstsTabRouter({List<_i5.PageRouteInfo>? children})
      : super(DstsTabRouter.name, path: 'dsts', initialChildren: children);

  static const String name = 'DstsTabRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ExplorerTabRouter extends _i5.PageRouteInfo<void> {
  const ExplorerTabRouter({List<_i5.PageRouteInfo>? children})
      : super(ExplorerTabRouter.name,
            path: 'explorer', initialChildren: children);

  static const String name = 'ExplorerTabRouter';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i7.SendScreen]
class SendScreenRoute extends _i5.PageRouteInfo<void> {
  const SendScreenRoute() : super(SendScreenRoute.name, path: '');

  static const String name = 'SendScreenRoute';
}

/// generated route for
/// [_i8.ReceiveScreen]
class ReceiveScreenRoute extends _i5.PageRouteInfo<void> {
  const ReceiveScreenRoute() : super(ReceiveScreenRoute.name, path: '');

  static const String name = 'ReceiveScreenRoute';
}

/// generated route for
/// [_i9.TransactionsScreen]
class TransactionsScreenRoute extends _i5.PageRouteInfo<void> {
  const TransactionsScreenRoute()
      : super(TransactionsScreenRoute.name, path: '');

  static const String name = 'TransactionsScreenRoute';
}

/// generated route for
/// [_i10.ValidatorScreen]
class ValidatorScreenRoute extends _i5.PageRouteInfo<void> {
  const ValidatorScreenRoute() : super(ValidatorScreenRoute.name, path: '');

  static const String name = 'ValidatorScreenRoute';
}

/// generated route for
/// [_i11.NodeListScreen]
class NodeListScreenRoute extends _i5.PageRouteInfo<void> {
  const NodeListScreenRoute() : super(NodeListScreenRoute.name, path: '');

  static const String name = 'NodeListScreenRoute';
}

/// generated route for
/// [_i12.DataNodeScreen]
class DataNodeScreenRoute extends _i5.PageRouteInfo<void> {
  const DataNodeScreenRoute() : super(DataNodeScreenRoute.name, path: '');

  static const String name = 'DataNodeScreenRoute';
}

/// generated route for
/// [_i13.NftScreen]
class NftScreenRoute extends _i5.PageRouteInfo<void> {
  const NftScreenRoute() : super(NftScreenRoute.name, path: '');

  static const String name = 'NftScreenRoute';
}

/// generated route for
/// [_i14.SmartContractsScreen]
class SmartContractsScreenRoute extends _i5.PageRouteInfo<void> {
  const SmartContractsScreenRoute()
      : super(SmartContractsScreenRoute.name, path: '');

  static const String name = 'SmartContractsScreenRoute';
}

/// generated route for
/// [_i15.DstsScreen]
class DstsScreenRoute extends _i5.PageRouteInfo<void> {
  const DstsScreenRoute() : super(DstsScreenRoute.name, path: '');

  static const String name = 'DstsScreenRoute';
}

/// generated route for
/// [_i16.ExplorerScreen]
class ExplorerScreenRoute extends _i5.PageRouteInfo<void> {
  const ExplorerScreenRoute() : super(ExplorerScreenRoute.name, path: '');

  static const String name = 'ExplorerScreenRoute';
}

/// generated route for
/// [_i17.ScCreatorMain]
class ScCreatorMainRoute extends _i5.PageRouteInfo<void> {
  const ScCreatorMainRoute() : super(ScCreatorMainRoute.name, path: 'main');

  static const String name = 'ScCreatorMainRoute';
}
