import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/providers/collection_list_provider.dart';
import 'package:rbx_wallet/features/dst/providers/listing_list_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../models/collection.dart';
import '../models/dec_shop.dart';

class DecShopFormProvider extends StateNotifier<DecShop> {
  final Ref ref;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController addressController;
  late final TextEditingController urlController;
  final GlobalKey<FormState> formKey = GlobalKey();

  DecShopFormProvider(this.ref, DecShop model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
    addressController = TextEditingController(text: model.address);
    urlController = TextEditingController(text: model.url);
  }

  load(DecShop decShop) {
    state = decShop;
    nameController.text = decShop.name;
    descriptionController.text = decShop.description;
    addressController.text = decShop.address;
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
    state = state.copyWith(address: address);
  }

  updateNeedsPublishToNetwork(bool needsPublishToNetwork) {
    state = state.copyWith(needsPublishToNetwork: needsPublishToNetwork);
  }

  complete(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    final success = await DstService().saveDecShop(state);

    if (success) {
      ref.read(storeListProvider.notifier).refresh();
      // ref.invalidate(storeDetailProvider(state.id));
      AutoRouter.of(context).pop();
      clear();
    } else {
      Toast.error();
    }
  }

  delete(BuildContext context, Collection store) async {
    final success = await DstService().deleteCollection(store);
    if (success) {
      clear();
      ref.invalidate(listingListProvider(store.id));
      ref.read(storeListProvider.notifier).refresh();
      AutoRouter.of(context).popUntilRoot();
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
