import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/dialogs.dart';
import 'dec_shop_provider.dart';
import 'listing_detail_provider.dart';
import '../services/dst_service.dart';
import '../../nft/models/nft.dart';

import '../../../utils/toast.dart';
import '../models/listing.dart';
import 'listing_list_provider.dart';

class ListingFormProvider extends StateNotifier<Listing> {
  final Ref ref;
  late final TextEditingController buyNowController;
  late final TextEditingController floorPriceController;
  late final TextEditingController reservePriceController;
  late final TextEditingController startDateController;
  late final TextEditingController endDateController;
  late final TextEditingController startTimeController;
  late final TextEditingController endTimeController;
  final GlobalKey<FormState> formKey = GlobalKey();

  ListingFormProvider(this.ref, Listing model) : super(model) {
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
    floorPriceController = TextEditingController(
      text: model.floorPrice != null ? model.floorPrice.toString() : '',
    );
    reservePriceController = TextEditingController(
      text: model.reservePrice != null ? model.reservePrice.toString() : '',
    );
  }

  load(Listing listing) {
    state = listing;
    startDateController.text = DateFormat.yMd().format(listing.startDate);
    endDateController.text = DateFormat.yMd().format(listing.endDate);
    startTimeController.text = DateFormat("HH:mm").format(listing.startDate);
    endTimeController.text = DateFormat("HH:mm").format(listing.endDate);
    buyNowController.text = (listing.buyNowPrice ?? '').toString();
    floorPriceController.text = (listing.floorPrice ?? '').toString();
    reservePriceController.text = (listing.reservePrice ?? '').toString();

    if (listing.reservePrice != null && listing.reservePrice != listing.floorPrice) {
      state = state.copyWith(enableReservePrice: true);
    } else {}

    state = state.copyWith(
      enableBuyNow: listing.isBuyNow,
      enableAuction: listing.isAuction,
      galleryOnly: listing.isGallery,
    );
  }

  updateNFT(Nft nft) {
    state = state.copyWith(
      ownerAddress: nft.currentOwner != '' ? nft.currentOwner : nft.minterAddress,
      smartContractUid: nft.id,
      nft: nft,
    );
  }

  clearNft() {
    state = state.copyWith(
      nft: null,
      smartContractUid: '',
      ownerAddress: '',
      //TODO: thumbnail
    );
  }

  updateDate(DateTime date, bool isStartDate) {
    final existing = isStartDate ? state.startDate : state.endDate;

    final d = existing.copyWith(year: date.year, month: date.month, day: date.day);

    state = isStartDate ? state.copyWith(startDate: d) : state.copyWith(endDate: d);

    if (isStartDate) {
      startDateController.text = DateFormat.yMd().format(d);
      endDateController.text = DateFormat.yMd().format(d.copyWith(day: d.day + 14));
      state = state.copyWith(endDate: d.copyWith(day: d.day + 14));
    } else {
      endDateController.text = DateFormat.yMd().format(d);
    }
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

  updateBuyNow(String price) {
    state = state.copyWith(buyNowPrice: double.parse(price));
  }

  updateFloorPrice(String price) {
    state = state.copyWith(floorPrice: double.parse(price));
  }

  updateReservePrice(String price) {
    state = state.copyWith(reservePrice: double.parse(price));
  }

  updateEnableBuyOnly(bool enableBuyOnly) {
    state = state.copyWith(enableBuyNow: enableBuyOnly);

    if (enableBuyOnly) {
      state = state.copyWith(galleryOnly: false);
    }
  }

  updateEnableAuction(bool enableAuction) {
    print("Auction started: ${state.isAuctionStarted} exists: ${state.exists}");
    if (state.isAuctionStarted && state.exists) {
      Toast.error('The auction has already started.');
      return;
    }
    state = state.copyWith(enableAuction: enableAuction);
    if (enableAuction) {
      state = state.copyWith(galleryOnly: false);
      state = state.copyWith(startDate: DateTime.now());
      state = state.copyWith(endDate: state.startDate.add(Duration(days: 7)));
      startDateController.text = DateFormat.yMd().format(DateTime.now());
      endDateController.text = DateFormat.yMd().format(state.endDate);
    } else {
      state = state.copyWith(startDate: DateTime.now());
      state = state.copyWith(endDate: DateTime(3000));
    }
  }

  updateEnableReservePrice(bool enableReservePrice) {
    if (state.auctionStarted && state.exists) {
      Toast.error('The auction has already started.');
      return;
    }
    state = state.copyWith(enableReservePrice: enableReservePrice);
  }

  updateGalleryOnly(bool value) {
    if (state.auctionStarted && state.exists) {
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
        startDate: DateTime.now(),
        endDate: DateTime(3000),
      );
      buyNowController.clear();
      floorPriceController.clear();
      reservePriceController.clear();
    } else {
      state = state.copyWith(
        galleryOnly: false,
        startDate: DateTime.now(),
        endDate: state.startDate.add(Duration(days: 7)),
      );
    }
  }

  complete(BuildContext context, int storeId) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!state.enableAuction) {
      state = state.copyWith(
        floorPrice: null,
        reservePrice: null,
        isBuyNowOnly: true,
      );
    }

    if (state.enableAuction && state.reservePrice != null && state.floorPrice != null) {
      if (state.floorPrice! <= 0) {
        Toast.error("The floor price must be greater than zero.");
        return;
      }
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
    } else {
      if (state.buyNowPrice == null || state.buyNowPrice! <= 0) {
        Toast.error("Price must be greater than zero");
        return;
      }
    }

    if (!state.enableReservePrice) {
      state = state.copyWith(reservePrice: state.floorPrice);
    }

    state = state.copyWith(collectionId: storeId);

    if (await DstService().saveListing(state)) {
      ref.read(listingListProvider(storeId).notifier).refresh();
      if (state.id != 0) {
        print('invalidating');
        ref.invalidate(listingDetailProvider(state.id));
      }
      ref.read(decShopProvider).value?.requestShopSync();
      clear();
      AutoRouter.of(context).pop();
    }
  }

  clear() {
    buyNowController.text = "";
    startDateController.text = "";
    endDateController.text = "";
    startTimeController.text = "";
    endTimeController.text = "";
    floorPriceController.text = "";
    reservePriceController.text = "";
    state = Listing.empty();
  }

  delete(BuildContext context, int storeId, Listing listing, [bool shouldPop = true]) async {
    if (state.auctionStarted && state.exists) {
      Toast.error("You can't delete this listing because the auction has already started.");
      return;
    }

    final confirmed = await ConfirmDialog.show(
      title: "Delete Listing",
      body: "Are you sure you want to delete this listing?",
      destructive: true,
      confirmText: "Delete",
      cancelText: "Cancel",
    );
    if (confirmed == true) {
      if (await DstService().deleteListing(listing)) {
        clear();
        ref.read(listingListProvider(storeId).notifier).refresh();
        ref.read(decShopProvider).value?.requestShopSync();
        if (shouldPop) {
          AutoRouter.of(context).pop();
        }
      }
    }
  }
}

final listingFormProvider = StateNotifierProvider<ListingFormProvider, Listing>(
  (ref) => ListingFormProvider(ref, Listing.empty()),
);
