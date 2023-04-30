import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/dst/models/bid.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/providers/connected_shop_provider.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/web_shop/models/web_listing.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_detail_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_listing_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:collection/collection.dart';

class WebBidListProvider extends StateNotifier<List<Bid>> {
  final Ref ref;
  final int listingId;

  WebBidListProvider(this.ref, this.listingId) : super([]);

  // Future<List<Bid>> fetchBids([OrganizedListing? listing]) async {
  //   List<Bid> globalBids = [];
  //   if (listing != null) {
  //     globalBids = await RemoteShopService().getBidsByListingId(listing.id);

  //   }

  //   final myBids = await DstService().listBuyerBids(listingId);

  //   final bids = [...myBids];

  //   for (final b in globalBids) {
  //     final exists = bids.firstWhereOrNull((bid) => bid.bidSignature == b.bidSignature) != null;
  //     if (!exists) {
  //       bids.add(b);
  //     }
  //   }

  //   bids.sort((a, b) => a.bidSendTime > b.bidSendTime ? -1 : 1);

  //   ref.read(connectedShopProvider.notifier).refresh(true);

  //   state = bids;
  //   return bids;
  // }

  bool validateBeforeBid(WebListing listing, double amount) {
    if (kIsWeb) {
      final balance = ref.read(webSessionProvider).balance;
      if (balance == null) {
        Toast.error("No Balance");
        return false;
      }

      if (balance < (amount + MIN_RBX_FOR_SC_ACTION)) {
        Toast.error("Not enough balance.");
        return false;
      }

      return true;
    }
    final wallet = ref.read(sessionProvider).currentWallet;

    if (wallet == null) {
      Toast.error("No wallet selected");
      return false;
    }

    if (wallet.balance < (amount + MIN_RBX_FOR_SC_ACTION)) {
      Toast.error("Not enough balance.");
      return false;
    }

    if (wallet.isValidating) {
      if (wallet.balance < (amount + MIN_RBX_FOR_SC_ACTION + ASSURED_AMOUNT_TO_VALIDATE)) {
        Toast.error("Not enough balance since you are validating.");
        return false;
      }
    }

    return true;
  }

  Future<bool?> buyNow(BuildContext context, WebListing listing) async {
    if (!kIsWeb) {
      if (!guardWalletIsSynced(ref)) {
        return null;
      }
    }

    if (!validateBeforeBid(listing, listing.buyNowPrice!)) {
      return null;
    }

    final confirmed = await ConfirmDialog.show(
      context: context,
      title: "Buy Now",
      body: "Are you sure you want to buy now for ${listing.buyNowPrice} RBX?",
      confirmText: "Buy Now",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return null;
    }

    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;
    if (address == null) {
      Toast.error("No Wallet");
      return null;
    }

    // TODO: Signature for web

    final success = await WebShopService().sendBid(
      amount: listing.buyNowPrice!,
      address: address,
      listingId: listing.id,
      isBuyNow: true,
    );

    if (kIsWeb) {
      //TODO: Web
    } else {
      final coreBid = Bid.create(
        address: address,
        listingId: listingId,
        collectionId: listing.collection.id,
        bidAmount: listing.buyNowPrice!,
        maxBidAmount: listing.buyNowPrice!,
        purchaseKey: listing.purchaseKey,
        isBuyNow: true,
        isRaw: true,
        bidStatus: success ? BidStatus.Rejected : BidStatus.Accepted,
      );

      final bidSaved = await RemoteShopService().sendBid(coreBid, listing.id);

      return bidSaved && success;
    }

    return success;
  }

  Future<bool?> sendBid(BuildContext context, WebListing listing) async {
    if (!kIsWeb) {
      if (!guardWalletIsSynced(ref)) {
        return null;
      }
    }

    if (listing.auction == null) {
      Toast.error("Auction is not live");
      return null;
    }

    if (!listing.isActive) {
      Toast.error("Auction is over");
      return null;
    }

    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;

    if (address == null) {
      Toast.error("No wallet");
      return null;
    }

    final minimumBid = listing.auction!.currentBidPrice! + listing.auction!.incrementAmount;

    final amountStr = await PromptModal.show(
      title: "Place Bid",
      validator: (val) => formValidatorNumber(val, "Bid Amount"),
      labelText: "Bid Amount (RBX)",
      footer: "Must be greater than $minimumBid RBX",
      confirmText: "Continue",
      cancelText: "Cancel",
    );

    if (amountStr == null) {
      return null;
    }

    final amount = double.tryParse(amountStr);
    if (amount == null) {
      Toast.error("Invalid amount");
      return null;
    }

    if (listing.auction == null) {
      Toast.error("No auction");
      return null;
    }

    if (amount <= listing.auction!.currentBidPrice!) {
      Toast.error("Your bid must be greater than the current highest bid (${listing.auction!.currentBidPrice} RBX)");
      return null;
    }

    if (amount <= listing.auction!.currentBidPrice! + listing.auction!.incrementAmount) {
      Toast.error(
          "The minimum increment amount is ${listing.auction!.incrementAmount} RBX. A bid grater than ${listing.auction!.currentBidPrice! + listing.auction!.incrementAmount} RBX is required.");
      return null;
    }

    double maxAmount = amount;

    if (!validateBeforeBid(listing, listing.floorPrice!)) {
      return null;
    }

    final confirmed = await ConfirmDialog.show(
      context: context,
      title: "Place Bid",
      body: "Are you sure you want to place a bid of $amount RBX${amount != maxAmount ? ' with a max bid of $maxAmount RBX' : ''}?",
      confirmText: "Place Bid",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return null;
    }

    // TODO: Signature for web

    bool success = await WebShopService().sendBid(
      amount: amount,
      address: address,
      listingId: listing.id,
      isBuyNow: false,
    );

    if (kIsWeb) {
      //TODO: web
    } else {
      final coreBid = Bid.create(
        address: address,
        listingId: listingId,
        collectionId: listing.collection.id,
        bidAmount: amount,
        maxBidAmount: amount,
        purchaseKey: listing.purchaseKey,
        isBuyNow: false,
        isRaw: true,
        bidStatus: success ? BidStatus.Rejected : BidStatus.Accepted,
      );

      success = success && await RemoteShopService().sendBid(coreBid, listing.id);
    }

    if (success) {
      ref.read(webListingListProvider("${listing.collection.shop?.id},${listing.collection.id}").notifier).refresh();
      Toast.message("Bid Submitted");
    } else {
      Toast.error();
    }

    return success;
  }
}

final webBidListProvider = StateNotifierProvider.family<WebBidListProvider, List<Bid>, int>((ref, listingId) {
  return WebBidListProvider(ref, listingId);
});
