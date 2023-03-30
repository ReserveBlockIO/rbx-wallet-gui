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

  Future<ServerPaginatedReponse<dynamic>> listShops() async {
    try {
      final data = await getJson("/shop/");
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
    return ServerPaginatedReponse.empty();
  }

  Future<dynamic> retrieveShop(int shopId) async {
    try {
      final data = await getJson("/shop/$shopId/");
      return WebShop.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  Future<dynamic> lookupShop(String url) async {
    try {
      final data = await getJson("/shop/url", params: {'url': url});
      return WebShop.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  // Collections

  Future<ServerPaginatedReponse<dynamic>> listCollections(int shopId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/");
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

    return ServerPaginatedReponse.empty();
  }

  Future<dynamic> retrieveCollection(int shopId, int collectionId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/");
      return WebCollection.fromJson(data);
    } catch (e, st) {
      if (e is DioError) {
        print(e.response);
      }
      print(e);
      print(st);
    }
  }

  // Listings

  Future<ServerPaginatedReponse<dynamic>> listListings(int shopId, int collectionId) async {
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

    return ServerPaginatedReponse.empty();
  }

  Future<dynamic> retrieveListing(int shopId, int collectionId, int listingId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/listing/$listingId/");
      print(WebListing.fromJson(data));
      return WebListing.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
    }
    // TODO: map to model and return
  }
}
