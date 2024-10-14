import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app.dart';
import '../../web_shop/services/web_shop_service.dart';
import '../../../core/app_constants.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../dst/models/bid.dart';
import '../../dst/services/dst_service.dart';
import '../../global_loader/global_loading_provider.dart';
import '../models/shop_data.dart';
import 'connected_shop_provider.dart';
import '../services/remote_shop_service.dart';
import '../../../utils/guards.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import 'package:collection/collection.dart';

class BidListProvider extends StateNotifier<List<Bid>> {
  final Ref ref;
  final String identifier;
  late final int listingId;
  late final int collectionId;

  BidListProvider(this.ref, this.identifier) : super([]) {
    final parts = identifier.split("_").map((p) => int.tryParse(p)).where((p) => p != null).toList();

    if (parts.length != 2) {
      print("Invalid identifier $identifier");
      return;
    }

    collectionId = parts.first!;
    listingId = parts.last!;

    fetchBids();
  }

  Future<List<Bid>> fetchBids([OrganizedListing? listing]) async {
    List<Bid> globalBids = [];
    if (listing != null) {
      globalBids = await RemoteShopService().getBidsByListingId(listing.id);

      // await RemoteShopService().getText("/GetShopListingBids/${listing.id}", cleanPath: false);
      // await Future.delayed(Duration(milliseconds: 250));
      // await ref.read(connectedShopProvider.notifier).refresh();
      // final data = ref.read(connectedShopProvider).decShop.b
    }

    final myBids = await DstService().listBuyerBids(listingId);
    // List<Bid> globalBids = listing != null ? listing.bids : [];
    final bids = [...myBids];

    for (final b in globalBids) {
      final exists = bids.firstWhereOrNull((bid) => bid.bidSignature == b.bidSignature) != null;
      if (!exists) {
        bids.add(b);
      }
    }

    bids.sort((a, b) => a.bidSendTime > b.bidSendTime ? -1 : 1);

    ref.read(connectedShopProvider.notifier).refresh(true);

    state = bids;
    return bids;
  }

  bool validateBeforeBid(OrganizedListing listing, double amount) {
    final wallet = ref.read(sessionProvider).currentWallet;

    if (wallet == null) {
      Toast.error("No account selected");
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

  Future<bool?> buyNow(BuildContext context, OrganizedListing listing) async {
    if (!guardWalletIsSynced(ref)) {
      return null;
    }

    if (!validateBeforeBid(listing, listing.buyNowPrice!)) {
      return null;
    }

    final confirmed = await ConfirmDialog.show(
      context: rootNavigatorKey.currentContext,
      title: "Buy Now",
      body: "Are you sure you want to buy now for ${listing.buyNowPrice} VFX?",
      confirmText: "Buy Now",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return null;
    }
    ref.read(globalLoadingProvider.notifier).start();

    final bid = Bid.create(
      address: ref.read(sessionProvider).currentWallet!.address,
      listingId: listingId,
      collectionId: collectionId,
      bidAmount: listing.buyNowPrice!,
      maxBidAmount: listing.buyNowPrice!,
      isBuyNow: true,
      purchaseKey: listing.purchaseKey,
    );

    final success = await RemoteShopService().sendBid(bid);
    if (success) {
      ref.read(connectedShopProvider.notifier).refresh(true);
    }
    ref.read(globalLoadingProvider.notifier).complete();

    return success;
  }

  Future<bool?> sendBid(BuildContext context, OrganizedListing listing) async {
    if (!guardWalletIsSynced(ref)) {
      return null;
    }

    if (listing.auction == null) {
      Toast.error("Auction is not live");
      return null;
    }

    if (!listing.isActive) {
      Toast.error("Auction is over");
      return null;
    }

    final wallet = ref.read(sessionProvider).currentWallet;

    if (wallet == null) {
      Toast.error("No account selected");
      return null;
    }

    final minimumBid = listing.auction!.currentBidPrice + listing.auction!.incrementAmount;

    final amountStr = await PromptModal.show(
      title: "Place Bid",
      validator: (val) => formValidatorNumber(val, "Bid Amount"),
      labelText: "Bid Amount (VFX)",
      footer: "Must be greater than $minimumBid VFX",
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

    if (amount <= listing.auction!.currentBidPrice) {
      Toast.error("Your bid must be greater than the current highest bid (${listing.auction!.currentBidPrice} VFX)");
      return null;
    }

    if (amount <= listing.auction!.currentBidPrice + listing.auction!.incrementAmount) {
      Toast.error(
          "The minimum increment amount is ${listing.auction!.incrementAmount} VFX. A bid grater than ${listing.auction!.currentBidPrice + listing.auction!.incrementAmount} VFX is required.");
      return null;
    }

    double maxAmount = amount;

    //TODO: put this back in when autobidding is supported :)
    // final maxAmountStr = await PromptModal.show(
    //   title: "Max Bid",
    //   body: "You can set the maximum amount you are willing to bid here.",
    //   initialValue: "$amount",
    //   validator: (val) => formValidatorNumber(val, "Bid Amount"),
    //   labelText: "Bid Amount (VFX)",
    //   confirmText: "Continue",
    //   cancelText: "Cancel",
    // );

    // if (maxAmountStr != null) {
    //   maxAmount = double.tryParse(maxAmountStr) ?? maxAmount;
    // }

    // if (maxAmount < amount) {
    //   Toast.error("Max amount can not be less than the bid amount");
    //   return null;
    // }

    if (!validateBeforeBid(listing, listing.floorPrice!)) {
      return null;
    }

    final confirmed = await ConfirmDialog.show(
      context: context,
      title: "Place Bid",
      body: "Are you sure you want to place a bid of $amount VFX${amount != maxAmount ? ' with a max bid of $maxAmount VFX' : ''}?",
      confirmText: "Place Bid",
      cancelText: "Cancel",
    );

    if (confirmed != true) {
      return null;
    }
    ref.read(globalLoadingProvider.notifier).start();

    final bid = Bid.create(
      address: wallet.address,
      listingId: listingId,
      collectionId: collectionId,
      bidAmount: amount,
      maxBidAmount: maxAmount,
      purchaseKey: listing.purchaseKey,
    );

    final success = await RemoteShopService().sendBid(bid);
    if (success) {
      await RemoteShopService().getBidsByListingId(listingId);
      await Future.delayed(Duration(milliseconds: 500));
      ref.read(connectedShopProvider.notifier).refresh(true);
      final url = ref.read(connectedShopProvider).url;
      if (url != null) {
        WebShopService().requestShopSync(url, delay: 10);
      }
    }
    ref.read(globalLoadingProvider.notifier).complete();

    return success;
  }
}

final bidListProvider = StateNotifierProvider.family<BidListProvider, List<Bid>, String>((ref, identifier) {
  return BidListProvider(ref, identifier);
});
