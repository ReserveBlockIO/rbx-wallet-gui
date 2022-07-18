import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/minted_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:collection/collection.dart';

class CreateListingModel {
  final bool hasAuction;
  final bool hasBuyNow;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final List<String> previewUrls;
  final List<Nft> nfts;
  final Nft? nft;
  const CreateListingModel({
    this.hasAuction = false,
    this.hasBuyNow = false,
    this.startsAt,
    this.endsAt,
    this.previewUrls = const [],
    this.nfts = const [],
    this.nft,
  });

  CreateListingModel copyWith({
    bool? hasAuction,
    bool? hasBuyNow,
    DateTime? startsAt,
    DateTime? endsAt,
    List<String>? previewUrls,
    List<Nft>? nfts,
    Nft? nft,
  }) {
    return CreateListingModel(
      hasAuction: hasAuction ?? this.hasAuction,
      hasBuyNow: hasBuyNow ?? this.hasBuyNow,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      previewUrls: previewUrls ?? this.previewUrls,
      nfts: nfts ?? this.nfts,
      nft: nft ?? this.nft,
    );
  }
}

class CreateListingProvider extends StateNotifier<CreateListingModel> {
  final Reader read;
  final int storeId;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late final TextEditingController startsAtController = TextEditingController();
  late final TextEditingController endsAtController = TextEditingController();
  late final TextEditingController floorPriceController = TextEditingController();
  late final TextEditingController buyNowPriceController = TextEditingController();

  CreateListingProvider(this.read, this.storeId, [CreateListingModel model = const CreateListingModel()]) : super(model) {
    init();
  }

  init() async {
    fetchNfts();
  }

  fetchNfts() async {
    await read(mintedNftListProvider.notifier).load();

    final options = read(mintedNftListProvider);
    state = state.copyWith(
      nfts: options,
      // nft: state.nft ?? (options.isNotEmpty ? options.first : null),
    );
  }

  String? nameValidator(String? value) => formValidatorNotEmpty(value, "Name");
  String? descriptionValidator(String? value) => formValidatorNotEmpty(value, "Description");
  String? startsAtValidator(String? value) => formValidatorNotEmpty(value, "Starts At");
  String? endsAtValidator(String? value) => formValidatorNotEmpty(value, "Ends At");

  String? floorPriceValidator(String? value) => formValidatorNumber(value, "Floor Price");
  String? buyNowPriceValidator(String? value) => formValidatorNumber(value, "Buy Now Price");

  void setNftWithId(String identifier) {
    final nft = state.nfts.firstWhereOrNull((n) => n.id == identifier);
    if (nft != null) {
      state = state.copyWith(nft: nft);
    }
  }

  void setHasAuction(bool val) {
    state = state.copyWith(hasAuction: val);
  }

  void setHasBuyNow(bool val) {
    state = state.copyWith(hasBuyNow: val);
  }

  void setDate(DateTime date, bool forStartsAt) {
    date = DateUtils.dateOnly(date);

    state = forStartsAt ? state.copyWith(startsAt: date) : state.copyWith(endsAt: date);

    if (forStartsAt) {
      startsAtController.text = DateFormat.yMd().format(date);
    } else {
      endsAtController.text = DateFormat.yMd().format(date);
    }
  }

  void addPreviewUrl(String url) {
    state = state.copyWith(previewUrls: [...state.previewUrls, url]);
  }

  void updatePreviewUrl(String url, int index) {
    final updated = [...state.previewUrls]
      ..removeAt(index)
      ..insert(index, url);
    state = state.copyWith(previewUrls: updated);
  }

  void removePreviewUrl(int index) {
    state = state.copyWith(previewUrls: [...state.previewUrls]..removeAt(index));
  }

  Future<String?> submit() async {
    final keypair = read(webSessionProvider).keypair;
    if (keypair == null) {
      Toast.error("No keypair");
      return null;
    }

    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (state.nft == null) {
      Toast.error("Please select your NFT.");
      return null;
    }

    if (!state.hasBuyNow && !state.hasAuction) {
      Toast.error("Either Auction or Buy Now is required");
      return null;
    }
    if (state.startsAt == null || state.endsAt == null) {
      Toast.error("Starts at / Ends at are required");
      return null;
    }
    if (state.startsAt!.compareTo(state.endsAt!) > 0) {
      Toast.error("Start Date must be before End Date");
      return null;
    }

    if (state.previewUrls.isEmpty) {
      Toast.error("At least one Preview Image is required.");
    }

    final buyNowPrice = state.hasBuyNow ? double.tryParse(buyNowPriceController.text) : null;
    final floorPrice = state.hasAuction ? double.tryParse(floorPriceController.text) : null;

    final Map<String, dynamic> params = {
      'name': nameController.text,
      'description': descriptionController.text,
      'starts_at': state.startsAt!.toIso8601String(),
      'ends_at': state.endsAt!.toIso8601String(),
      ...buyNowPrice != null ? {'buy_now_price': buyNowPrice} : {},
      ...floorPrice != null ? {'floor_price': floorPrice} : {},
      'store': storeId,
      'email': keypair.email,
      'address': keypair.public,
      'preview_urls': state.previewUrls,
      'nft': state.nft!.id,
    };

    final slug = await TransactionService().createListing(params);

    if (slug == null) {
      Toast.error();
      return null;
    }

    return slug;
  }
}

final createListingProvider = StateNotifierProvider.family<CreateListingProvider, CreateListingModel, int>((ref, storeId) {
  return CreateListingProvider(ref.read, storeId);
});
