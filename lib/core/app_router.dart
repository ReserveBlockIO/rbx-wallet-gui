import 'package:auto_route/auto_route.dart';
import 'package:rbx_wallet/features/datanode/screens/datanode_screen.dart';
import 'package:rbx_wallet/features/dsts/screens/dst_screen.dart';
import 'package:rbx_wallet/features/explorer/screens/explorer_screen.dart';
import 'package:rbx_wallet/features/node/screens/node_list_screen.dart';
import 'package:rbx_wallet/features/root/root_container.dart';
import 'package:rbx_wallet/features/home/screens/home_screen.dart';
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart';
import 'package:rbx_wallet/features/receive/screens/receive_screen.dart';
import 'package:rbx_wallet/features/send/screens/send_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/sc_creator_main.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/my_smart_contracts_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contracts_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/template_chooser_screen.dart';
import 'package:rbx_wallet/features/transactions/screens/transactions_screen.dart';
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart';

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
          AutoRoute(path: "", page: DstsScreen),
        ],
      ),
      AutoRoute(
        path: "explorer",
        name: "ExplorerTabRouter",
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: "", page: ExplorerScreen),
        ],
      ),
    ],
  ),
  AutoRoute(
    path: "my-smart-contracts",
    page: MySmartContractsScreen,
  ),
  AutoRoute(
    path: "smart-contract-templates",
    page: TemplateChooserScreen,
  ),
  AutoRoute(
    path: "create-smart-contract",
    page: SmartContractCreatorContainerScreen,
    children: [
      AutoRoute(
        path: "main",
        page: ScCreatorMain,
        initial: true,
      ),
    ],
  ),
];

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: appRoutes)
class $AppRouter {}
