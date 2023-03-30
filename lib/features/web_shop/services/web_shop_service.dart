import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/models/paginated_response.dart';
import 'package:rbx_wallet/core/services/base_service.dart';

class WebShopService extends BaseService {
  WebShopService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
        );

  // Shops

  Future<ServerPaginatedReponse<dynamic>> listShops() async {
    try {
      final data = await getJson("/shop/");
      // TODO: map to model and return
    } catch (e, st) {
      print(e);
      print(st);
    }
    return ServerPaginatedReponse.empty();
  }

  Future<dynamic> retrieveShop(int shopId) async {
    try {
      final data = await getJson("/shop/$shopId/");
      // TODO: map to model and return
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  Future<dynamic> lookupShop(String url) async {
    try {
      final data = await getJson("/shop/url/", params: {'url': url});
      // TODO: map to model and return
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  // Collections

  Future<ServerPaginatedReponse<dynamic>> listCollections(int shopId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/");
      // TODO: map to model and return
    } catch (e, st) {
      print(e);
      print(st);
    }

    return ServerPaginatedReponse.empty();
  }

  Future<dynamic> retrieveCollection(int shopId, int collectionId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/");
      // TODO: map to model and return
    } catch (e, st) {
      print(e);
      print(st);
    }
  }

  // Listings

  Future<ServerPaginatedReponse<dynamic>> listListings(int shopId, int collectionId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/listings/");
      // TODO: map to model and return
    } catch (e, st) {
      print(e);
      print(st);
    }

    return ServerPaginatedReponse.empty();
  }

  Future<dynamic> retrieveListing(int shopId, int collectionId, int listingId) async {
    try {
      final data = await getJson("/shop/$shopId/collection/$collectionId/listing/$listingId/");
    } catch (e, st) {
      print(e);
      print(st);
    }
    // TODO: map to model and return
  }
}
