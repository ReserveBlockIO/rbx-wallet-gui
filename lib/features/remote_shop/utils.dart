import 'dart:convert';
import 'dart:io';

import 'package:rbx_wallet/features/dst/models/dec_shop.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:collection/collection.dart';

const MAX_ATTEMPTS = 10;

Future<DecShop?> getNetworkShop({
  required RemoteShopService service,
  required String shopUrl,
  int attempt = 1,
}) async {
  if (!shopUrl.startsWith("rbx://")) {
    shopUrl = "rbx://$shopUrl";
  }

  print("Trying to get shop $shopUrl. Attempt # $attempt");

  final response = await service.getText('/GetNetworkDecShopInfo/$shopUrl', cleanPath: false);
  final data = jsonDecode(response);
  if (data['Success'] == true) {
    return DecShop.fromJson(data['DecShop']);
  }

  if (attempt < MAX_ATTEMPTS) {
    print("Couldn't get data. Waiting 500ms");
    await Future.delayed(Duration(milliseconds: 500));
    return await getNetworkShop(service: service, shopUrl: shopUrl, attempt: attempt + 1);
  }

  print("Couldn't get network shop in $attempt attempts. Exiting.");

  return null;
}

Future<bool> connectToShop({
  required RemoteShopService service,
  required String myAddress,
  required String shopUrl,
  int attempt = 1,
}) async {
  shopUrl = shopUrl.trim();
  if (!shopUrl.startsWith("rbx://")) {
    shopUrl = "rbx://$shopUrl";
  }

  print("Trying to connect to shop $shopUrl. Attempt # $attempt");

  final data = await service.getText(
    "/ConnectToDecShop/$myAddress/$shopUrl",
    cleanPath: false,
    inspect: true,
  );

  if (data == "true") {
    return true;
  }

  if (attempt < MAX_ATTEMPTS) {
    print("Couldn't connect. Waiting 500ms");
    await Future.delayed(Duration(milliseconds: 500));
    return connectToShop(
      service: service,
      myAddress: myAddress,
      shopUrl: shopUrl,
      attempt: attempt + 1,
    );
  }

  print("Couldn't connect in $attempt attempts. Exiting.");

  return false;
}

Future<void> requestCollectionsAndListings({required RemoteShopService service}) async {
  await service.getText("/GetShopInfo", cleanPath: false);
  await Future.delayed(Duration(milliseconds: 500));
  await service.getText("/GetShopCollections", cleanPath: false);
  await Future.delayed(Duration(milliseconds: 500));
  await service.getText("/GetShopListings/0", cleanPath: false);
  await Future.delayed(Duration(milliseconds: 500));
  await service.getText("/GetShopAuctions/0", cleanPath: false);

  //TODO (pagination)
  // if (shopData != null) {
  //   /// TODO: better way of doing this + need for collections/listings
  //   if (shopData.auctions.length >= 10) {
  //     await getText("/GetShopAuctions/1", cleanPath: false);
  //   }
  // }
  // await Future.delayed(Duration(milliseconds: 1000));
}

Future<ShopData?> getShopData({required RemoteShopService service, int attempt = 1}) async {
  final response = await service.getText("/GetDecShopData", cleanPath: false);
  final data = jsonDecode(response);

  if (data['Success'] == true) {
    return ShopData.fromJson(data['DecShopData']);
  }

  if (attempt < MAX_ATTEMPTS) {
    print("Couldn't get shop data. Waiting 500ms");
    await Future.delayed(Duration(milliseconds: 500));
    return await getShopData(service: service, attempt: attempt + 1);
  }

  print("Couldn't get shop data in $attempt attempts. Exiting.");

  return null;
}

Future<dynamic> getNftAssets({required RemoteShopService service, required String scId}) async {
  String thumbsPath = await assetsPath();

  thumbsPath = Platform.isMacOS ? "$thumbsPath/${scId.replaceAll(':', '')}/thumbs" : "$thumbsPath\\${scId.replaceAll(':', '')}\\thumbs";
  if (Directory(thumbsPath).existsSync()) {
    // print("Thumbs directory exists.");
    return;
  }

  final response = await service.getText("/GetNFTAssets/$scId", cleanPath: false);

  final data = jsonDecode(response);
  print(data);
}

Future<OrganizedShop> organizeShopData({required RemoteShopService service, required ShopData shopData}) async {
  final scIds = shopData.listings.map((l) => l.smartContractUid);
  final listingIds = shopData.listings.map((l) => l.id);

  for (final id in listingIds) {
    service.getText("/GetShopListingBids/$id", cleanPath: false);
    // print("ID: $id");
  }

  final Map<String, Nft> nfts = {};

  for (final scId in scIds) {
    if (!nfts.containsKey(scId)) {
      Nft? nft = await NftService().getNftData(scId);
      if (nft != null) {
        // print("Getting NFT: $scId");

        await getNftAssets(service: service, scId: scId);
        await Future.delayed(Duration(milliseconds: 100));

        String thumbsPath = await assetsPath();
        thumbsPath = Platform.isMacOS ? "$thumbsPath/${scId.replaceAll(':', '')}/thumbs" : "$thumbsPath\\${scId.replaceAll(':', '')}\\thumbs";
        nfts[scId] = nft.copyWith(thumbsPath: thumbsPath);
      }
    }
  }

  return OrganizedShop(
      decShop: shopData.decShop,
      collections: shopData.collections.map(
        (c) {
          return OrganizedCollection(
            id: c.id,
            shopId: shopData.decShop.id,
            name: c.name,
            description: c.description,
            collectionLive: c.collectionLive,
            isDefault: c.isDefault,
            listings: shopData.listings.where((l) => l.collectionId == c.id).map(
              (l) {
                final a = shopData.auctions.firstWhereOrNull((a) => a.listingId == l.id && a.collectionId == c.id);
                final bids = shopData.bids.where((b) => b.listingId == l.id).toList();

                return OrganizedListing(
                  id: l.id,
                  collectionId: c.id,
                  smartContractUid: l.smartContractUid,
                  addressOwner: l.addressOwner,
                  isBuyNowOnly: l.isBuyNowOnly,
                  buyNowPrice: l.buyNowPrice,
                  floorPrice: l.floorPrice,
                  isRoyaltyEnforced: l.isRoyaltyEnforced,
                  isCancelled: l.isCancelled,
                  requireBalanceCheck: l.requireBalanceCheck,
                  startDate: l.startDate,
                  endDate: l.endDate,
                  isVisibleBeforeStartDate: l.isVisibleBeforeStartDate,
                  isVisibleAfterEndDate: l.isVisibleAfterEndDate,
                  nft: nfts[l.smartContractUid],
                  auction: a != null
                      ? OrganizedAuction(
                          id: a.id,
                          currentBidPrice: a.currentBidPrice,
                          maxBidPrice: a.maxBidPrice,
                          incrementAmount: a.incrementAmount,
                          isReserveMet: a.isReserveMet,
                          isAuctionOver: a.isAuctionOver,
                          listingId: a.listingId,
                          collectionId: a.collectionId,
                          currentWinningAddress: a.currentWinningAddress,
                        )
                      : null,
                  bids: bids,
                );
              },
            ).toList(),
          );
        },
      ).toList());
}
