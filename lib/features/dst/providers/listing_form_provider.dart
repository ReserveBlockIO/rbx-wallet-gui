import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/dst/providers/listing_detail_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';

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
  // bool enableAuction = false;
  // bool enableBuyNow = false;

  ListingFormProvider(this.ref, Listing model) : super(model) {
    startDateController = TextEditingController(
      text: model.startDate.isAtSameMomentAs(DateTime.now()) ? DateFormat.yMd().format(model.startDate.toLocal()) : '',
    );

    endDateController = TextEditingController(
      text: model.endDate.isAtSameMomentAs(DateTime.now()) ? DateFormat.yMd().format(model.endDate.toLocal()) : '',
    );

    startTimeController = TextEditingController(
      text: DateFormat("kk:mm").format(model.startDate),
    );

    endTimeController = TextEditingController(
      text: DateFormat("kk:mm").format(model.endDate),
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
    startDateController.text = DateFormat.yMd().format(listing.startDate.toLocal());
    endDateController.text = DateFormat.yMd().format(listing.endDate.toLocal());
    startTimeController.text = DateFormat("kk:mm").format(listing.startDate.toLocal());
    endTimeController.text = DateFormat("kk:mm").format(listing.endDate.toLocal());
    buyNowController.text = (listing.buyNowPrice ?? '').toString();
    floorPriceController.text = (listing.floorPrice ?? '').toString();
    reservePriceController.text = (listing.reservePrice ?? '').toString();
    state = state.copyWith(
      enableBuyNow: listing.isBuyNow,
      enableAuction: listing.isAuction,
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
    );
  }

  updateDate(DateTime date, bool isStartDate) {
    final existing = isStartDate ? state.startDate : state.endDate;

    final d = existing.copyWith(year: date.year, month: date.month, day: date.day);

    // if (date.isBefore(DateTime.now()) && !isStartDate) {
    //   OverlayToast.error("End date must be in the future.");

    //   return;
    // }

    // if (!isStartDate) {
    //   if (date.isBefore(state.startDate)) {
    //     OverlayToast.error("End Date must be after the start date");
    //   }
    // }

    state = isStartDate ? state.copyWith(startDate: d) : state.copyWith(endDate: d);

    // state = isStartDate
    //     ? state.copyWith(
    //         startDate: DateTime(
    //         date.year,
    //         date.month,
    //         date.day,
    //         state.startDate.hour,
    //         state.startDate.minute,
    //       ))
    //     : state.copyWith(endDate: DateTime(date.year, date.month, date.day, state.endDate.hour, state.endDate.minute));

    if (isStartDate) {
      startDateController.text = DateFormat.yMd().format(d);
    } else {
      endDateController.text = DateFormat.yMd().format(d);
    }

    // startDateController.text = DateFormat.yMd().format(state.startDate);
    // endDateController.text = DateFormat.yMd().format(state.endDate);
  }

  updateTime(TimeOfDay time, bool isStartDate) {
    final existing = isStartDate ? state.startDate : state.endDate;

    final d = existing.copyWith(hour: time.hour, minute: time.minute);

    // final d = DateTime(existing.year, existing.month, existing.day, time.hour, time.minute);

    // if (d.isBefore(DateTime.now())) {
    //   OverlayToast.error("Time must be in the future.");
    //   return;
    // }

    state = isStartDate ? state.copyWith(startDate: d) : state.copyWith(endDate: d);

    if (isStartDate) {
      startTimeController.text = DateFormat("kk:mm").format(d);
    } else {
      endTimeController.text = DateFormat("kk:mm").format(d);
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
  }

  updateEnableAuction(bool enableAuction) {
    state = state.copyWith(enableAuction: enableAuction);
  }

  complete(BuildContext context, int storeId) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (state.enableAuction && state.reservePrice != null && state.floorPrice != null) {
      if (state.reservePrice! < state.floorPrice!) {
        Toast.error("The reserve price must be greater or equal to the floor price.");
        return;
      }
    }

    if (state.smartContractUid.isEmpty) {
      Toast.error('The NFT must be set');
      return;
    }
    if (!state.enableAuction && !state.enableBuyNow) {
      Toast.error('Enable at least one of the options (Buy now or Auction)');
      return;
    }

    state = state.copyWith(collectionId: storeId);

    if (await DstService().saveListing(state)) {
      ref.read(listingListProvider(storeId).notifier).refresh();
      if (state.id != 0) {
        print('invalidating');
        ref.invalidate(listingDetailProvider(state.id));
      }
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

  delete(BuildContext context, int storeId, Listing listing) async {
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
        AutoRouter.of(context).pop();
      }
    }
  }
}

final listingFormProvider = StateNotifierProvider<ListingFormProvider, Listing>(
  (ref) => ListingFormProvider(ref, Listing.empty()),
);
