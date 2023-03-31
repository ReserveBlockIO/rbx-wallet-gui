import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/models/paginated_response.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/web_shop/models/web_collection.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';

class WebShopService extends BaseService {
  WebShopService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
        );

  // Shops

  Future<ServerPaginatedReponse<WebShop>> listShops([int page = 1]) async {
    try {
      final data = await getJson("/shop/", params: {'page': page});
      final List<WebShop> results = data['results'].map<WebShop>((item) => WebShop.fromJson(item)).toList();
      return ServerPaginatedReponse<WebShop>(
        count: data['count'],
        page: data['page'],
        num_pages: data['num_pages'],
        results: results,
      );
    } catch (e, st) {
      print(e);
      print(st);
    }
    return ServerPaginatedReponse<WebShop>.empty();
  }

  Future<WebShop?> retrieveShop(int shopId) async {
    try {
      final data = await getJson("/shop/$shopId/");
      return WebShop.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<WebShop?> lookupShop(String url) async {
    try {
      final data = await getJson("/shop/url", params: {'url': url});
      return WebShop.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  // Collections

  Future<ServerPaginatedReponse<WebCollection>> listCollections(int shopId, [int page = 1]) async {
    try {
      final data = await getJson("/shop/$shopId/collection/", params: {'page': page});
      final List<WebCollection> results = data['results'].map<WebCollection>((item) => WebCollection.fromJson(item)).toList();
      return ServerPaginatedReponse<WebCollection>(
        count: data['count'],
        page: data['page'],
        num_pages: data['num_pages'],
        results: results,
      );
    } catch (e, st) {
      print(e);
      print(st);
    }

    return ServerPaginatedReponse<WebCollection>.empty();
  }

  Future<WebCollection?> retrieveCollection(int shopId, int collectionId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/");
      return WebCollection.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  // Listings

  Future<ServerPaginatedReponse<WebListing>> listListings(int shopId, int collectionId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/listing");
      final List<WebListing> results = data['results'].map<WebListing>((item) => WebListing.fromJson(item)).toList();
      print(results);
      return ServerPaginatedReponse<WebListing>(
        count: data['count'],
        page: data['page'],
        num_pages: data['num_pages'],
        results: results,
      );
    } catch (e, st) {
      print(e);
      print(st);
    }

    return ServerPaginatedReponse<WebListing>.empty();
  }

  Future<WebListing?> retrieveListing(int shopId, int collectionId, int listingId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/listing/$listingId/");
      print(WebListing.fromJson(data));
      return WebListing.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }
}
