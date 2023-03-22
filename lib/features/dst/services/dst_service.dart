import 'dart:convert';
import 'package:rbx_wallet/features/dst/models/listing.dart';
import 'package:rbx_wallet/features/dst/models/collection.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';

import '../../../core/services/base_service.dart';
import '../models/dec_shop.dart';

class DstService extends BaseService {
  DstService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<Collection?> retreiveCollection(int id) async {
    try {
      final response = await getText("/GetCollection/$id");
      final data = jsonDecode(response);

      if (data['Success'] != true) {
        print(data['Message']);
        return null;
      }

      return Collection.fromJson(data['Collection']);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<Listing?> retreiveListing(int id) async {
    try {
      final response = await getText("/GetListing/$id");
      final data = jsonDecode(response);

      if (data['Success'] != true) {
        print(data['Message']);
        return null;
      }

      Nft? nft;

      try {
        nft = await NftService().retrieve(data['Listing']['SmartContractUID']);
      } catch (e) {
        print(e);
      }

      return Listing.fromJson(data['Listing']).copyWith(nft: nft);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<List<Collection>> listCollections() async {
    try {
      final response = await getText("/GetAllCollections", cleanPath: false);
      if (response.isEmpty) {
        return [];
      }
      final data = jsonDecode(response);

      if (data["Success"] != true) {
        print(data['Message']);

        return [];
      }

      final items = data['Collections'];

      final List<Collection> stores = [];
      for (final item in items) {
        stores.add(Collection.fromJson(item));
      }
      return stores;
    } catch (e, st) {
      print(e);
      print(st);
      return [];
    }
  }

  Future<bool> saveCollection(Collection store) async {
    try {
      await postJson('/SaveCollection', params: store.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<DecShop?> retreiveShop() async {
    try {
      final response = await getText('/GetDecShop');
      final data = jsonDecode(response);
      if (data['Success'] == true) {
        print(response);
        return DecShop.fromJson(data['DecShop']);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // use if not published
  Future<bool> publishShop() async {
    try {
      final response = await getText('/GetPublishDecShop');
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // use if published
  Future<bool> updateShop() async {
    try {
      final response = await getText('/GetUpdateDecShop');
      final data = jsonDecode(response);
      if (data['Success'] == true) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> toggleOnlineOffline() async {
    try {
      final response = await getText('/GetSetShopStatus');
      final data = jsonDecode(response);
      print(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> saveDecShop(DecShop decShop) async {
    // String url = decShop.url;
    // if (!url.startsWith("rbx://")) {
    //   url = "rbx://$url";
    // }

    final payload = {
      'Name': decShop.name.trim(),
      'DecShopURL': decShop.url.trim().replaceAll("rbx://", ""),
      'Description': decShop.description.trim(),
      'OwnerAddress': decShop.ownerAddress,
      'DecShopHostingType': decShop.type,
      // TODO: IP (if self host)
      // TODO: Port, (if self host)
      'AutoUpdateNetworkDNS': decShop.autoUpdateNetworkDns,
    };

    print(payload);

    try {
      final response = await postJson('/SaveDecShop', params: payload);
      print(response);
      if (response['data']['Success']) {
        return true;
      } else {
        throw ('Error saving dec shop');
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteCollection(Collection store) async {
    try {
      final response = await getText('/DeleteCollection/${store.id}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  saveListing(Listing listing) async {
    try {
      final response = await postJson('/SaveListing', params: listing.toJson());
      return true;
    } catch (e) {
      print("Error Saving: $e");
      return false;
    }
  }

  Future<List<Listing>> listListings(int storeId) async {
    try {
      final response = await getText("/GetCollectionListings/$storeId", cleanPath: false);

      if (response.isEmpty) {
        return [];
      }
      final data = jsonDecode(response);

      if (data["Success"] != true) {
        print(data['Message']);
        return [];
      }

      final items = data['Listings'];

      final List<Listing> listings = [];
      for (final item in items) {
        Nft? nft;
        try {
          nft = await NftService().retrieve(item['SmartContractUID']);
        } catch (e) {
          print(e);
        }

        listings.add(Listing.fromJson(item).copyWith(nft: nft));
      }

      return listings;
    } catch (e) {
      print("Error listing listings $e");
      return [];
    }
  }

  Future<bool> deleteListing(Listing listing) async {
    try {
      final response = await getText('/DeleteListing/${listing.id}');
      print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> cancelListing(Listing listing) async {
    try {
      final response = await getText('/CancelListing/${listing.id}');
      print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
