import 'package:dio/dio.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/models/paginated_response.dart';
import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/features/web_shop/models/web_collection.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';
import 'package:rbx_wallet/features/web_shop/models/auth_token.dart';

class WebShopService extends BaseService {
  WebShopService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
        );
  // Auth

  Future<AuthToken?> authorize({
    required String message,
    required String address,
    required String privateKey,
    required String publicKey,
  }) async {
    try {
      final signature = await RawTransaction.getSignature(message: message, privateKey: privateKey, publicKey: publicKey);
      print(signature);
      final params = {
        'address': address,
        'message': message,
        'signature': signature,
      };

      final response = await postJson('/auth/sign-token/', params: params);

      return AuthToken.fromJson(response['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Shops

  Future<ServerPaginatedReponse<WebShop>> listShops({int page = 1, String? ownerAddress}) async {
    try {
      Map<String, dynamic> params = {'page': page};

      if (ownerAddress != null) {
        params['owner_address'] = ownerAddress;
      }

      final data = await getJson("/shop/", params: params);

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

  Future<bool> saveWebShop(WebShop shop) async {
    try {
      if (shop.isNew) {
        final data = await postJson("/shop", params: shop.toJson());
      } else {
        final data = await patchJson("/shop/${shop.id}", params: shop.toJson());
      }
      return true;
    } catch (e, st) {
      if (e is DioError) print(e.response);
      print(e);
      print(st);
      return false;
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

  Future<WebCollection?> saveCollection(WebCollection collection) async {
    if (collection.shop == null) {
      print("Shop not set");
      return null;
    }
    try {
      if (!collection.exists) {
        final response = await postJson(
          "/shop/${collection.shop!.id}/collection/",
          params: collection.toJson(),
          inspect: true,
        );
        return WebCollection.fromJson(response['data']);
      } else {
        //TODO:
        print("Patch not implemented");

        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
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

  Future<ServerPaginatedReponse<WebListing>> listListings(int shopId, int collectionId, [int page = 1]) async {
    try {
      final data = await getJson(
        "/shop/$shopId/collection/$collectionId/listing",
        params: {'page': page},
      );
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

  Future<bool> saveWebListing(WebListing listing, int shopId, int collectionId) async {
    try {
      final data = await postJson('/shop/$shopId/collection/$collectionId/listing', params: listing.toJson());
      return true;
    } catch (e, st) {
      if (e is DioError) print(e.response);
      print(e);
      print(st);
      return false;
    }
  }

  Future<bool> deleteWebShop(WebShop store) async {
    try {
      final data = await deleteJson('/shop/${store.id}', responseIsJson: true);
      return true;
    } catch (e, st) {
      if (e is DioError) print(e.response);
      print(e);
      print(st);
      return false;
    }
  }
}
