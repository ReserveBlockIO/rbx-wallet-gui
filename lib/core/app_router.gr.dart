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
import 'package:auto_route/auto_route.dart' as _i46;
import 'package:auto_route/empty_router_widgets.dart' as _i12;
import 'package:flutter/material.dart' as _i47;
import 'package:rbx_wallet/features/adjudicator/adjudicator_screen.dart'
    as _i19;
import 'package:rbx_wallet/features/adnr/screens/adnr_screen.dart' as _i33;
import 'package:rbx_wallet/features/beacon/screens/beacon_list_screen.dart'
    as _i37;
import 'package:rbx_wallet/features/chat/screens/buyer_chat_thread_list_screen.dart'
    as _i40;
import 'package:rbx_wallet/features/chat/screens/seller_chat_screen.dart'
    as _i10;
import 'package:rbx_wallet/features/chat/screens/seller_chat_thread_list_screen.dart'
    as _i25;
import 'package:rbx_wallet/features/chat/screens/shop_chat_screen.dart' as _i11;
import 'package:rbx_wallet/features/config/screens/config_container_screen.dart'
    as _i6;
import 'package:rbx_wallet/features/datanode/screens/datanode_screen.dart'
    as _i21;
import 'package:rbx_wallet/features/dst/screens/create_collection_container_screen.dart'
    as _i28;
import 'package:rbx_wallet/features/dst/screens/create_dec_shop_container_screen.dart'
    as _i29;
import 'package:rbx_wallet/features/dst/screens/create_listing_container_screen.dart'
    as _i32;
import 'package:rbx_wallet/features/dst/screens/dst_landing_screen.dart'
    as _i24;
import 'package:rbx_wallet/features/dst/screens/listing_auction_detail_screen.dart'
    as _i31;
import 'package:rbx_wallet/features/dst/screens/listing_detail_screen.dart'
    as _i30;
import 'package:rbx_wallet/features/dst/screens/my_collection_detail_screen.dart'
    as _i27;
import 'package:rbx_wallet/features/dst/screens/my_collection_list_screen.dart'
    as _i26;
import 'package:rbx_wallet/features/home/screens/home_screen.dart' as _i13;
import 'package:rbx_wallet/features/mother/screens/mother_dashboard_screen.dart'
    as _i8;
import 'package:rbx_wallet/features/nft/screens/nft_list_screen.dart' as _i22;
import 'package:rbx_wallet/features/node/screens/node_list_screen.dart' as _i20;
import 'package:rbx_wallet/features/receive/screens/receive_screen.dart'
    as _i16;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_collection_screen.dart'
    as _i42;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_container_screen.dart'
    as _i9;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_detail_screen.dart'
    as _i41;
import 'package:rbx_wallet/features/remote_shop/screens/remote_shop_list_screen.dart'
    as _i39;
import 'package:rbx_wallet/features/reserve/screens/reserve_account_overview_screen.dart'
    as _i14;
import 'package:rbx_wallet/features/root/root_container.dart' as _i1;
import 'package:rbx_wallet/features/send/screens/send_screen.dart' as _i15;
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/smart_contract_creator_main.dart'
    as _i38;
import 'package:rbx_wallet/features/smart_contracts/screens/bulk_create_screen.dart'
    as _i5;
import 'package:rbx_wallet/features/smart_contracts/screens/my_smart_contracts_screen.dart'
    as _i2;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_creator_container_screen.dart'
    as _i7;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contract_drafts_screen.dart'
    as _i3;
import 'package:rbx_wallet/features/smart_contracts/screens/smart_contracts_screen.dart'
    as _i23;
import 'package:rbx_wallet/features/smart_contracts/screens/template_chooser_screen.dart'
    as _i4;
import 'package:rbx_wallet/features/transactions/screens/transactions_screen.dart'
    as _i17;
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart'
    as _i18;
import 'package:rbx_wallet/features/voting/screens/create_topic_screen.dart'
    as _i36;
import 'package:rbx_wallet/features/voting/screens/topic_detail_screen.dart'
    as _i35;
import 'package:rbx_wallet/features/voting/screens/topic_list_screen.dart'
    as _i34;
import 'package:rbx_wallet/features/web_shop/screens/web_collection_detail_screen.dart'
    as _i44;
import 'package:rbx_wallet/features/web_shop/screens/web_listing_detail_screen.dart'
    as _i45;
import 'package:rbx_wallet/features/web_shop/screens/web_shop_detail_screen.dart'
    as _i43;

class AppRouter extends _i46.RootStackRouter {
  AppRouter([_i47.GlobalKey<_i47.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i46.PageFactory> pagesMap = {
    RootContainerRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.RootContainer(),
      );
    },
    MySmartContractsScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.MySmartContractsScreen(),
      );
    },
    SmartContractDraftsScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SmartContractDraftsScreen(),
      );
    },
    TemplateChooserScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.TemplateChooserScreen(),
      );
    },
    BulkCreateScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.BulkCreateScreen(),
      );
    },
    ConfigContainerScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ConfigContainerScreen(),
      );
    },
    SmartContractCreatorContainerScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SmartContractCreatorContainerScreen(),
      );
    },
    MotherDashboardScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.MotherDashboardScreen(),
      );
    },
    RemoteShopContainerScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.RemoteShopContainerScreen(),
      );
    },
    SellerChatScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SellerChatScreenRouteArgs>(
          orElse: () => SellerChatScreenRouteArgs(
              address: pathParams.getString('address')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.SellerChatScreen(
          key: args.key,
          address: args.address,
        ),
      );
    },
    ShopChatScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ShopChatScreenRouteArgs>(
          orElse: () =>
              ShopChatScreenRouteArgs(shopUrl: pathParams.getString('url')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.ShopChatScreen(
          key: args.key,
          shopUrl: args.shopUrl,
        ),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    SendTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    ReceiveTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    TransactionsTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    ValidatorTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    AdjudicatorTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    NodesTabsRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    DatanodeTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    NftTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    SmartContractsTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    DstsTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    AdnrTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    VotingTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    BeaconTabRouter.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomeScreen(),
      );
    },
    ReserveAccountOverviewScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.ReserveAccountOverviewScreen(),
      );
    },
    SendScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.SendScreen(),
      );
    },
    ReceiveScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.ReceiveScreen(),
      );
    },
    TransactionsScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.TransactionsScreen(),
      );
    },
    ValidatorScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.ValidatorScreen(),
      );
    },
    AdjudicatorScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.AdjudicatorScreen(),
      );
    },
    NodeListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.NodeListScreen(),
      );
    },
    DataNodeScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.DataNodeScreen(),
      );
    },
    NftListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.NftListScreen(),
      );
    },
    SmartContractsScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.SmartContractsScreen(),
      );
    },
    DstLandingScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.DstLandingScreen(),
      );
    },
    SellerChatThreadListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i25.SellerChatThreadListScreen(),
      );
    },
    MyCollectionsListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i26.MyCollectionsListScreen(),
      );
    },
    MyCollectionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MyCollectionDetailScreenRouteArgs>(
          orElse: () => MyCollectionDetailScreenRouteArgs(
              collectionId: pathParams.getInt('collectionId')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.MyCollectionDetailScreen(
          key: args.key,
          collectionId: args.collectionId,
        ),
      );
    },
    CreateCollectionContainerScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.CreateCollectionContainerScreen(),
      );
    },
    CreateDecShopContainerScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.CreateDecShopContainerScreen(),
      );
    },
    ListingDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ListingDetailScreenRouteArgs>(
          orElse: () => ListingDetailScreenRouteArgs(
              listingId: pathParams.getInt('listingId')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i30.ListingDetailScreen(
          key: args.key,
          listingId: args.listingId,
        ),
      );
    },
    ListingAuctionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ListingAuctionDetailScreenRouteArgs>(
          orElse: () => ListingAuctionDetailScreenRouteArgs(
              listingId: pathParams.getInt('listingId')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.ListingAuctionDetailScreen(
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
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i32.CreateListingContainerScreen(
          args.collectionId,
          key: args.key,
        ),
      );
    },
    AdnrScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i33.AdnrScreen(),
      );
    },
    TopicListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i34.TopicListScreen(),
      );
    },
    TopicDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TopicDetailScreenRouteArgs>(
          orElse: () => TopicDetailScreenRouteArgs(
              topicUid: pathParams.getString('uid')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i35.TopicDetailScreen(
          key: args.key,
          topicUid: args.topicUid,
        ),
      );
    },
    CreateTopicScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i36.CreateTopicScreen(),
      );
    },
    BeaconListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i37.BeaconListScreen(),
      );
    },
    SmartContractCreatorMainRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i38.SmartContractCreatorMain(),
      );
    },
    RemoteShopListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i39.RemoteShopListScreen(),
      );
    },
    BuyerChatThreadListScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i40.BuyerChatThreadListScreen(),
      );
    },
    RemoteShopDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RemoteShopDetailScreenRouteArgs>(
          orElse: () => RemoteShopDetailScreenRouteArgs(
              shopUrl: pathParams.getString('url')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i41.RemoteShopDetailScreen(
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
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i42.RemoteShopCollectionScreen(
          key: args.key,
          collectionId: args.collectionId,
          url: args.url,
        ),
      );
    },
    ThirdPartyWebShopDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ThirdPartyWebShopDetailScreenRouteArgs>(
          orElse: () => ThirdPartyWebShopDetailScreenRouteArgs(
              shopId: pathParams.getInt('shopId')));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i43.WebShopDetailScreen(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    ThirdPartyWebCollectionDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args =
          routeData.argsAs<ThirdPartyWebCollectionDetailScreenRouteArgs>(
              orElse: () => ThirdPartyWebCollectionDetailScreenRouteArgs(
                    shopId: pathParams.getInt('shopId'),
                    collectionId: pathParams.getInt('collectionId'),
                  ));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i44.WebCollectionDetailScreen(
          key: args.key,
          shopId: args.shopId,
          collectionId: args.collectionId,
        ),
      );
    },
    ThirdPartyWebListingDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ThirdPartyWebListingDetailScreenRouteArgs>(
          orElse: () => ThirdPartyWebListingDetailScreenRouteArgs(
                shopId: pathParams.getInt('shopId'),
                collectionId: pathParams.getInt('collectionId'),
                listingId: pathParams.getInt('listingId'),
              ));
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i45.WebListingDetailScreen(
          key: args.key,
          shopId: args.shopId,
          collectionId: args.collectionId,
          listingId: args.listingId,
        ),
      );
    },
  };

  @override
  List<_i46.RouteConfig> get routes => [
        _i46.RouteConfig(
          RootContainerRoute.name,
          path: '/',
          children: [
            _i46.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                ),
                _i46.RouteConfig(
                  ReserveAccountOverviewScreenRoute.name,
                  path: 'reserve-accounts',
                  parent: HomeTabRouter.name,
                ),
              ],
            ),
            _i46.RouteConfig(
              SendTabRouter.name,
              path: 'send',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  SendScreenRoute.name,
                  path: '',
                  parent: SendTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              ReceiveTabRouter.name,
              path: 'receive',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  ReceiveScreenRoute.name,
                  path: '',
                  parent: ReceiveTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              TransactionsTabRouter.name,
              path: 'transactions',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  TransactionsScreenRoute.name,
                  path: '',
                  parent: TransactionsTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              ValidatorTabRouter.name,
              path: 'validator',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  ValidatorScreenRoute.name,
                  path: '',
                  parent: ValidatorTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              AdjudicatorTabRouter.name,
              path: 'adjudicator',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  AdjudicatorScreenRoute.name,
                  path: '',
                  parent: AdjudicatorTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              NodesTabsRouter.name,
              path: 'nodes',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  NodeListScreenRoute.name,
                  path: '',
                  parent: NodesTabsRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              DatanodeTabRouter.name,
              path: 'datanode',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  DataNodeScreenRoute.name,
                  path: '',
                  parent: DatanodeTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              NftTabRouter.name,
              path: 'nft',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  NftListScreenRoute.name,
                  path: '',
                  parent: NftTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              SmartContractsTabRouter.name,
              path: 'smart-contracts',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  SmartContractsScreenRoute.name,
                  path: '',
                  parent: SmartContractsTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              DstsTabRouter.name,
              path: 'dsts',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  DstLandingScreenRoute.name,
                  path: '',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  SellerChatThreadListScreenRoute.name,
                  path: 'chat',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  MyCollectionsListScreenRoute.name,
                  path: 'me',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  MyCollectionDetailScreenRoute.name,
                  path: ':collectionId',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  CreateCollectionContainerScreenRoute.name,
                  path: 'createCollection',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  CreateDecShopContainerScreenRoute.name,
                  path: 'createDecShop',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  ListingDetailScreenRoute.name,
                  path: ':listingId',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  ListingAuctionDetailScreenRoute.name,
                  path: ':listingId/auction',
                  parent: DstsTabRouter.name,
                ),
                _i46.RouteConfig(
                  CreateListingContainerScreenRoute.name,
                  path: 'createListing/:collectionId',
                  parent: DstsTabRouter.name,
                ),
              ],
            ),
            _i46.RouteConfig(
              AdnrTabRouter.name,
              path: 'adnr',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  AdnrScreenRoute.name,
                  path: '',
                  parent: AdnrTabRouter.name,
                )
              ],
            ),
            _i46.RouteConfig(
              VotingTabRouter.name,
              path: 'voting',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  TopicListScreenRoute.name,
                  path: '',
                  parent: VotingTabRouter.name,
                ),
                _i46.RouteConfig(
                  TopicDetailScreenRoute.name,
                  path: ':uid',
                  parent: VotingTabRouter.name,
                ),
                _i46.RouteConfig(
                  CreateTopicScreenRoute.name,
                  path: 'create',
                  parent: VotingTabRouter.name,
                ),
              ],
            ),
            _i46.RouteConfig(
              BeaconTabRouter.name,
              path: 'beacons',
              parent: RootContainerRoute.name,
              children: [
                _i46.RouteConfig(
                  BeaconListScreenRoute.name,
                  path: '',
                  parent: BeaconTabRouter.name,
                )
              ],
            ),
          ],
        ),
        _i46.RouteConfig(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        ),
        _i46.RouteConfig(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        ),
        _i46.RouteConfig(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        ),
        _i46.RouteConfig(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        ),
        _i46.RouteConfig(
          ConfigContainerScreenRoute.name,
          path: 'config',
        ),
        _i46.RouteConfig(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          children: [
            _i46.RouteConfig(
              '#redirect',
              path: '',
              parent: SmartContractCreatorContainerScreenRoute.name,
              redirectTo: 'main',
              fullMatch: true,
            ),
            _i46.RouteConfig(
              SmartContractCreatorMainRoute.name,
              path: 'main',
              parent: SmartContractCreatorContainerScreenRoute.name,
            ),
          ],
        ),
        _i46.RouteConfig(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        ),
        _i46.RouteConfig(
          RemoteShopContainerScreenRoute.name,
          path: 'remote-shop-container',
          children: [
            _i46.RouteConfig(
              '#redirect',
              path: '',
              parent: RemoteShopContainerScreenRoute.name,
              redirectTo: 'shops',
              fullMatch: true,
            ),
            _i46.RouteConfig(
              RemoteShopListScreenRoute.name,
              path: 'shops',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i46.RouteConfig(
              BuyerChatThreadListScreenRoute.name,
              path: 'shops/chat',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i46.RouteConfig(
              RemoteShopDetailScreenRoute.name,
              path: 'shops/:url',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i46.RouteConfig(
              RemoteShopCollectionScreenRoute.name,
              path: 'shops/:url/collection/:collectionId',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i46.RouteConfig(
              ThirdPartyWebShopDetailScreenRoute.name,
              path: 'third-party/shop/:shopId',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i46.RouteConfig(
              ThirdPartyWebCollectionDetailScreenRoute.name,
              path: 'third-party/shop/:shopId/collection/:collectionId',
              parent: RemoteShopContainerScreenRoute.name,
            ),
            _i46.RouteConfig(
              ThirdPartyWebListingDetailScreenRoute.name,
              path:
                  'third-party/shop/:shopId/collection/:collectionId/listing/:listingId',
              parent: RemoteShopContainerScreenRoute.name,
            ),
          ],
        ),
        _i46.RouteConfig(
          SellerChatScreenRoute.name,
          path: 'chat/:address',
        ),
        _i46.RouteConfig(
          ShopChatScreenRoute.name,
          path: 'shops/:url/chat',
        ),
      ];
}

/// generated route for
/// [_i1.RootContainer]
class RootContainerRoute extends _i46.PageRouteInfo<void> {
  const RootContainerRoute({List<_i46.PageRouteInfo>? children})
      : super(
          RootContainerRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootContainerRoute';
}

/// generated route for
/// [_i2.MySmartContractsScreen]
class MySmartContractsScreenRoute extends _i46.PageRouteInfo<void> {
  const MySmartContractsScreenRoute()
      : super(
          MySmartContractsScreenRoute.name,
          path: 'my-smart-contracts',
        );

  static const String name = 'MySmartContractsScreenRoute';
}

/// generated route for
/// [_i3.SmartContractDraftsScreen]
class SmartContractDraftsScreenRoute extends _i46.PageRouteInfo<void> {
  const SmartContractDraftsScreenRoute()
      : super(
          SmartContractDraftsScreenRoute.name,
          path: 'smart-contract-drafts',
        );

  static const String name = 'SmartContractDraftsScreenRoute';
}

/// generated route for
/// [_i4.TemplateChooserScreen]
class TemplateChooserScreenRoute extends _i46.PageRouteInfo<void> {
  const TemplateChooserScreenRoute()
      : super(
          TemplateChooserScreenRoute.name,
          path: 'smart-contract-templates',
        );

  static const String name = 'TemplateChooserScreenRoute';
}

/// generated route for
/// [_i5.BulkCreateScreen]
class BulkCreateScreenRoute extends _i46.PageRouteInfo<void> {
  const BulkCreateScreenRoute()
      : super(
          BulkCreateScreenRoute.name,
          path: 'bulk-create-smart-contracts',
        );

  static const String name = 'BulkCreateScreenRoute';
}

/// generated route for
/// [_i6.ConfigContainerScreen]
class ConfigContainerScreenRoute extends _i46.PageRouteInfo<void> {
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
    extends _i46.PageRouteInfo<void> {
  const SmartContractCreatorContainerScreenRoute(
      {List<_i46.PageRouteInfo>? children})
      : super(
          SmartContractCreatorContainerScreenRoute.name,
          path: 'create-smart-contract',
          initialChildren: children,
        );

  static const String name = 'SmartContractCreatorContainerScreenRoute';
}

/// generated route for
/// [_i8.MotherDashboardScreen]
class MotherDashboardScreenRoute extends _i46.PageRouteInfo<void> {
  const MotherDashboardScreenRoute()
      : super(
          MotherDashboardScreenRoute.name,
          path: 'mother-dashboard',
        );

  static const String name = 'MotherDashboardScreenRoute';
}

/// generated route for
/// [_i9.RemoteShopContainerScreen]
class RemoteShopContainerScreenRoute extends _i46.PageRouteInfo<void> {
  const RemoteShopContainerScreenRoute({List<_i46.PageRouteInfo>? children})
      : super(
          RemoteShopContainerScreenRoute.name,
          path: 'remote-shop-container',
          initialChildren: children,
        );

  static const String name = 'RemoteShopContainerScreenRoute';
}

/// generated route for
/// [_i10.SellerChatScreen]
class SellerChatScreenRoute
    extends _i46.PageRouteInfo<SellerChatScreenRouteArgs> {
  SellerChatScreenRoute({
    _i47.Key? key,
    required String address,
  }) : super(
          SellerChatScreenRoute.name,
          path: 'chat/:address',
          args: SellerChatScreenRouteArgs(
            key: key,
            address: address,
          ),
          rawPathParams: {'address': address},
        );

  static const String name = 'SellerChatScreenRoute';
}

class SellerChatScreenRouteArgs {
  const SellerChatScreenRouteArgs({
    this.key,
    required this.address,
  });

  final _i47.Key? key;

  final String address;

  @override
  String toString() {
    return 'SellerChatScreenRouteArgs{key: $key, address: $address}';
  }
}

/// generated route for
/// [_i11.ShopChatScreen]
class ShopChatScreenRoute extends _i46.PageRouteInfo<ShopChatScreenRouteArgs> {
  ShopChatScreenRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

  final String shopUrl;

  @override
  String toString() {
    return 'ShopChatScreenRouteArgs{key: $key, shopUrl: $shopUrl}';
  }
}

/// generated route for
/// [_i12.EmptyRouterPage]
class HomeTabRouter extends _i46.PageRouteInfo<void> {
  const HomeTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class SendTabRouter extends _i46.PageRouteInfo<void> {
  const SendTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          SendTabRouter.name,
          path: 'send',
          initialChildren: children,
        );

  static const String name = 'SendTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class ReceiveTabRouter extends _i46.PageRouteInfo<void> {
  const ReceiveTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          ReceiveTabRouter.name,
          path: 'receive',
          initialChildren: children,
        );

  static const String name = 'ReceiveTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class TransactionsTabRouter extends _i46.PageRouteInfo<void> {
  const TransactionsTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          TransactionsTabRouter.name,
          path: 'transactions',
          initialChildren: children,
        );

  static const String name = 'TransactionsTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class ValidatorTabRouter extends _i46.PageRouteInfo<void> {
  const ValidatorTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          ValidatorTabRouter.name,
          path: 'validator',
          initialChildren: children,
        );

  static const String name = 'ValidatorTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class AdjudicatorTabRouter extends _i46.PageRouteInfo<void> {
  const AdjudicatorTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          AdjudicatorTabRouter.name,
          path: 'adjudicator',
          initialChildren: children,
        );

  static const String name = 'AdjudicatorTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class NodesTabsRouter extends _i46.PageRouteInfo<void> {
  const NodesTabsRouter({List<_i46.PageRouteInfo>? children})
      : super(
          NodesTabsRouter.name,
          path: 'nodes',
          initialChildren: children,
        );

  static const String name = 'NodesTabsRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class DatanodeTabRouter extends _i46.PageRouteInfo<void> {
  const DatanodeTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          DatanodeTabRouter.name,
          path: 'datanode',
          initialChildren: children,
        );

  static const String name = 'DatanodeTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class NftTabRouter extends _i46.PageRouteInfo<void> {
  const NftTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          NftTabRouter.name,
          path: 'nft',
          initialChildren: children,
        );

  static const String name = 'NftTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class SmartContractsTabRouter extends _i46.PageRouteInfo<void> {
  const SmartContractsTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          SmartContractsTabRouter.name,
          path: 'smart-contracts',
          initialChildren: children,
        );

  static const String name = 'SmartContractsTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class DstsTabRouter extends _i46.PageRouteInfo<void> {
  const DstsTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          DstsTabRouter.name,
          path: 'dsts',
          initialChildren: children,
        );

  static const String name = 'DstsTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class AdnrTabRouter extends _i46.PageRouteInfo<void> {
  const AdnrTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          AdnrTabRouter.name,
          path: 'adnr',
          initialChildren: children,
        );

  static const String name = 'AdnrTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class VotingTabRouter extends _i46.PageRouteInfo<void> {
  const VotingTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          VotingTabRouter.name,
          path: 'voting',
          initialChildren: children,
        );

  static const String name = 'VotingTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class BeaconTabRouter extends _i46.PageRouteInfo<void> {
  const BeaconTabRouter({List<_i46.PageRouteInfo>? children})
      : super(
          BeaconTabRouter.name,
          path: 'beacons',
          initialChildren: children,
        );

  static const String name = 'BeaconTabRouter';
}

/// generated route for
/// [_i13.HomeScreen]
class HomeScreenRoute extends _i46.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i14.ReserveAccountOverviewScreen]
class ReserveAccountOverviewScreenRoute extends _i46.PageRouteInfo<void> {
  const ReserveAccountOverviewScreenRoute()
      : super(
          ReserveAccountOverviewScreenRoute.name,
          path: 'reserve-accounts',
        );

  static const String name = 'ReserveAccountOverviewScreenRoute';
}

/// generated route for
/// [_i15.SendScreen]
class SendScreenRoute extends _i46.PageRouteInfo<void> {
  const SendScreenRoute()
      : super(
          SendScreenRoute.name,
          path: '',
        );

  static const String name = 'SendScreenRoute';
}

/// generated route for
/// [_i16.ReceiveScreen]
class ReceiveScreenRoute extends _i46.PageRouteInfo<void> {
  const ReceiveScreenRoute()
      : super(
          ReceiveScreenRoute.name,
          path: '',
        );

  static const String name = 'ReceiveScreenRoute';
}

/// generated route for
/// [_i17.TransactionsScreen]
class TransactionsScreenRoute extends _i46.PageRouteInfo<void> {
  const TransactionsScreenRoute()
      : super(
          TransactionsScreenRoute.name,
          path: '',
        );

  static const String name = 'TransactionsScreenRoute';
}

/// generated route for
/// [_i18.ValidatorScreen]
class ValidatorScreenRoute extends _i46.PageRouteInfo<void> {
  const ValidatorScreenRoute()
      : super(
          ValidatorScreenRoute.name,
          path: '',
        );

  static const String name = 'ValidatorScreenRoute';
}

/// generated route for
/// [_i19.AdjudicatorScreen]
class AdjudicatorScreenRoute extends _i46.PageRouteInfo<void> {
  const AdjudicatorScreenRoute()
      : super(
          AdjudicatorScreenRoute.name,
          path: '',
        );

  static const String name = 'AdjudicatorScreenRoute';
}

/// generated route for
/// [_i20.NodeListScreen]
class NodeListScreenRoute extends _i46.PageRouteInfo<void> {
  const NodeListScreenRoute()
      : super(
          NodeListScreenRoute.name,
          path: '',
        );

  static const String name = 'NodeListScreenRoute';
}

/// generated route for
/// [_i21.DataNodeScreen]
class DataNodeScreenRoute extends _i46.PageRouteInfo<void> {
  const DataNodeScreenRoute()
      : super(
          DataNodeScreenRoute.name,
          path: '',
        );

  static const String name = 'DataNodeScreenRoute';
}

/// generated route for
/// [_i22.NftListScreen]
class NftListScreenRoute extends _i46.PageRouteInfo<void> {
  const NftListScreenRoute()
      : super(
          NftListScreenRoute.name,
          path: '',
        );

  static const String name = 'NftListScreenRoute';
}

/// generated route for
/// [_i23.SmartContractsScreen]
class SmartContractsScreenRoute extends _i46.PageRouteInfo<void> {
  const SmartContractsScreenRoute()
      : super(
          SmartContractsScreenRoute.name,
          path: '',
        );

  static const String name = 'SmartContractsScreenRoute';
}

/// generated route for
/// [_i24.DstLandingScreen]
class DstLandingScreenRoute extends _i46.PageRouteInfo<void> {
  const DstLandingScreenRoute()
      : super(
          DstLandingScreenRoute.name,
          path: '',
        );

  static const String name = 'DstLandingScreenRoute';
}

/// generated route for
/// [_i25.SellerChatThreadListScreen]
class SellerChatThreadListScreenRoute extends _i46.PageRouteInfo<void> {
  const SellerChatThreadListScreenRoute()
      : super(
          SellerChatThreadListScreenRoute.name,
          path: 'chat',
        );

  static const String name = 'SellerChatThreadListScreenRoute';
}

/// generated route for
/// [_i26.MyCollectionsListScreen]
class MyCollectionsListScreenRoute extends _i46.PageRouteInfo<void> {
  const MyCollectionsListScreenRoute()
      : super(
          MyCollectionsListScreenRoute.name,
          path: 'me',
        );

  static const String name = 'MyCollectionsListScreenRoute';
}

/// generated route for
/// [_i27.MyCollectionDetailScreen]
class MyCollectionDetailScreenRoute
    extends _i46.PageRouteInfo<MyCollectionDetailScreenRouteArgs> {
  MyCollectionDetailScreenRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

  final int collectionId;

  @override
  String toString() {
    return 'MyCollectionDetailScreenRouteArgs{key: $key, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i28.CreateCollectionContainerScreen]
class CreateCollectionContainerScreenRoute extends _i46.PageRouteInfo<void> {
  const CreateCollectionContainerScreenRoute()
      : super(
          CreateCollectionContainerScreenRoute.name,
          path: 'createCollection',
        );

  static const String name = 'CreateCollectionContainerScreenRoute';
}

/// generated route for
/// [_i29.CreateDecShopContainerScreen]
class CreateDecShopContainerScreenRoute extends _i46.PageRouteInfo<void> {
  const CreateDecShopContainerScreenRoute()
      : super(
          CreateDecShopContainerScreenRoute.name,
          path: 'createDecShop',
        );

  static const String name = 'CreateDecShopContainerScreenRoute';
}

/// generated route for
/// [_i30.ListingDetailScreen]
class ListingDetailScreenRoute
    extends _i46.PageRouteInfo<ListingDetailScreenRouteArgs> {
  ListingDetailScreenRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

  final int listingId;

  @override
  String toString() {
    return 'ListingDetailScreenRouteArgs{key: $key, listingId: $listingId}';
  }
}

/// generated route for
/// [_i31.ListingAuctionDetailScreen]
class ListingAuctionDetailScreenRoute
    extends _i46.PageRouteInfo<ListingAuctionDetailScreenRouteArgs> {
  ListingAuctionDetailScreenRoute({
    _i47.Key? key,
    required int listingId,
  }) : super(
          ListingAuctionDetailScreenRoute.name,
          path: ':listingId/auction',
          args: ListingAuctionDetailScreenRouteArgs(
            key: key,
            listingId: listingId,
          ),
          rawPathParams: {'listingId': listingId},
        );

  static const String name = 'ListingAuctionDetailScreenRoute';
}

class ListingAuctionDetailScreenRouteArgs {
  const ListingAuctionDetailScreenRouteArgs({
    this.key,
    required this.listingId,
  });

  final _i47.Key? key;

  final int listingId;

  @override
  String toString() {
    return 'ListingAuctionDetailScreenRouteArgs{key: $key, listingId: $listingId}';
  }
}

/// generated route for
/// [_i32.CreateListingContainerScreen]
class CreateListingContainerScreenRoute
    extends _i46.PageRouteInfo<CreateListingContainerScreenRouteArgs> {
  CreateListingContainerScreenRoute({
    required int collectionId,
    _i47.Key? key,
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

  final _i47.Key? key;

  @override
  String toString() {
    return 'CreateListingContainerScreenRouteArgs{collectionId: $collectionId, key: $key}';
  }
}

/// generated route for
/// [_i33.AdnrScreen]
class AdnrScreenRoute extends _i46.PageRouteInfo<void> {
  const AdnrScreenRoute()
      : super(
          AdnrScreenRoute.name,
          path: '',
        );

  static const String name = 'AdnrScreenRoute';
}

/// generated route for
/// [_i34.TopicListScreen]
class TopicListScreenRoute extends _i46.PageRouteInfo<void> {
  const TopicListScreenRoute()
      : super(
          TopicListScreenRoute.name,
          path: '',
        );

  static const String name = 'TopicListScreenRoute';
}

/// generated route for
/// [_i35.TopicDetailScreen]
class TopicDetailScreenRoute
    extends _i46.PageRouteInfo<TopicDetailScreenRouteArgs> {
  TopicDetailScreenRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

  final String topicUid;

  @override
  String toString() {
    return 'TopicDetailScreenRouteArgs{key: $key, topicUid: $topicUid}';
  }
}

/// generated route for
/// [_i36.CreateTopicScreen]
class CreateTopicScreenRoute extends _i46.PageRouteInfo<void> {
  const CreateTopicScreenRoute()
      : super(
          CreateTopicScreenRoute.name,
          path: 'create',
        );

  static const String name = 'CreateTopicScreenRoute';
}

/// generated route for
/// [_i37.BeaconListScreen]
class BeaconListScreenRoute extends _i46.PageRouteInfo<void> {
  const BeaconListScreenRoute()
      : super(
          BeaconListScreenRoute.name,
          path: '',
        );

  static const String name = 'BeaconListScreenRoute';
}

/// generated route for
/// [_i38.SmartContractCreatorMain]
class SmartContractCreatorMainRoute extends _i46.PageRouteInfo<void> {
  const SmartContractCreatorMainRoute()
      : super(
          SmartContractCreatorMainRoute.name,
          path: 'main',
        );

  static const String name = 'SmartContractCreatorMainRoute';
}

/// generated route for
/// [_i39.RemoteShopListScreen]
class RemoteShopListScreenRoute extends _i46.PageRouteInfo<void> {
  const RemoteShopListScreenRoute()
      : super(
          RemoteShopListScreenRoute.name,
          path: 'shops',
        );

  static const String name = 'RemoteShopListScreenRoute';
}

/// generated route for
/// [_i40.BuyerChatThreadListScreen]
class BuyerChatThreadListScreenRoute extends _i46.PageRouteInfo<void> {
  const BuyerChatThreadListScreenRoute()
      : super(
          BuyerChatThreadListScreenRoute.name,
          path: 'shops/chat',
        );

  static const String name = 'BuyerChatThreadListScreenRoute';
}

/// generated route for
/// [_i41.RemoteShopDetailScreen]
class RemoteShopDetailScreenRoute
    extends _i46.PageRouteInfo<RemoteShopDetailScreenRouteArgs> {
  RemoteShopDetailScreenRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

  final String shopUrl;

  @override
  String toString() {
    return 'RemoteShopDetailScreenRouteArgs{key: $key, shopUrl: $shopUrl}';
  }
}

/// generated route for
/// [_i42.RemoteShopCollectionScreen]
class RemoteShopCollectionScreenRoute
    extends _i46.PageRouteInfo<RemoteShopCollectionScreenRouteArgs> {
  RemoteShopCollectionScreenRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

  final int collectionId;

  final String url;

  @override
  String toString() {
    return 'RemoteShopCollectionScreenRouteArgs{key: $key, collectionId: $collectionId, url: $url}';
  }
}

/// generated route for
/// [_i43.WebShopDetailScreen]
class ThirdPartyWebShopDetailScreenRoute
    extends _i46.PageRouteInfo<ThirdPartyWebShopDetailScreenRouteArgs> {
  ThirdPartyWebShopDetailScreenRoute({
    _i47.Key? key,
    required int shopId,
  }) : super(
          ThirdPartyWebShopDetailScreenRoute.name,
          path: 'third-party/shop/:shopId',
          args: ThirdPartyWebShopDetailScreenRouteArgs(
            key: key,
            shopId: shopId,
          ),
          rawPathParams: {'shopId': shopId},
        );

  static const String name = 'ThirdPartyWebShopDetailScreenRoute';
}

class ThirdPartyWebShopDetailScreenRouteArgs {
  const ThirdPartyWebShopDetailScreenRouteArgs({
    this.key,
    required this.shopId,
  });

  final _i47.Key? key;

  final int shopId;

  @override
  String toString() {
    return 'ThirdPartyWebShopDetailScreenRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i44.WebCollectionDetailScreen]
class ThirdPartyWebCollectionDetailScreenRoute
    extends _i46.PageRouteInfo<ThirdPartyWebCollectionDetailScreenRouteArgs> {
  ThirdPartyWebCollectionDetailScreenRoute({
    _i47.Key? key,
    required int shopId,
    required int collectionId,
  }) : super(
          ThirdPartyWebCollectionDetailScreenRoute.name,
          path: 'third-party/shop/:shopId/collection/:collectionId',
          args: ThirdPartyWebCollectionDetailScreenRouteArgs(
            key: key,
            shopId: shopId,
            collectionId: collectionId,
          ),
          rawPathParams: {
            'shopId': shopId,
            'collectionId': collectionId,
          },
        );

  static const String name = 'ThirdPartyWebCollectionDetailScreenRoute';
}

class ThirdPartyWebCollectionDetailScreenRouteArgs {
  const ThirdPartyWebCollectionDetailScreenRouteArgs({
    this.key,
    required this.shopId,
    required this.collectionId,
  });

  final _i47.Key? key;

  final int shopId;

  final int collectionId;

  @override
  String toString() {
    return 'ThirdPartyWebCollectionDetailScreenRouteArgs{key: $key, shopId: $shopId, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i45.WebListingDetailScreen]
class ThirdPartyWebListingDetailScreenRoute
    extends _i46.PageRouteInfo<ThirdPartyWebListingDetailScreenRouteArgs> {
  ThirdPartyWebListingDetailScreenRoute({
    _i47.Key? key,
    required int shopId,
    required int collectionId,
    required int listingId,
  }) : super(
          ThirdPartyWebListingDetailScreenRoute.name,
          path:
              'third-party/shop/:shopId/collection/:collectionId/listing/:listingId',
          args: ThirdPartyWebListingDetailScreenRouteArgs(
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

  static const String name = 'ThirdPartyWebListingDetailScreenRoute';
}

class ThirdPartyWebListingDetailScreenRouteArgs {
  const ThirdPartyWebListingDetailScreenRouteArgs({
    this.key,
    required this.shopId,
    required this.collectionId,
    required this.listingId,
  });

  final _i47.Key? key;

  final int shopId;

  final int collectionId;

  final int listingId;

  @override
  String toString() {
    return 'ThirdPartyWebListingDetailScreenRouteArgs{key: $key, shopId: $shopId, collectionId: $collectionId, listingId: $listingId}';
  }
}
