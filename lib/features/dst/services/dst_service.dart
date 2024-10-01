import 'dart:convert';
import '../models/bid.dart';
import '../models/listing.dart';
import '../models/collection.dart';
import '../../nft/models/nft.dart';
import '../../nft/services/nft_service.dart';
import '../../../utils/toast.dart';

import '../../../core/services/base_service.dart';
import '../models/dec_shop.dart';

class DstService extends BaseService {
  DstService() : super(apiBasePathOverride: "/dstapi/DSTV1");

  Future<Collection?> retreiveCollection(int id) async {
    try {
      final response = await getText("/GetCollection/$id");
      final data = jsonDecode(response);

      if (data['Success'] != true) {
        // print(data['Message']);
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
      final response = await getText(
        "/GetListing/$id",
      );
      final data = jsonDecode(response);

      if (data['Success'] != true) {
        // print(data['Message']);
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
        // print(data['Message']);

        return [];
      }

      final items = data['Collections'];

      final List<Collection> collections = [];
      for (final item in items) {
        collections.add(Collection.fromJson(item));
      }
      return collections;
    } catch (e, st) {
      print(e);
      print(st);
      return [];
    }
  }

  // Future<List<Bid>> listBids() async {
  //   try {
  //     final response = await getText("/GetBids", cleanPath: false);
  //     if (response.isEmpty) {
  //       return [];
  //     }
  //     final data = jsonDecode(response);

  //     if (data["Success"] != true) {
  //       // print(data['Message']);

  //       return [];
  //     }

  //     final items = data['Bids'];

  //     final List<Bid> bids = [];
  //     for (final item in items) {
  //       bids.add(Bid.fromJson(item));
  //     }
  //     return bids;
  //   } catch (e, st) {
  //     print(e);
  //     print(st);
  //     return [];
  //   }
  // }

  Future<bool> saveCollection(Collection store) async {
    try {
      await postJson('/SaveCollection', params: store.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Bid>> _listBids(int listingId, bool isBuyer) async {
    try {
      final response = await getText(
        '/GetListingBids/$listingId/${isBuyer ? 0 : 1}',
        cleanPath: false,
      );
      final data = jsonDecode(response);

      if (data["Success"] != true) {
        // Toast.error(data['Message']);
        print(data);
        return [];
      }

      final items = data['Bids'];

      final List<Bid> bids = [];
      for (final item in items) {
        bids.add(Bid.fromJson(item));
      }
      return bids;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Bid>> listGlobalListingBids(int listingId) async {
    try {
      final response = await getText(
        '/GetShopListingBids/$listingId',
        cleanPath: false,
      );
      final data = jsonDecode(response);

      if (data["Success"] != true) {
        print(data);
        return [];
      }

      final items = data['Bids'];

      final List<Bid> bids = [];
      for (final item in items) {
        bids.add(Bid.fromJson(item));
      }
      return bids;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Bid>> listBuyerBids(int listingId) async {
    return await _listBids(listingId, true);
  }

  Future<List<Bid>> listSellerBids(int listingId) async {
    return await _listBids(listingId, false);
  }

  Future<List<Bid>> listListingBidsByStatus(BidStatus status) async {
    try {
      final response = await getText('/GetBidsByStatus/${status.name}');
      final data = jsonDecode(response);

      if (data["Success"] != true) {
        return [];
      }

      final items = data['Bids'];

      final List<Bid> bids = [];
      for (final item in items) {
        bids.add(Bid.fromJson(item));
      }
      return bids;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Bid?> retreiveListingBid(String id) async {
    try {
      final response = await getText('/GetSingleBids/$id');
      final data = jsonDecode(response);
      if (data['Success'] == true) {
        // print(response);
        return Bid.fromJson(data['Bid']);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<bool> getShopAuctions(int page) async {
  //   try {
  //     final response = await getText('/GetShopAuctions/$page');
  //     final data = jsonDecode(response);
  //     if (data['Success'] == true) {
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future<DecShop?> retreiveShop() async {
    try {
      final response = await getText('/GetDecShop');
      final data = jsonDecode(response);
      if (data['Success'] == true) {
        // print(response);
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

      // print("********");
      // print(response);
      // print("********");

      if (data['Success'] == true) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> importShop(String address) async {
    try {
      final response = await getText('/GetImportDecShopFromNetwork/$address', cleanPath: false);
      final data = jsonDecode(response);

      print("********");
      print(response);
      print("********");

      if (data['Success'] == true) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteShopLocally() async {
    try {
      final response = await getText('/GetDeleteLocalDecShop');
      final data = jsonDecode(response);

      print("********");
      print(response);
      print("********");

      if (data['Success'] == true) {
        return true;
      }

      Toast.error(data['Message'] ?? "A problem occurred");

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteShop() async {
    try {
      await getText('/GetDeleteDecShop');
      return true;
    } catch (e) {
      print(e);
      Toast.error();
      return false;
    }
  }

  // use if published
  Future<bool> updateShop() async {
    try {
      final response = await getText('/GetUpdateDecShop');
      final data = jsonDecode(response);

      print(data);
      if (data['Success'] == true) {
        return true;
      }

      Toast.error(data['Message']);
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
      // print(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> saveDecShop(DecShop decShop) async {
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

    // print(payload);

    try {
      final response = await postJson('/SaveDecShop', params: payload);
      // print(response);
      if (response['data']['Success']) {
        return true;
      } else {
        Toast.error(response['data']["Message"]);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteCollection(Collection store) async {
    try {
      await getText('/DeleteCollection/${store.id}');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  saveListing(Listing listing) async {
    try {
      await postJson('/SaveListing', params: listing.toJson());
      return true;
    } catch (e) {
      print("Error Saving: $e");
      return false;
    }
  }

  Future<List<Listing>> listListings(int collectionId) async {
    try {
      final response = await getText("/GetCollectionListings/$collectionId", cleanPath: false);

      if (response.isEmpty) {
        return [];
      }
      final data = jsonDecode(response);

      if (data["Success"] != true) {
        // print(data['Message']);
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
      // print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> cancelListing(Listing listing) async {
    try {
      final response = await getText('/CancelListing/${listing.id}');
      // print(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<String>> listedNftIds() async {
    // final shop = await retreiveShop();

    // if (shop == null) {
    //   return null;
    // }

    final List<String> ids = [];

    final collections = await listCollections();

    for (final c in collections) {
      final listings = await listListings(c.id);

      for (final l in listings) {
        final listing = await retreiveListing(l.id);
        if (listing != null) {
          ids.add(listing.smartContractUid);
        }
      }
    }

    return ids;
  }

  Future<bool> retrySale(int listingId) async {
    try {
      final response = await getText("/RetrySale/$listingId");
      final data = jsonDecode(response);
      if (data['Success'] == true) {
        Toast.message("Attempting to send sale complete TX.");
        return true;
      }

      Toast.error(data['Message']);

      return false;
    } catch (e) {
      print(e);
      Toast.error();
      return false;
    }
  }
}
