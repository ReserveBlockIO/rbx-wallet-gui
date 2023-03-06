import 'dart:convert';
import 'package:rbx_wallet/features/dst/models/listing.dart';
import 'package:rbx_wallet/features/dst/models/store.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';

import '../../../core/services/base_service.dart';

class DstService extends BaseService {
  DstService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<Store?> retreiveStore(int id) async {
    try {
      final response = await getText("/GetCollection/$id");
      final data = jsonDecode(response);

      if (data['Success'] != true) {
        print(data['Message']);
        return null;
      }

      return Store.fromJson(data['Collection']);
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

  Future<List<Store>> listStores() async {
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

      final List<Store> stores = [];
      for (final item in items) {
        stores.add(Store.fromJson(item));
      }
      return stores;
    } catch (e, st) {
      print(e);
      print(st);
      return [];
    }
  }

  Future<bool> saveStore(Store store) async {
    try {
      await postJson('/SaveCollection', params: store.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteStore(Store store) async {
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
      print(listing);
      final response = await getText('/DeleteListing/${listing.id}');
      print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
