import 'package:auto_route/auto_route.dart';
import 'package:rbx_wallet/features/auth/screens/web_auth_screen.dart';
import 'package:rbx_wallet/features/dsts/screens/create_store_screen.dart';
import 'package:rbx_wallet/features/dsts/screens/web_dst_screen.dart';
import 'package:rbx_wallet/features/home/screens/web_home_screen.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart';
import 'package:rbx_wallet/features/receive/screens/web_receive_screen.dart';
import 'package:rbx_wallet/features/root/web_dashboard_container.dart';
import 'package:rbx_wallet/features/send/screens/web_prefilled_send_screen.dart';
import 'package:rbx_wallet/features/send/screens/web_send_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/web_create_smart_contract_screen.dart';
import 'package:rbx_wallet/features/smart_contracts/screens/web_smart_contract_landing_screen.dart';
import 'package:rbx_wallet/features/store/screens/create_listing_screen.dart';
import 'package:rbx_wallet/features/store/screens/store_collection_screen.dart';
import 'package:rbx_wallet/features/store/screens/store_listing_screen.dart';
import 'package:rbx_wallet/features/store/screens/store_screen.dart';
import 'package:rbx_wallet/features/transactions/screens/web_transaction_detail_screen.dart';
import 'package:rbx_wallet/features/transactions/screens/web_transactions_screen.dart';

const List<AutoRoute> webRoutes = [
  // AutoRoute(initial: true, path: "", name: "WebAuthRoute", page: WebAuthScreen),
  // webStoreRouter,
  AutoRoute(
    initial: true,
    path: '',
    name: "WebAuthRouter",
    page: EmptyRouterPage,
    children: [
      AutoRoute(path: "", page: WebAuthScreen),
    ],
  ),
  AutoRoute(path: "store/collection/:slug", page: StoreCollectionScreen),
  AutoRoute(path: "store/auction/:slug", page: StoreListingScreen),
  webDashboardTabRouter,
  RedirectRoute(path: '*', redirectTo: '/'),
];

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: webRoutes)
class $WebRouter {}

const webDashboardTabRouter = AutoRoute(
  path: "dashboard",
  page: WebDashboardContainer,
  // initial: true,
  children: [
    AutoRoute(
      // initial: true,
      path: 'home',
      name: "WebHomeTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: WebHomeScreen),
      ],
    ),
    AutoRoute(
      path: 'send',
      name: "WebSendTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: WebSendScreen),
        AutoRoute(path: ":toAddress/:amount", page: WebPrefilledSendScreen),
      ],
    ),
    AutoRoute(
      path: 'receive',
      name: "WebReceiveTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: WebReceiveScreen),
      ],
    ),
    AutoRoute(
      path: 'transactions',
      name: "WebTransactionsTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: WebTransactionScreen),
        AutoRoute(path: "detail/:hash", page: WebTransactionDetailScreen),
      ],
    ),
    AutoRoute(
      path: 'nfts',
      name: "WebNftTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: NftListScreen),
        AutoRoute(path: "detail/:id", page: NftDetailScreen),
      ],
    ),
    AutoRoute(
      path: 'smart-contract',
      name: "WebSmartContractTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: WebSmartContractLandingScreen),
        AutoRoute(path: "create", page: WebCreateSmartContractScreen),
      ],
    ),
    AutoRoute(
      path: 'dst',
      name: "WebDstTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: WebDstScreen),
        AutoRoute(path: "create/:accountId", page: CreateStoreScreen),
        AutoRoute(path: "store/:slug", page: StoreScreen),
        AutoRoute(path: "store/:storeId/create-listing", page: CreateListingScreen),
      ],
    ),
  ],
);

// const webStoreRouter = AutoRoute(
//   path: "s",
//   page: StoreContainerScreen,
//   name: "StoreTabRouter",
//   children: [
//     AutoRoute(initial: true, path: ":slug", page: StoreListingScreen),
//   ],
// );
