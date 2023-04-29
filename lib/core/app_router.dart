import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:rbx_wallet/features/chat/screens/buyer_chat_thread_list_screen.dart';
import 'package:rbx_wallet/features/dst/screens/create_collection_container_screen.dart';
import 'package:rbx_wallet/features/dst/screens/create_dec_shop_container_screen.dart';
import 'package:rbx_wallet/features/dst/screens/dst_landing_screen.dart';
import 'package:rbx_wallet/features/dst/screens/my_collection_detail_screen.dart';
import 'package:rbx_wallet/features/dst/screens/my_collection_list_screen.dart';
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_collection_screen.dart';
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_container_screen.dart';
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_detail_screen.dart';
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_list_screen.dart';
import 'package:rbx_wallet/features/reserve/screens/reserve_account_overview_screen.dart';
import 'package:rbx_wallet/features/web_shop/screens/create_web_listing_screen.dart';
import 'package:rbx_wallet/features/web_shop/screens/web_collection_detail_screen.dart';
import 'package:rbx_wallet/features/web_shop/screens/web_listing_detail_screen.dart';
import 'package:rbx_wallet/features/web_shop/screens/web_shop_container_screen.dart';
import 'package:rbx_wallet/features/web_shop/screens/web_shop_landing_screen.dart';

import '../features/adjudicator/adjudicator_screen.dart';
import '../features/adnr/screens/adnr_screen.dart';
import '../features/beacon/screens/beacon_list_screen.dart';
import '../features/chat/screens/seller_chat_screen.dart';
import '../features/chat/screens/seller_chat_thread_list_screen.dart';
import '../features/chat/screens/shop_chat_screen.dart';
import '../features/config/screens/config_container_screen.dart';
import '../features/datanode/screens/datanode_screen.dart';
import '../features/dst/screens/create_listing_container_screen.dart';
import '../features/dst/screens/listing_detail_screen.dart';
import '../features/dst/screens/listing_auction_detail_screen.dart';

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
import '../features/web_shop/screens/create_web_shop_container_screen.dart';
import '../features/web_shop/screens/web_shop_detail_screen.dart';
import '../features/web_shop/screens/web_shop_list_screen.dart';
import '../features/web_shop/screens/my_web_shops_list_screen.dart';

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
          AutoRoute(path: "reserve-accounts", page: ReserveAccountOverviewScreen),
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
          AutoRoute(path: "", page: DstLandingScreen),
          AutoRoute(path: "chat", page: SellerChatThreadListScreen),
          // AutoRoute(path: "chat/:address", page: SellerChatScreen),
          // AutoRoute(path: "shops", page: RemoteShopListScreen),
          // AutoRoute(path: "shops/:url", page: RemoteShopDetailScreen),
          // AutoRoute(path: "shops/:url/chat", page: ShopChatScreen),
          // AutoRoute(path: "shops/:url/collection/:collectionId", page: RemoteShopCollectionScreen),
          AutoRoute(path: "me", page: MyCollectionsListScreen),
          AutoRoute(path: ":collectionId", page: MyCollectionDetailScreen),
          AutoRoute(path: "createCollection", page: CreateCollectionContainerScreen),
          AutoRoute(path: "createDecShop", page: CreateDecShopContainerScreen),
          AutoRoute(path: ":listingId", page: ListingDetailScreen),
          AutoRoute(path: ":listingId/auction", page: ListingAuctionDetailScreen),
          AutoRoute(path: "createListing/:collectionId", page: CreateListingContainerScreen),
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
      AutoRoute(
        path: "web-shop",
        name: "DebugWebShopTabsRouter",
        page: WebShopContainerScreen,
        children: [
          AutoRoute(
            initial: true,
            path: "",
            page: WebShopLandingScreen,
          ),
          AutoRoute(
            path: "shops",
            page: WebShopListScreen,
            name: "DebugWebShopListScreenRoute",
          ),
          AutoRoute(
            path: "mine",
            name: "DebugMyWebShopListScreenRoute",
            page: MyWebShopListScreen,
          ),
          AutoRoute(
            path: "createWebShop",
            name: "DebugWebShopCreateScreenRoute",
            page: CreateWebShopContainerScreen,
          ),
          AutoRoute(
            path: "shop/:shopId/collection/:collectionId/createWebListing",
            name: "DebugWebListingCreateScreenRoute",
            page: CreateWebListingScreen,
          ),
          AutoRoute(
            path: "shop/:shopId",
            name: "DebugWebShopDetailScreenRoute",
            page: WebShopDetailScreen,
          ),
          AutoRoute(
            path: "shop/:shopId/collection/:collectionId",
            name: "DebugWebCollectionDetailScreenRoute",
            page: WebCollectionDetailScreen,
          ),
          AutoRoute(
            path: "shop/:shopId/collection/:collectionId/listing/:listingId",
            name: "DebugWebListingDetailScreenRoute",
            page: WebListingDetailScreen,
          ),
        ],
      ),
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

  AutoRoute(path: "mother-dashboard", page: MotherDashboardScreen),

  AutoRoute(
    path: "remote-shop-container",
    page: RemoteShopContainerScreen,
    children: [
      AutoRoute(path: "shops", page: RemoteShopListScreen, initial: true),
      AutoRoute(path: "shops/chat", page: BuyerChatThreadListScreen),
      AutoRoute(path: "shops/:url", page: RemoteShopDetailScreen),
      // AutoRoute(path: "shops/:url/chat", page: ShopChatScreen),
      AutoRoute(path: "shops/:url/collection/:collectionId", page: RemoteShopCollectionScreen),
      AutoRoute(
        path: "third-party/shop/:shopId",
        name: "ThirdPartyWebShopDetailScreenRoute",
        page: WebShopDetailScreen,
      ),
      AutoRoute(
        path: "third-party/shop/:shopId/collection/:collectionId",
        name: "ThirdPartyWebCollectionDetailScreenRoute",
        page: WebCollectionDetailScreen,
      ),
      AutoRoute(
        path: "third-party/shop/:shopId/collection/:collectionId/listing/:listingId",
        name: "ThirdPartyWebListingDetailScreenRoute",
        page: WebListingDetailScreen,
      ),
    ],
  ),
  AutoRoute(path: "chat/:address", page: SellerChatScreen),
  AutoRoute(path: "shops/:url/chat", page: ShopChatScreen),

  // AutoRoute(path: "shops/:url", page: RemoteShopDetailScreen),
];

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: appRoutes)
class $AppRouter {}
