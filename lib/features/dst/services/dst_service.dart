import 'dart:convert';
import 'package:rbx_wallet/features/dst/models/listing.dart';
import 'package:rbx_wallet/features/dst/models/store.dart';

import '../../../core/services/base_service.dart';

class DstService extends BaseService {
  DstService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<Store?> retreiveStore(int id) async {
    try {
      final response = await getText("/GetStore/$id");
      final data = jsonDecode(response);

      if (data['Success'] != true) {
        print(data['Message']);
        return null;
      }

      return Store.fromJson(data['Store']);
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

      return Listing.fromJson(data['Listing']);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<List<Store>> listStores() async {
    try {
      final response = await getText("/GetAllStores", cleanPath: false);
      if (response.isEmpty) {
        return [];
      }
      final data = jsonDecode(response);

      if (data["Success"] != true) {
        print(data['Message']);

        return [];
      }

      final items = data['Stores'];

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
      final response = await postJson('/SaveStore', params: store.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteStore(Store store) async {
    try {
      final response = await getText('/DeleteStore/${store.id}');
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
      print(e);
      return false;
    }
  }

  Future<List<Listing>> listListings(int storeId) async {
    try {
      final response = await getText("/GetStoreListings/$storeId", cleanPath: false);

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
        listings.add(Listing.fromJson(item));
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
