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
    final response = await getJson("/GetDecShopStateTreiList", cleanPath: false);

    if (response['Success'] == true) {
      final List<dynamic> items = response['DecShops'];
      return items.map((item) => DecShop.fromJson(item)).toList();
    }

    Toast.error(response['Message'] ?? "A problem occurred");
    return [];
  }
}
