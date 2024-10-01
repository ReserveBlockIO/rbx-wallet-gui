import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'web_listing_full_list_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../../nft/models/nft.dart';
import '../models/web_collection.dart';
import '../models/web_shop.dart';
import 'web_listing_list_provider.dart';

import '../../../utils/toast.dart';
import '../models/web_listing.dart';
import '../services/web_shop_service.dart';

class WebListingFormProvider extends StateNotifier<WebListing> {
  final Ref ref;
  late final TextEditingController buyNowController;
  late final TextEditingController floorPriceController;
  late final TextEditingController reservePriceController;
  late final TextEditingController startDateController;
  late final TextEditingController startTimeController;
  late final TextEditingController endTimeController;
  late final TextEditingController endDateController;
  final GlobalKey<FormState> formKey = GlobalKey();

  WebListingFormProvider(this.ref, WebListing model) : super(model) {
    startDateController = TextEditingController(
      text: model.startDate.isAtSameMomentAs(DateTime.now()) ? DateFormat.yMd().format(model.startDate) : '',
    );
    endDateController = TextEditingController(
      text: model.endDate.isAtSameMomentAs(DateTime.now()) ? DateFormat.yMd().format(model.endDate) : '',
    );
    startTimeController = TextEditingController(
      text: DateFormat("HH:mm").format(model.startDate),
    );
    endTimeController = TextEditingController(
      text: DateFormat("HH:mm").format(model.endDate),
    );
    buyNowController = TextEditingController(
      text: model.buyNowPrice != null ? model.buyNowPrice.toString() : '',
    );
    reservePriceController = TextEditingController(
      text: model.reservePrice != null ? model.reservePrice.toString() : '',
    );
    floorPriceController = TextEditingController(
      text: model.floorPrice != null ? model.floorPrice.toString() : '',
    );
  }

  load(WebListing listing, int collectionId, int shopId) {
    startDateController.text = listing.startDate.difference(DateTime.now()).inHours > 2 ? DateFormat.yMd().format(listing.startDate) : "";
    endDateController.text = listing.endDate.difference(DateTime.now()).inHours > 2 ? DateFormat.yMd().format(listing.endDate) : "";
    startTimeController.text = DateFormat("HH:mm").format(listing.startDate);
    endTimeController.text = DateFormat("HH:mm").format(listing.endDate);
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
    print('State: $state');
  }

  Future<void> updateNFT(Nft nft) async {
    // final webNft = WebNft.fromNft(nft);

    final webNft = await ExplorerService().retrieveWebNft(nft.id);

    state = state.copyWith(nft: webNft, smartContractUid: nft.id);
  }

  clearNft() {
    state = state.copyWith(
      nft: null,
      smartContractUid: '',
      ownerAddress: '',
    );
  }

  updateTime(TimeOfDay time, bool isStartDate) {
    final existing = isStartDate ? state.startDate : state.endDate;

    final d = existing.copyWith(hour: time.hour, minute: time.minute);

    state = isStartDate ? state.copyWith(startDate: d) : state.copyWith(endDate: d);

    if (isStartDate) {
      startTimeController.text = DateFormat("HH:mm").format(d);
    } else {
      endTimeController.text = DateFormat("HH:mm").format(d);
    }
  }

  updateReservePrice(String price) {
    state = state.copyWith(reservePrice: double.parse(price));
  }

  updateEnableReservePrice(bool enableReservePrice) {
    if (state.isAuctionStarted && state.exists) {
      Toast.error('The auction has already started.');
      return;
    }
    state = state.copyWith(enableReservePrice: enableReservePrice);
  }

  updateDate(DateTime date, bool isStartDate) {
    if (!isStartDate) {
      if (date.isBefore(state.startDate)) {
        OverlayToast.error("End Date must be after the start date");
        return;
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
    if (enableBuyOnly) {
      state = state.copyWith(galleryOnly: false);
    }
  }

  updateEnableAuction(bool enableAuction) {
    if (state.isAuctionStarted && state.exists) {
      Toast.error('The auction has already started.');
      return;
    }
    state = state.copyWith(enableAuction: enableAuction);
    if (enableAuction) {
      state = state.copyWith(galleryOnly: false);
      state = state.copyWith(endDate: DateTime.now());
      state = state.copyWith(endDate: state.startDate.add(Duration(days: 7)));
      startDateController.text = DateFormat.yMd().format(DateTime.now());
      endDateController.text = DateFormat.yMd().format(state.endDate);
    } else {
      state = state.copyWith(startDate: DateTime.now());
      state = state.copyWith(endDate: DateTime(3000));
    }
  }

  updateGalleryOnly(bool value) {
    if (state.isAuctionStarted && state.exists) {
      Toast.error('The auction has already started.');
      return;
    }

    if (value) {
      state = state.copyWith(
        galleryOnly: true,
        enableBuyNow: false,
        enableAuction: false,
        enableReservePrice: false,
        floorPrice: null,
        buyNowPrice: null,
        reservePrice: null,
      );

      buyNowController.clear();
      floorPriceController.clear();
      reservePriceController.clear();
    } else {
      state = state.copyWith(
        galleryOnly: false,
      );
    }
  }

  complete(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!state.enableAuction) {
      state = state.copyWith(floorPrice: null, reservePrice: null);
    }

    if (state.enableAuction && state.reservePrice != null && state.floorPrice != null) {
      if (state.reservePrice! < state.floorPrice!) {
        Toast.error("The reserve price must be greater or equal to the floor price.");
        return;
      }
    }

    if (state.startDate.isAfter(state.endDate)) {
      Toast.error('The start date must be before the end date.');
      return;
    }

    if (state.smartContractUid.isEmpty) {
      Toast.error('The NFT must be set');
      return;
    }
    if (!state.enableAuction && !state.enableBuyNow && !state.galleryOnly) {
      Toast.error('Enable at least one of the options (Gallery, Buy Now, or Auction)');
      return;
    }

    if (state.endDate.isBefore(state.startDate) || state.endDate.isAtSameMomentAs(state.startDate)) {
      Toast.error("End date must be after start date");
      return;
    }

    if (!state.enableBuyNow) {
      state = state.copyWith(buyNowPrice: null);
    }

    if (!state.enableReservePrice) {
      state = state.copyWith(reservePrice: state.floorPrice);
    }

    if (!state.exists) {
      //Images
      final assets = [state.nft?.smartContract.primaryAssetWeb].where((element) => element != null).toList(); //TOOD: multiasset
      if (state.nft!.smartContract.additionalAssetsWeb != null) {
        for (final a in state.nft!.smartContract.additionalAssetsWeb!) {
          assets.add(a);
        }
      }
      final List<String> thumbnailUrls = [];
      for (final a in assets) {
        if (a?.location != null) {
          thumbnailUrls.add(a!.location);
        }
      }

      state = state.copyWith(thumbnails: thumbnailUrls);
    }

    final success = await WebShopService().saveWebListing(state, state.collection.shop!.id, state.collection.id);
    if (success) {
      ref.read(webListingListProvider("${state.collection.shop!.id},${state.collection.id}").notifier).refresh();
      ref.read(webListingFullListProvider("${state.collection.shop!.id},${state.collection.id}").notifier).reload(false);
      clear();
      AutoRouter.of(context).pop();
    } else {
      Toast.error();
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
    if (await WebShopService().deleteWebListing(listing)) {
      clear();
      ref.read(webListingListProvider("${listing.collection.shop!.id},${listing.collection.id}").notifier).refresh();
    } else {
      Toast.error();
    }
  }
}

final createWebListingProvider = StateNotifierProvider<WebListingFormProvider, WebListing>((ref) {
  return WebListingFormProvider(ref, WebListing.empty());
});
