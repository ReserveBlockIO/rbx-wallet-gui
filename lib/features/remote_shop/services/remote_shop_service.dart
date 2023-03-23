import 'dart:convert';

import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/voting/models/adj_vote.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/services/base_service.dart';
import "../models/shop_data.dart";
import 'package:collection/collection.dart';

class RemoteShopService extends BaseService {
  RemoteShopService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<DecShop?> getShopInfo(String url) async {
    if (!url.startsWith("rbx://")) {
      url = "rbx://$url";
    }

    try {
      final response = await getText('/GetNetworkDecShopInfo/$url', cleanPath: false);
      print(response);
      final data = jsonDecode(response);
      if (data['Success'] == true) {
        return DecShop.fromJson(data['DecShop']);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> connectToShop({required String myAddress, required String shopUrl}) async {
    shopUrl = shopUrl.trim();
    if (!shopUrl.startsWith("rbx://")) {
      shopUrl = "rbx://$shopUrl";
    }

    try {
      final data = await getText("/ConnectToDecShop/$myAddress/$shopUrl", cleanPath: false, inspect: true);
      print("ConnectToDecShop: $data");
      return data == "true";
    } catch (e) {
      print(e);
      return false;
    }
  }

  OrganizedShop _organizeShopData(ShopData shopData) {
    return OrganizedShop(
        decShop: shopData.decShop,
        collections: shopData.collections
            .map(
              (c) => OrganizedCollection(
                id: c.id,
                name: c.name,
                description: c.description,
                collectionLive: c.collectionLive,
                isDefault: c.isDefault,
                listings: shopData.listings
                    .where((l) => l.collectionId == c.id)
                    .map(
                      (l) => OrganizedListing(
                        id: l.id,
                        smartContractUid: l.smartContractUid,
                        addressOwner: l.addressOwner,
                        isBuyNowOnly: l.isBuyNowOnly,
                        isRoyaltyEnforced: l.isRoyaltyEnforced,
                        isCancelled: l.isCancelled,
                        requireBalanceCheck: l.requireBalanceCheck,
                        isDefault: l.isDefault,
                        startDate: l.startDate,
                        endDate: l.endDate,
                        isVisibleBeforeStartDate: l.isVisibleBeforeStartDate,
                        isVisibleAfterEndDate: l.isVisibleAfterEndDate,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList());
  }

  Future<ShopData?> _getShopData([ShopData? fallback]) async {
    final response = await getText("/GetDecShopData", cleanPath: false);
    final data = jsonDecode(response);

    print("----- /GetDecShopData ------");
    print(response);
    print("----------------------------");

    if (data['Success'] == true) {
      return ShopData.fromJson(data['DecShopData']);
    }

    return fallback;
  }

  Future<OrganizedShop?> getConnectedShopData([bool showErrors = false]) async {
    final info = await getText("/GetShopInfo", cleanPath: false);

    if (info != "true") {
      if (showErrors) {
        Toast.error("Couldn't get shop info.");
      }
      return null;
    }

    await Future.delayed(Duration(milliseconds: 1000));
    await getText("/GetShopCollections", cleanPath: false);
    await Future.delayed(Duration(milliseconds: 1000));
    await getText("/GetShopListings/1", cleanPath: false);
    await Future.delayed(Duration(milliseconds: 1000));

    ShopData? shopData = await _getShopData();

    if (shopData != null) {
      if (shopData.collections.isNotEmpty) {
        print("Collections found");
        for (final collection in shopData.collections) {
          await getText("/GetShopListingsByCollection/${collection.id}/1", cleanPath: false);
        }
        shopData = await _getShopData(shopData);
      }
    }

    if (shopData == null) {
      if (showErrors) {
        Toast.error("An error occurred");
      }

      return null;
    }

    return _organizeShopData(shopData);
  }
}
