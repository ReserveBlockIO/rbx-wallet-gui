import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/transaction_service.dart';
import '../../../utils/html_helpers.dart';
import '../../../utils/toast.dart';
import '../models/listing.dart';
import '../models/store_collection.dart';

enum PurchaseType {
  creditCard,
  rbx,
}

class PurchaseModel {
  final PurchaseType type;
  final Listing? listing;
  final StoreCollection? collection;

  const PurchaseModel({
    this.type = PurchaseType.rbx,
    this.listing,
    this.collection,
  });

  PurchaseModel copyWith({
    PurchaseType? type,
    Listing? listing,
    StoreCollection? collection,
  }) {
    return PurchaseModel(
      type: type ?? this.type,
      listing: listing ?? this.listing,
      collection: collection ?? this.collection,
    );
  }
}

class PurchaseProvider extends StateNotifier<PurchaseModel> {
  final Ref ref;
  final String listingSlug;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PurchaseProvider(this.ref, this.listingSlug, [PurchaseModel model = const PurchaseModel()]) : super(model) {
    init();
  }

  init() async {
    final listing = await TransactionService().retrieveListing(listingSlug);
    state = state.copyWith(listing: listing);
  }

  setType(PurchaseType type) {
    state = state.copyWith(type: type);
  }

  setCollection(StoreCollection? collection) {
    state = state.copyWith(collection: collection);
  }

  Future<bool?> submit() async {
    if (state.listing == null) return null;

    if (!formKey.currentState!.validate()) {
      return null;
    }

    final keyPair = ref.read(webSessionProvider).keypair;
    if (keyPair == null) {
      Toast.error("No wallet detected. Please login.");
      return null;
    }

    if (state.type == PurchaseType.creditCard) {
      final redirect = await TransactionService().createCcPurchase(
        listing: state.listing!,
        address: keyPair.public,
        email: keyPair.email,
        collectionSlug: state.collection?.slug,
      );

      if (redirect == null) {
        Toast.error("A problem occurred.");
        return false;
      }

      HtmlHelpers().redirect(redirect);

      return true;
    } else {
      final balance = ref.read(webSessionProvider).balance;

      if (balance == null || (state.listing!.buyNowPriceRbx != null && balance < state.listing!.buyNowPriceRbx!)) {
        Toast.error("Not enough RBX balance.");
        return false;
      }

      final success = await TransactionService().createRbxPurchase(
        listing: state.listing!,
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

final purchaseProvider = StateNotifierProvider.family<PurchaseProvider, PurchaseModel, String>((ref, listingSlug) {
  return PurchaseProvider(ref, listingSlug);
});
