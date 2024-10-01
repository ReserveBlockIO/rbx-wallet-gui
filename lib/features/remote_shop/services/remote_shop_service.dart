import 'dart:convert';

import '../../../core/utils.dart';
import '../../dst/models/bid.dart';
import '../../dst/models/dec_shop.dart';
import '../../web_shop/services/web_shop_service.dart';
import '../../../utils/toast.dart';

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

  Future<bool> checkConnection(String shopUrl) async {
    try {
      final response = await getText("/GetConnections");
      final data = jsonDecode(response);
      final connected = data['Connected'] == true;

      if (connected) {
        final url = data['DecShop']['ShopURL'].toString().toLowerCase();
        if (url == shopUrl.toLowerCase()) {
          return true;
        }
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> clearPings() async {
    await getText("/ClearPingRequest", cleanPath: false);
  }

  Future<bool> pingCheck([String? pingId, int attempt = 1]) async {
    pingId ??= generateRandomString(16);

    print("Pinging with $pingId");

    final response = await getText("/PingShop/$pingId", cleanPath: false);
    final data = jsonDecode(response);

    print("Response 1:");
    print(data);
    if (data['Success'] != true) {
      if (attempt < 3) {
        await Future.delayed(Duration(seconds: 1));
        return pingCheck(pingId, attempt + 1);
      }
      await clearPings();
      return false;
    }

    final checkResponse = await getText("/CheckPingShop/$pingId", cleanPath: false);
    final checkData = jsonDecode(checkResponse);

    if (checkData["Success"] != true) {
      if (attempt < 5) {
        await Future.delayed(Duration(seconds: 1));

        return pingCheck(pingId, attempt + 1);
      }
      await clearPings();
      return false;
    }

    if (checkData['Ping']['Item1'] == true) {
      print("Ping Success");
      await clearPings();
      return true;
    }

    if (attempt < 5) {
      await Future.delayed(Duration(seconds: 1));

      return pingCheck(pingId, attempt + 1);
    }
    await clearPings();

    return false;
  }

  Future<OrganizedShop?> getConnectedShopData({
    bool showErrors = false,
    int attempt = 1,
  }) async {
    final pingSuccess = await pingCheck();

    if (!pingSuccess) {
      print("Ping Fail");
      final shopData = await shop_utils.getShopData(service: this);
      if (shopData != null) {
        return await shop_utils.organizeShopData(service: this, shopData: shopData);
      }
      return null;
    }
    final shopData = await shop_utils.getShopData(service: this);

    if (attempt > 5) {
      print("An error occurred. Could not get full shop data. Sending as is.");
      if (shopData != null) {
        return await shop_utils.organizeShopData(service: this, shopData: shopData);
      }
      return null;
    }

    if (shopData == null) {
      await Future.delayed(Duration(seconds: 2));
      return await getConnectedShopData(attempt: attempt + 1);
    }

    print("L Count: ${shopData.decShop.listingCount}");
    print("Listings[]: ${shopData.listings.length}");

    if (shopData.listings.length < shopData.decShop.listingCount) {
      print("Incorrect Count. Trying again in 10 sec");
      await Future.delayed(Duration(seconds: 10));

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

  Future<bool> sendBid(
    Bid bid, [
    int? thirdPartyListingId,
  ]) async {
    final params = bid.toJson();
    try {
      final response = await postJson(
        bid.isBuyNow ? '/SendBuyNowBid' : '/SendBid',
        params: params,
        cleanPath: false,
      );
      final data = response['data'];

      if (data["Success"] == true) {
        if (thirdPartyListingId != null) {
          final bidId = data['BidId'];
          print("-----------");

          print(data);
          print("-----------");
          final syncSuccess = await WebShopService().submitAcceptedCoreBid(
            amount: bid.bidAmount,
            listingId: thirdPartyListingId,
            bidId: bidId,
            isBuyNow: bid.isBuyNow,
            address: bid.bidAddress,
            signature: data['Bid']['BidSignature'],
          );

          print("Synced: $syncSuccess");
        }

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
