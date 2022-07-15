import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';
import 'package:rbx_wallet/features/store/models/store_collection.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

enum BidType {
  creditCard,
  rbx,
}

class BidModel {
  final double amount;
  final BidType type;
  final Listing? listing;
  final StoreCollection? collection;

  const BidModel({this.amount = 0, this.type = BidType.rbx, this.listing, this.collection});

  BidModel copyWith({
    double? amount,
    BidType? type,
    Listing? listing,
    StoreCollection? collection,
  }) {
    return BidModel(
      amount: amount ?? this.amount,
      type: type ?? this.type,
      listing: listing ?? this.listing,
      collection: collection ?? this.collection,
    );
  }
}

class BidProvider extends StateNotifier<BidModel> {
  final Reader read;
  final String listingSlug;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();

  BidProvider(this.read, this.listingSlug, [BidModel model = const BidModel()]) : super(model) {
    init();
  }

  init() async {
    final listing = await TransactionService().retrieveListing(listingSlug);
    state = state.copyWith(listing: listing);
  }

  setType(BidType type) {
    state = state.copyWith(type: type);
  }

  setAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  setCollection(StoreCollection? collection) {
    //todo there isn't a way to actually clear a collection but that should be fine...
    state = state.copyWith(collection: collection);

    print(collection);
    print("COLLECT");
  }

  Future<bool?> submit() async {
    if (state.listing == null) return null;

    if (!formKey.currentState!.validate()) {
      return null;
    }

    final keyPair = read(webSessionProvider).keypair;
    if (keyPair == null) {
      Toast.error("No wallet detected. Please login.");
      return null;
    }

    final amount = double.parse(amountController.text);
    state = state.copyWith(amount: amount);

    bool validAmount = true;
    if (state.type == BidType.rbx) {
      if (amount <= state.listing!.minimumBidRbx) {
        validAmount = false;
      }
    } else {
      if (amount <= state.listing!.minimumBidUsd) {
        validAmount = false;
      }
    }

    if (!validAmount) {
      Toast.error("Bid amount is not high enough");
      return null;
    }

    if (state.type == BidType.creditCard) {
      final redirect = await TransactionService().createCcBid(
        listing: state.listing!,
        amount: amount,
        address: keyPair.public,
        email: keyPair.email,
        collectionSlug: state.collection?.slug,
      );

      if (redirect == null) {
        Toast.error("A problem occurred.");
        return false;
      }

      html.window.open(redirect, "_self");

      return true;
    } else {
      // final rbxAmount = amount / USD_TO_RBX;

      final balance = read(webSessionProvider).balance;

      if (balance == null || balance <= amount) {
        Toast.error("Not enough RBX balance.");
        return false;
      }

      final success = await TransactionService().createRbxBid(
        listing: state.listing!,
        amount: amount,
        address: keyPair.public,
        email: keyPair.email,
        collectionSlug: state.collection?.slug,
      );
      if (success == true) {
        return true;
      }
      return false;
    }
  }
}

final bidProvider = StateNotifierProvider.family<BidProvider, BidModel, String>((ref, listingSlug) {
  return BidProvider(ref.read, listingSlug);
});
