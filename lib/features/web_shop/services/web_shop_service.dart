import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/services/base_service.dart';

class WebShopService extends BaseService {
  WebShopService()
      : super(
          hostOverride: Env.explorerApiBaseUrl,
        );

  // Shops

  Future<dynamic> listShops() async {
    final data = await getJson("/shop/");
    // TODO: map to model and return
  }

  Future<dynamic> retrieveShop(int shopId) async {
    final data = await getJson("/shop/$shopId/");
    // TODO: map to model and return
  }

  Future<dynamic> lookupShop(String url) async {
    final data = await getJson("/shop/url/", params: {'url': url});
    // TODO: map to model and return
  }

  // Collections

  Future<dynamic> listCollections(int shopId) async {
    final data = await getJson("/shop/$shopId/collection/");
    // TODO: map to model and return
  }

  Future<dynamic> retrieveCollection(int shopId, int collectionId) async {
    final data = await getJson("/shop/$shopId/collection/$collectionId/");
    // TODO: map to model and return
  }

  // Listings

  Future<dynamic> listListings(int shopId, int collectionId) async {
    final data = await getJson("/shop/$shopId/collection/$collectionId/listings/");
    // TODO: map to model and return
  }

  Future<dynamic> retrieveListing(int shopId, int collectionId, int listingId) async {
    final data = await getJson("/shop/$shopId/collection/$collectionId/listing/$listingId/");
    // TODO: map to model and return
  }
}
