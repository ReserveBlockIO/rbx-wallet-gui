import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../core/app_router.gr.dart';
import '../../../core/web_router.gr.dart';

import '../models/web_collection.dart';
import '../models/web_shop.dart';
import 'web_collection_detail_provider.dart';
import 'web_collection_list_provider.dart';
import 'web_shop_detail_provider.dart';
import '../services/web_shop_service.dart';
import '../../../utils/toast.dart';

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
    final isNewCollection = state.id == 0;

    if (!formKey.currentState!.validate()) {
      return null;
    }

    final exists = state.exists;

    final collection = await WebShopService().saveCollection(state);

    if (collection != null) {
      Toast.message(exists ? "Collection Updated!" : "Collection Created");

      if (state.shop != null) {
        ref.read(webCollectionListProvider(state.shop!.id).notifier).refresh();
        if (collection.shop != null) {
          ref.invalidate(webCollectionDetailProvider("${collection.shop!.id},${collection.id}"));
        }
      }

      if (isNewCollection && collection.shop != null) {
        AutoRouter.of(context).popAndPush(WebCollectionDetailScreenRoute(shopId: collection.shop!.id, collectionId: collection.id));
      } else {
        AutoRouter.of(context).pop();
      }

      // AutoRouter.of(context).pop();

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
      ref.read(webCollectionListProvider(collection.shop!.id).notifier).refresh();
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
