import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/features/web_shop/models/web_collection.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_listing_list_provider.dart';

import '../../../core/dialogs.dart';
import '../../../utils/toast.dart';
import '../models/web_listing.dart';
import '../models/web_nft.dart';
import '../services/web_shop_service.dart';

class WebListingFormProvider extends StateNotifier<WebListing> {
  final Ref ref;
  late final TextEditingController buyNowController;
  late final TextEditingController floorPriceController;
  late final TextEditingController startDateController;
  late final TextEditingController endDateController;
  final GlobalKey<FormState> formKey = GlobalKey();

  WebListingFormProvider(this.ref, WebListing model) : super(model) {
    startDateController = TextEditingController(
      text: model.startDate.isAtSameMomentAs(DateTime.now()) ? DateFormat.yMd().format(model.startDate) : '',
    );
    endDateController = TextEditingController(
      text: model.endDate.isAtSameMomentAs(DateTime.now()) ? DateFormat.yMd().format(model.endDate) : '',
    );
    buyNowController = TextEditingController(
      text: model.buyNowPrice != null ? model.buyNowPrice.toString() : '',
    );
    floorPriceController = TextEditingController(
      text: model.floorPrice != null ? model.floorPrice.toString() : '',
    );
  }

  load(WebListing listing, int collectionId, int shopId) {
    startDateController.text = listing.startDate.difference(DateTime.now()).inHours > 2 ? DateFormat.yMd().format(listing.startDate) : "";
    endDateController.text = listing.endDate.difference(DateTime.now()).inHours > 2 ? DateFormat.yMd().format(listing.endDate) : "";
    buyNowController.text = (listing.buyNowPrice ?? '').toString();
    floorPriceController.text = (listing.floorPrice ?? '').toString();
    state = listing.copyWith(
      collection: WebCollection.empty().copyWith(
        id: collectionId,
        shop: WebShop.empty().copyWith(
          id: shopId,
        ),
      ),
      enableBuyNow: listing.isBuyNow,
      enableAuction: listing.isAuction,
    );
  }

  updateNFT(String nft) {
    state = state.copyWith(
      smartContractUid: nft,
    );
  }

  clearNft() {
    state = state.copyWith(
      nft: WebNft.empty(),
      smartContractUid: '',
      ownerAddress: '',
    );
  }

  updateDate(DateTime date, bool isStartDate) {
    if (date.isBefore(DateTime.now()) && !isStartDate) {
      OverlayToast.error("End date must be in the future.");

      return;
    }

    if (!isStartDate) {
      if (date.isBefore(state.startDate)) {
        OverlayToast.error("End Date must be after the start date");
      }
    }
    state = isStartDate ? state.copyWith(startDate: date) : state.copyWith(endDate: date);

    startDateController.text = DateFormat.yMd().format(state.startDate);
    endDateController.text = DateFormat.yMd().format(state.endDate);
  }

  updateBuyNow(String price) {
    state = state.copyWith(buyNowPrice: double.parse(price));
  }

  updateFloorPrice(String price) {
    state = state.copyWith(floorPrice: double.parse(price));
  }

  updateEnableBuyOnly(bool enableBuyOnly) {
    state = state.copyWith(enableBuyNow: enableBuyOnly);
  }

  updateEnableAuction(bool enableAuction) {
    state = state.copyWith(enableAuction: enableAuction);
  }

  complete(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (state.smartContractUid.isEmpty) {
      Toast.error('The NFT must be set');
      return;
    }
    if (!state.enableAuction && !state.enableBuyNow) {
      Toast.error('Enable at least one of the options (Buy now or Auction)');
      return;
    }

    if (await WebShopService().saveWebListing(state, state.collection.shop!.id, state.collection.id)) {
      ref.read(webListingListProvider("${state.collection.shop!.id},${state.collection.id}").notifier).refresh();
      clear();
      AutoRouter.of(context).pop();
    }
  }

  clear() {
    buyNowController.text = "";
    startDateController.text = "";
    endDateController.text = "";
    floorPriceController.text = "";
    state = WebListing.empty();
  }

  delete(BuildContext context, int storeId, WebListing listing) async {
    final confirmed = await ConfirmDialog.show(
      title: "Delete WebListing",
      body: "Are you sure you want to delete this listing?",
      destructive: true,
      confirmText: "Delete",
      cancelText: "Cancel",
    );
    if (confirmed == true) {
      // if (await WebShopService().deleteWebListing(listing)) {
      clear();
      // ref.read(listingListProvider(storeId).notifier).refresh();
      AutoRouter.of(context).pop();
      // }
    }
  }
}

final createWebListingProvider = StateNotifierProvider<WebListingFormProvider, WebListing>((ref) {
  return WebListingFormProvider(ref, WebListing.empty());
});
