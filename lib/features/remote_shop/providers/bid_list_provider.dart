import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/dst/models/bid.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/remote_shop/models/shop_data.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

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

  Future<List<Bid>> fetchBids() async {
    final bids = await DstService().listListingBidsById(listingId);
    bids.sort((a, b) => a.bidSendTime > b.bidSendTime ? -1 : 1);

    state = bids;
    return bids;
  }

  bool validateBeforeBid(OrganizedListing listing, double amount) {
    final wallet = ref.read(sessionProvider).currentWallet;

    if (wallet == null) {
      Toast.error("No wallet selected");
      return false;
    }

    if (wallet.balance < (listing.buyNowPrice! + MIN_RBX_FOR_SC_ACTION)) {
      Toast.error("Not enough balance.");
      return false;
    }

    if (wallet.isValidating) {
      if (wallet.balance < (listing.buyNowPrice! + MIN_RBX_FOR_SC_ACTION + ASSURED_AMOUNT_TO_VALIDATE)) {
        Toast.error("Not enough balance since you are validating.");
        return false;
      }
    }

    return true;
  }

  Future<bool?> buyNow(BuildContext context, OrganizedListing listing) async {
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

    final bid = Bid.create(
      address: ref.read(sessionProvider).currentWallet!.address,
      listingId: listingId,
      collectionId: collectionId,
      bidAmount: listing.buyNowPrice!,
      maxBidAmount: listing.buyNowPrice!,
      isBuyNow: true,
    );

    final success = await RemoteShopService().sendBid(bid);
    return success;
  }

  Future<bool?> sendBid(BuildContext context, OrganizedListing listing) async {
    if (listing.auction == null) {
      Toast.error("Auction is not live");
      return null;
    }

    if (listing.auction!.isAuctionOver) {
      Toast.error("Auction is over");
      return null;
    }

    final wallet = ref.read(sessionProvider).currentWallet;

    if (wallet == null) {
      Toast.error("No wallet selected");
      return null;
    }

    final amountStr = await PromptModal.show(
      title: "Place Bid",
      validator: (val) => formValidatorNumber(val, "Bid Amount"),
      labelText: "Bid Amount (RBX)",
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
      Toast.error("Your bid must be greater than the current highest bid (${listing.auction!.currentBidPrice} RBX)");
      return null;
    }

    double maxAmount = amount;

    final maxAmountStr = await PromptModal.show(
      title: "Max Bid",
      body: "You can set the maximum amount you are willing to bid here.",
      initialValue: "$amount",
      validator: (val) => formValidatorNumber(val, "Bid Amount"),
      labelText: "Bid Amount (RBX)",
      confirmText: "Continue",
      cancelText: "Cancel",
    );

    if (maxAmountStr != null) {
      maxAmount = double.tryParse(maxAmountStr) ?? maxAmount;
    }

    if (maxAmount < amount) {
      Toast.error("Max amount can not be less than the bid amount");
      return null;
    }

    if (!validateBeforeBid(listing, listing.buyNowPrice!)) {
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

    final bid = Bid.create(
      address: wallet.address,
      listingId: listingId,
      collectionId: collectionId,
      bidAmount: amount,
      maxBidAmount: maxAmount,
    );

    final success = await RemoteShopService().sendBid(bid);
    return success;
  }
}

final bidListProvider = StateNotifierProvider.family<BidListProvider, List<Bid>, String>((ref, identifier) {
  return BidListProvider(ref, identifier);
});