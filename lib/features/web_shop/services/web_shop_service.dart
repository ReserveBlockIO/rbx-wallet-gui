
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../core/env.dart';
import '../../../core/models/paginated_response.dart';
import '../../../core/services/base_service.dart';
import '../../web/utils/raw_transaction.dart';
import '../models/web_bid.dart';
import '../models/web_collection.dart';
import '../models/web_listing.dart';
import '../models/web_shop.dart';
import '../models/auth_token.dart';
import '../../../utils/toast.dart';

class WebShopService extends BaseService {
  WebShopService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
          withWebAuth: true,
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
      final params = {
        'address': address,
        'message': message,
        'signature': signature,
      };

      final response = await postJson('/auth/sign-token/', params: params, auth: false);

      return AuthToken.fromJson(response['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Shops

  Future<ServerPaginatedReponse<WebShop>> listShops({
    int page = 1,
    String? ownerAddress,
    String search = '',
    required bool myShops,
  }) async {
    try {
      Map<String, dynamic> params = {
        'page': page,
        'search': search,
      };

      if (ownerAddress != null) {
        params['owner_address'] = ownerAddress;
      }

      if (!myShops) {
        params['is_published'] = true;
      } else {
        params['is_third_party'] = true;
      }

      final data = await getJson("/shop/", params: params, auth: false);

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
      final data = await getJson("/shop/$shopId/", auth: false);
      return WebShop.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<WebShop?> lookupShop(String url) async {
    try {
      final data = await getJson("/shop/url", params: {'url': url}, auth: false);
      return WebShop.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<bool> checkAvailabilty(String url) async {
    try {
      final data = await getJson("/shop/url/available", params: {'url': url}, auth: false);
      return data['available'] == true;
    } catch (e, st) {
      print(e);
      print(st);
      return false;
    }
  }

  Future<WebShop?> saveWebShop(WebShop shop) async {
    try {
      late final Map<String, dynamic> response;
      if (shop.isNew) {
        response = await postJson(
          "/shop",
          params: shop.toJson(),
          auth: false,
        );
      } else {
        response = await patchJson(
          "/shop/${shop.id}",
          params: shop.toJson(),
          auth: true,
        );
      }

      return WebShop.fromJson(response['data']);
    } catch (e, st) {
      if (e is DioError) print(e.response);
      print(e);
      print(st);
      return null;
    }
  }

  // Collections

  Future<ServerPaginatedReponse<WebCollection>> listCollections(int shopId, [int page = 1]) async {
    try {
      final data = await getJson("/shop/$shopId/collection/", params: {'page': page}, auth: false);
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
        final response = await postJson("/shop/${collection.shop!.id}/collection/", params: collection.toJson(), auth: false);
        return WebCollection.fromJson(response['data']);
      } else {
        final response = await patchJson(
          "/shop/${collection.shop!.id}/collection/${collection.id}/",
          params: collection.toJson(),
          auth: true,
        );
        return WebCollection.fromJson(response['data']);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<WebCollection?> retrieveCollection(int shopId, int collectionId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/", auth: false);
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
        auth: false,
      );

      final List<WebListing> results = data['results'].map<WebListing>((item) => WebListing.fromJson(item)).toList();

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
      final data = await getJson(
        "/shop/$shopId/collection/$collectionId/listing/$listingId/",
        auth: false,
      );
      return WebListing.fromJson(data);
    } catch (e, st) {
      print(e);
      print(st);
      return null;
    }
  }

  Future<bool> saveWebListing(WebListing listing, int shopId, int collectionId) async {
    try {
      if (listing.exists) {
        final data = await patchJson(
          '/shop/$shopId/collection/$collectionId/listing/${listing.id}/',
          params: listing.toJson(),
          auth: true,
        );
      } else {
        final data = await postJson('/shop/$shopId/collection/$collectionId/listing/', params: listing.toJson());
      }
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
      await deleteJson(
        '/shop/${store.id}',
        auth: true,
        responseIsJson: true,
      );
      return true;
    } catch (e, st) {
      if (e is DioError) print(e.response);
      print(e);
      print(st);
      return false;
    }
  }

  Future<bool> deleteCollection(WebCollection collection) async {
    try {
      final data = await deleteJson(
        '/shop/${collection.shop!.id}/collection/${collection.id}',
        responseIsJson: true,
        auth: true,
      );
      return true;
    } catch (e, st) {
      if (e is DioError) print(e.response);
      print(e);
      print(st);
      return false;
    }
  }

  Future<bool> deleteWebListing(WebListing listing) async {
    try {
      final data = await deleteJson(
        '/shop/${listing.collection.shop!.id}/collection/${listing.collection.id}/listing/${listing.id}',
        responseIsJson: true,
        auth: true,
      );
      return true;
    } catch (e, st) {
      if (e is DioError) print(e.response);
      print(e);
      print(st);
      return false;
    }
  }

  Future<WebBid?> getBid(int bidId) async {
    try {
      final data = await getJson('/shop/bid/$bidId');
      return WebBid.fromJson(data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> sendBid({
    required double amount,
    required String address,
    required int listingId,
    required bool isBuyNow,
    String? signature,
    String? preSignedSaleCompleteTx,
  }) async {
    final payload = {
      "amount": amount,
      "address": address,
      "listing": listingId,
      "from_third_party": kIsWeb,
      "is_buy_now": isBuyNow,
      "signature": signature ?? "NA",
      "pre_signed_sale_complete_tx": preSignedSaleCompleteTx ?? "",
    };

    final response = await postJson(
      "/shop/bid/",
      params: payload,
      auth: false,
    );
    final Map<String, dynamic> data = response['data'];

    print(data);

    if (data.containsKey('success') && data['success'] == true) {
      return true;
    }

    Toast.error(data['message'] ?? "A problem occurred");
    return false;
  }

  Future<bool> submitAcceptedCoreBid({
    required String bidId,
    required int listingId,
    required double amount,
    required bool isBuyNow,
    required String address,
    required String signature,
  }) async {
    try {
      final params = {
        "bid_id": bidId,
        "listing": listingId,
        "amount": amount,
        "is_buy_now": isBuyNow,
        "address": address,
        "signature": signature,
      };

      await postJson(
        "/shop/bid/submit/",
        params: params,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> requestShopSync(String shopUrl, {int delay = 35}) async {
    await getJson("/shop/resync", params: {'url': shopUrl, 'delay': delay});
  }

  Future<bool> createContact(String email, String address) async {
    try {
      await postJson("/auth/email-subscribe/", params: {'email': email, 'address': address});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
