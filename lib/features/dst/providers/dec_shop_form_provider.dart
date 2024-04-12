import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'collection_list_provider.dart';
import 'dec_shop_provider.dart';
import 'listing_list_provider.dart';
import '../services/dst_service.dart';
import '../../../utils/toast.dart';

import '../models/collection.dart';
import '../models/dec_shop.dart';

// TODO: Hosting Type + IP / Port + AutoUpdateNetworkDNS

class DecShopFormProvider extends StateNotifier<DecShop> {
  final Ref ref;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  // late final TextEditingController addressController;
  late final TextEditingController urlController;
  final GlobalKey<FormState> formKey = GlobalKey();

  DecShopFormProvider(this.ref, DecShop model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
    // addressController = TextEditingController(text: model.ownerAddress);
    urlController = TextEditingController(text: model.url);
  }

  load(DecShop decShop) {
    state = decShop;
    nameController.text = decShop.name;
    descriptionController.text = decShop.description;
    // addressController.text = decShop.ownerAddress ?? '';
    urlController.text = decShop.url.replaceAll("vfx://", "");
  }

  updateName(String name) {
    state = state.copyWith(name: name);
  }

  updateUrl(String url) {
    state = state.copyWith(url: url);
  }

  updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  updateAddress(String address) {
    state = state.copyWith(ownerAddress: address);
  }

  updateAutoUpdateNetworkDns(bool value) {
    state = state.copyWith(autoUpdateNetworkDns: value);
  }

  Future<bool?> complete(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (state.ownerAddress == null || state.ownerAddress!.isEmpty) {
      Toast.error("Address Required.");
      return null;
    }

    final success = await DstService().saveDecShop(state);

    if (success) {
      // ref.read(storeListProvider.notifier).refresh();
      // ref.invalidate(storeDetailProvider(state.id));
      // AutoRouter.of(context).pop();
      // clear();
      // ref.invalidate(decShopProvider);
      return true;
    } else {
      // Toast.error();
      return false;
    }
  }

  delete(BuildContext context, Collection store) async {
    final success = await DstService().deleteCollection(store);
    if (success) {
      clear();
      ref.invalidate(listingListProvider(store.id));
      ref.read(collectionListProvider.notifier).refresh();
      AutoRouter.of(context).popUntilRoot();
      ref.invalidate(decShopProvider);
    } else {
      Toast.error();
    }
  }

  clear() {
    nameController.text = "";
    descriptionController.text = "";
    urlController.text = "";
    state = DecShop.empty();
  }
}

final decShopFormProvider = StateNotifierProvider<DecShopFormProvider, DecShop>(
  (ref) => DecShopFormProvider(ref, DecShop.empty()),
);
