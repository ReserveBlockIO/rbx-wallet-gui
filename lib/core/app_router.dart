import 'package:auto_route/auto_route.dart';

import 'package:auto_route/empty_router_widgets.dart';
import 'package:rbx_wallet/features/dst/screens/create_store_container_screen.dart';
import 'package:rbx_wallet/features/dst/screens/my_store_detail_screen.dart';
import 'package:rbx_wallet/features/dst/screens/my_stores_list_screen.dart';
import 'package:rbx_wallet/features/dsts_legacy/screens/create_store_screen.dart';
import 'package:rbx_wallet/features/dsts_legacy/screens/dst_screen.dart';

import '../features/adjudicator/adjudicator_screen.dart';
import '../features/adnr/screens/adnr_screen.dart';
import '../features/beacon/screens/beacon_list_screen.dart';
import '../features/config/screens/config_container_screen.dart';
import '../features/datanode/screens/datanode_screen.dart';
import '../features/dst/screens/create_listing_container_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/mother/screens/mother_dashboard_screen.dart';
import '../features/nft/screens/nft_list_screen.dart';
import '../features/node/screens/node_list_screen.dart';
import '../features/receive/screens/receive_screen.dart';
import '../features/root/root_container.dart';
import '../features/send/screens/send_screen.dart';
import '../features/smart_contracts/components/sc_creator/smart_contract_creator_main.dart';
import '../features/smart_contracts/screens/bulk_create_screen.dart';
import '../features/smart_contracts/screens/my_smart_contracts_screen.dart';
import '../features/smart_contracts/screens/smart_contract_creator_container_screen.dart';
import '../features/smart_contracts/screens/smart_contract_drafts_screen.dart';
import '../features/smart_contracts/screens/smart_contracts_screen.dart';
import '../features/smart_contracts/screens/template_chooser_screen.dart';
import '../features/transactions/screens/transactions_screen.dart';
import '../features/validator/screens/validator_screen.dart';
import '../features/voting/screens/create_topic_screen.dart';
import '../features/voting/screens/topic_detail_screen.dart';
import '../features/voting/screens/topic_list_screen.dart';

const List<AutoRoute> appRoutes = [
  AutoRoute(
    initial: true,
    path: '/',
    page: RootContainer,
    children: [
      AutoRoute(
        path: "home",
        name: "HomeTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: HomeScreen),
        ],
      ),
      AutoRoute(
        path: "send",
        name: "SendTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: SendScreen),
        ],
      ),
      AutoRoute(
        path: "receive",
        name: "ReceiveTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: ReceiveScreen),
        ],
      ),
      AutoRoute(
        path: "transactions",
        name: "TransactionsTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: TransactionsScreen),
        ],
      ),
      AutoRoute(
        path: "validator",
        name: "ValidatorTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: ValidatorScreen),
        ],
      ),
      AutoRoute(
        path: "adjudicator",
        name: "AdjudicatorTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: AdjudicatorScreen),
        ],
      ),
      AutoRoute(
        path: "nodes",
        name: "NodesTabsRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: NodeListScreen),
        ],
      ),
      AutoRoute(
        path: "datanode",
        name: "DatanodeTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: DataNodeScreen),
        ],
      ),
      AutoRoute(
        path: "nft",
        name: "NftTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: NftListScreen),
        ],
      ),
      AutoRoute(
        path: "smart-contracts",
        name: "SmartContractsTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: SmartContractsScreen),
        ],
      ),
      AutoRoute(
        path: "dsts",
        name: "DstsTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: MyStoresListScreen),
          AutoRoute(path: ":storeId", page: MyStoreDetailScreen),
          AutoRoute(path: "createStore", page: CreateStoreContainerScreen),
          AutoRoute(path: "createListing/:storeId", page: CreateListingContainerScreen),
        ],
      ),
      AutoRoute(
        path: "adnr",
        name: "AdnrTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: AdnrScreen),
        ],
      ),
      AutoRoute(
        path: "voting",
        name: "VotingTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: TopicListScreen),
          AutoRoute(path: ":uid", page: TopicDetailScreen),
          AutoRoute(path: "create", page: CreateTopicScreen),
        ],
      ),
      AutoRoute(
        path: "beacons",
        name: "BeaconTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: BeaconListScreen),
        ],
      ),
      // AutoRoute(
      //   path: "explorer",
      //   name: "ExplorerTabRouter",
      //   page: EmptyRouterPage,
      //   children: [
      //     AutoRoute(path: "", page: ExplorerScreen),
      //   ],
      // ),
    ],
  ),
  AutoRoute(
    path: "my-smart-contracts",
    page: MySmartContractsScreen,
  ),
  AutoRoute(
    path: "smart-contract-drafts",
    page: SmartContractDraftsScreen,
  ),
  AutoRoute(
    path: "smart-contract-templates",
    page: TemplateChooserScreen,
  ),
  AutoRoute(
    path: "bulk-create-smart-contracts",
    page: BulkCreateScreen,
  ),
  AutoRoute(
    path: "config",
    page: ConfigContainerScreen,
  ),
  AutoRoute(
    path: "create-smart-contract",
    page: SmartContractCreatorContainerScreen,
    children: [
      AutoRoute(
        path: "main",
        page: SmartContractCreatorMain,
        initial: true,
      ),
    ],
  ),
  AutoRoute(path: "mother-dashboard", page: MotherDashboardScreen)
];

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: appRoutes)
class $AppRouter {}
