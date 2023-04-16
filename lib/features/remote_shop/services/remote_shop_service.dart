import 'dart:convert';
import 'dart:io';

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

  Future<OrganizedShop?> getConnectedShopData([bool showErrors = false]) async {
    await getText("/GetDecShopData", cleanPath: false);
    // ShopData? shopData = await shop_utils.getShopData(service: this);

    ShopData? shopData;

    await shop_utils.requestCollectionsAndListings(service: this);
    await Future.delayed(Duration(milliseconds: 500));
    await shop_utils.requestCollectionsAndListings(service: this);

    shopData = await shop_utils.getShopData(service: this);
    await Future.delayed(Duration(seconds: 1));
    shopData = await shop_utils.getShopData(service: this);

    if (shopData == null) {
      if (showErrors) {
        Toast.error("An error occurred. Could not get shop data.");
      }

      return null;
    }

    return await shop_utils.organizeShopData(service: this, shopData: shopData);
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
}
