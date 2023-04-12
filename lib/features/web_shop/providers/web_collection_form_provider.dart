import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/providers/collection_list_provider.dart';

import 'package:rbx_wallet/features/web_shop/models/web_collection.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_collection_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_detail_provider.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebCollectionFormProvider extends StateNotifier<WebCollection> {
  final Ref ref;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey = GlobalKey();

  WebCollectionFormProvider(this.ref, WebCollection model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
  }

  load(WebCollection store) {
    state = store;
    nameController.text = store.name;
    descriptionController.text = store.description;
  }

  updateName(String name) {
    state = state.copyWith(name: name);
  }

  updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  updateIsLive(bool isLive) {
    state = state.copyWith(isLive: isLive);
  }

  complete(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    final exists = state.exists;

    final shop = await WebShopService().saveCollection(state);

    if (shop != null) {
      Toast.message(exists ? "Collection Updated!" : "Collection Created");

      if (state.shop != null) {
        ref.read(webCollectionListProvider(state.shop!.id).notifier).refresh();
      }

      //TODO: pop and push to the upcoming listing create screen

      Navigator.of(context).pop();
      // final stores = await DstService().listCollections();
      // // would be nice if the store data could just come back in the API response (so we know the ID)
      // final thisCollection = stores.where((s) => s.name == state.name).toList();

      // ref.read(storeListProvider.notifier).refresh();

      // if (state.id == 0 && thisCollection.length == 1) {
      //   // AutoRouter.of(context).popAndPush(MyCollectionDetailScreenRoute(collectionId: thisCollection.first.id));
      //   ref.invalidate(storeDetailProvider(thisCollection.first.id));
      // } else {
      //   if (state.id != 0) {
      //     ref.invalidate(storeDetailProvider(state.id));
      //   }
      //   AutoRouter.of(context).pop();
      // }
      clear();
    } else {
      Toast.error();
    }
  }

  delete(BuildContext context, WebCollection collection) async {
    final success = await WebShopService().deleteCollection(collection);
    if (success) {
      clear();
      ref.invalidate(webShopDetailProvider(collection.shop!.id));
      // ref.read(storeListProvider.notifier).refresh();
      AutoRouter.of(context).pop();
    } else {
      Toast.error();
    }
  }

  clear([WebShop? shop]) {
    nameController.text = "";
    descriptionController.text = "";
    state = WebCollection.empty().copyWith(shop: shop);
  }
}

final webCollectionFormProvider = StateNotifierProvider<WebCollectionFormProvider, WebCollection>(
  (ref) => WebCollectionFormProvider(ref, WebCollection.empty()),
);
