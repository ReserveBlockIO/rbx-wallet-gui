import 'dart:convert';
import 'dart:io';

import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/features/dst/models/bid.dart';
import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/base_service.dart';
import "../models/shop_data.dart";

import '../utils.dart' as shop_utils;

class RemoteShopService extends BaseService {
  RemoteShopService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<DecShop?> getShopInfo(String shopUrl) async {
    return await shop_utils.getNetworkShop(service: this, shopUrl: shopUrl);
  }

  Future<bool> connectToShop({required String myAddress, required String shopUrl}) async {
    return await shop_utils.connectToShop(
      service: this,
      myAddress: myAddress,
      shopUrl: shopUrl,
    );
  }

  Future<OrganizedShop?> getConnectedShopData({
    bool showErrors = false,
    listingCount = 0,
    int attempt = 1,
  }) async {
    if (attempt > 10) {
      Toast.error("An error occurred. Could not get shop data.");
      return null;
    }
    final shopData = await shop_utils.getShopData(service: this);

    // ShopData? shopData = await shop_utils.getShopData(service: this);

    // ShopData? shopData;

    // await shop_utils.requestCollectionsAndListings(
    //   service: this,
    //   listingCount: listingCount,
    // );

    // await Future.delayed(Duration(milliseconds: 500));

    // await shop_utils.requestCollectionsAndListings(
    //   service: this,
    //   listingCount: listingCount,
    // );

    // shopData = await shop_utils.getShopData(service: this);
    // await Future.delayed(Duration(seconds: 1));
    // shopData = await shop_utils.getShopData(service: this);

    if (shopData == null) {
      await Future.delayed(Duration(seconds: 2));
      return await getConnectedShopData(attempt: attempt + 1);
    }

    if (shopData.listings.isEmpty) {
      await Future.delayed(Duration(seconds: 2));

      return await getConnectedShopData(attempt: attempt + 1);
    }

    return await shop_utils.organizeShopData(service: this, shopData: shopData);
  }

  Future<void> requestAuctionData(int listingId) async {
    await getText("/GetShopSpecificAuction/$listingId", cleanPath: false);
    await Future.delayed(Duration(milliseconds: 250));
    await getText("/GetShopListingBids/$listingId", cleanPath: false);
    await Future.delayed(Duration(milliseconds: 250));
  }

  Future<List<Bid>> getBidsByListingId(int listingId) async {
    try {
      await requestAuctionData(listingId);
      // await getText("/GetShopSpecificAuction/$listingId", cleanPath: false);
      // await Future.delayed(Duration(milliseconds: 250));
      // await getText("/GetShopListingBids/$listingId", cleanPath: false);
      // await Future.delayed(Duration(milliseconds: 250));
      // await getText("/GetShopListingBids/$listingId", cleanPath: false);
      // await Future.delayed(Duration(milliseconds: 250));
      final text = await getText("/GetDecShopData", cleanPath: false);
      final data = jsonDecode(text);

      final bids = data['DecShopData']['Bids'];

      final List<Bid> response = [];
      for (final bidData in bids) {
        print(bidData);
        final b = Bid.fromJson(bidData);
        if (b.listingId == listingId) {
          response.add(b);
        }
      }

      return response;
    } catch (e) {
      print("getBidsByListingId Error");
      print(e);
      return [];
    }
  }

  Future<bool> sendBid(Bid bid) async {
    final params = bid.toJson();
    try {
      final response = await postJson(
        bid.isBuyNow ? '/SendBuyNowBid' : '/SendBid',
        params: params,
        cleanPath: false,
        inspect: true,
      );
      final data = response['data'];

      if (data["Success"] == true) {
        return true;
      }
      Toast.error(data['Message'] ?? "A problem occurred");
      return false;
    } catch (e) {
      print(e);
      Toast.error();
      return false;
    }
  }

  Future<bool> resendBid(String bidId) async {
    try {
      final response = await getText(
        '/ResendBid/$bidId',
        cleanPath: false,
      );

      final data = jsonDecode(response);
      if (data['Success'] != true) {
        Toast.error(data['Message'] ?? "A problem occurred");
        return false;
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> completeNftPurchase(String scId) async {
  //   try {
  //     final data = await getJson(
  //       '/CompleteNFTPurchase/$scId',
  //       cleanPath: false,
  //     );

  //     if (data["Success"] == true) {
  //       return true;
  //     }

  //     Toast.error(data['Message'] ?? "A problem occurred");
  //     return false;
  //   } catch (e) {
  //     print(e);
  //     Toast.error();
  //     return false;
  //   }
  // }

  Future<List<DecShop>> listRemoteShops() async {
    const tempDataStr =
        '[{"Id":34,"UniqueId":"KsQmYokSEJ1681996900","Name":"RBX Testnet Shop","DecShopURL":"rbx://rbxtestnetshop","ThirdPartyBaseURL":null,"ThirdPartyAPIURL":null,"Description":"My new shop.","OwnerAddress":"xNsQq9C7mXYGV7VFG17QZx1WZLP6BbnR7d","HostingType":0,"IP":"51.222.206.200","Port":13341,"STUNServerGroup":0,"OriginalBlockHeight":85405,"OriginalTXHash":"d571f724be511d0be6e26c8c78f870db3bbd59c73e57ae83ef2a2dc6e84fba20","LatestBlockHeight":85405,"LatestTXHash":"d571f724be511d0be6e26c8c78f870db3bbd59c73e57ae83ef2a2dc6e84fba20","UpdateTimestamp":0,"AutoUpdateNetworkDNS":true,"NeedsPublishToNetwork":false,"IsOffline":false,"IsPublished":true,"CollectionCount":0,"ListingCount":0,"AuctionCount":0,"IsIPDifferent":true}, {"Id":38,"UniqueId":"IlftxfSNlq1682384797","Name":"Presidents","DecShopURL":"rbx://Prez","ThirdPartyBaseURL":null,"ThirdPartyAPIURL":null,"Description":"Presidents","OwnerAddress":"xWURceUzoxsmTgKkRjGDFeJPhraEmsBVfD","HostingType":0,"IP":"75.41.218.48","Port":13341,"STUNServerGroup":1,"OriginalBlockHeight":104183,"OriginalTXHash":"5af6e1384c9cfdc960b04b71bfc4e9293f3dcb6fabbf982e1db146432e9983de","LatestBlockHeight":104183,"LatestTXHash":"5af6e1384c9cfdc960b04b71bfc4e9293f3dcb6fabbf982e1db146432e9983de","UpdateTimestamp":0,"AutoUpdateNetworkDNS":true,"NeedsPublishToNetwork":false,"IsOffline":false,"IsPublished":true,"CollectionCount":0,"ListingCount":0,"AuctionCount":0,"IsIPDifferent":true},{"Id":39,"UniqueId":"WZUXfFjHEp1682386473","Name":"city","DecShopURL":"rbx://city","ThirdPartyBaseURL":null,"ThirdPartyAPIURL":null,"Description":"city","OwnerAddress":"xUHfmVW4PgFGsQMqJunWRpgcJ1Y7Md3bqF","HostingType":0,"IP":"31.220.93.82","Port":13341,"STUNServerGroup":1,"OriginalBlockHeight":104262,"OriginalTXHash":"29b58f9d695d843d082a712277b02b64edb4e8527c7bc8a1c829d0d7941146bb","LatestBlockHeight":104262,"LatestTXHash":"29b58f9d695d843d082a712277b02b64edb4e8527c7bc8a1c829d0d7941146bb","UpdateTimestamp":0,"AutoUpdateNetworkDNS":true,"NeedsPublishToNetwork":false,"IsOffline":false,"IsPublished":true,"CollectionCount":0,"ListingCount":0,"AuctionCount":0,"IsIPDifferent":true}]';

    await Future.delayed(Duration(milliseconds: 500));
    final List<dynamic> tempData = jsonDecode(tempDataStr);

    return tempData.map((item) => DecShop.fromJson(item)).toList();
  }
}
