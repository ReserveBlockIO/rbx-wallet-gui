import 'dart:convert';

import 'package:rbx_wallet/features/dst/models/dec_shop.dart';

import '../../../core/services/base_service.dart';

class RemoteShopService extends BaseService {
  RemoteShopService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<DecShop?> getShopInfo(String url) async {
    if (!url.contains("rbx://")) {
      url = "rbx://$url";
    }

    try {
      final response = await getText('/GetNetworkDecShopInfo/$url');
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

  Future<dynamic> connectToShop({required String myAddress, required String shopUrl}) async {
    shopUrl = shopUrl.trim();
    if (!shopUrl.startsWith("rbx://")) {
      shopUrl = "rbx://$shopUrl";
    }

    try {
      await getText("/ConnectToDecShop/$myAddress/$shopUrl");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
