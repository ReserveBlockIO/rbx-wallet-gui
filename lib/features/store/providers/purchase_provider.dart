import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

enum PurchaseType {
  creditCard,
  rbx,
}

class PurchaseModel {
  final PurchaseType type;
  final Listing? listing;

  const PurchaseModel({
    this.type = PurchaseType.rbx,
    this.listing,
  });

  PurchaseModel copyWith({
    PurchaseType? type,
    Listing? listing,
  }) {
    return PurchaseModel(
      type: type ?? this.type,
      listing: listing ?? this.listing,
    );
  }
}

class PurchaseProvider extends StateNotifier<PurchaseModel> {
  final Reader read;
  final String listingSlug;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PurchaseProvider(this.read, this.listingSlug, [PurchaseModel model = const PurchaseModel()]) : super(model) {
    init();
  }

  init() async {
    final listing = await TransactionService().retrieveListing(listingSlug);
    state = state.copyWith(listing: listing);
  }

  setType(PurchaseType type) {
    state = state.copyWith(type: type);
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

    if (state.type == PurchaseType.creditCard) {
      final redirect = await TransactionService().createCcPurchase(
        listing: state.listing!,
        address: keyPair.public,
        email: keyPair.email,
      );

      if (redirect == null) {
        Toast.error("A problem occurred.");
        return false;
      }

      html.window.open(redirect, "_self");

      return true;
    } else {
      final balance = read(webSessionProvider).balance;

      if (balance == null || (state.listing!.buyNowPriceRbx != null && balance < state.listing!.buyNowPriceRbx!)) {
        Toast.error("Not enough RBX balance.");
        return false;
      }

      final success = await TransactionService().createRbxPurchase(
        listing: state.listing!,
        address: keyPair.public,
        email: keyPair.email,
      );
      if (success == true) {
        return true;
      }
      return false;
    }
  }
}

final purchaseProvider = StateNotifierProvider.family<PurchaseProvider, PurchaseModel, String>((ref, listingSlug) {
  return PurchaseProvider(ref.read, listingSlug);
});
