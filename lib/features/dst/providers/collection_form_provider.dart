import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_router.gr.dart';
import 'dec_shop_provider.dart';
import 'listing_list_provider.dart';
import 'collection_detail_provider.dart';
import 'collection_list_provider.dart';
import '../services/dst_service.dart';
import '../../../utils/toast.dart';

import '../../../core/dialogs.dart';
import '../models/collection.dart';

class CollectionFormProvider extends StateNotifier<Collection> {
  final Ref ref;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey = GlobalKey();

  CollectionFormProvider(this.ref, Collection model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
  }

  load(Collection store) {
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

    final success = await DstService().saveCollection(state);

    if (success) {
      final stores = await DstService().listCollections();
      // would be nice if the store data could just come back in the API response (so we know the ID)
      final thisCollection = stores.where((s) => s.name == state.name).toList();

      ref.read(collectionListProvider.notifier).refresh();

      if (state.id == 0 && thisCollection.length == 1) {
        AutoRouter.of(context).popAndPush(MyCollectionDetailScreenRoute(collectionId: thisCollection.first.id));
        ref.invalidate(storeDetailProvider(thisCollection.first.id));
      } else {
        if (state.id != 0) {
          ref.invalidate(storeDetailProvider(state.id));
        }
        AutoRouter.of(context).pop();
      }

      clear();
    } else {
      Toast.error();
    }
  }

  switchLiveState(Collection collection, bool isLive) async {
    bool? confirmed;
    if (isLive) {
      confirmed = await ConfirmDialog.show(
        title: "Make Collection Live?",
        body: "Are you sure you want to make this collection live? This collection will be visible to other users when they connect to your shop.",
        confirmText: "Make Live",
        cancelText: "Cancel",
      );
    } else {
      confirmed = await ConfirmDialog.show(
        title: "Hide Collection?",
        body: "Are you sure you want to hide this collection? It won't be visible to other users when they connect to your shop.",
        destructive: true,
        confirmText: "Hide",
        cancelText: "Cancel",
      );
    }
    if (confirmed == true) {
      final success = await DstService().saveCollection(collection.copyWith(isLive: isLive));
      if (success) {
        ref.read(collectionListProvider.notifier).refresh();
        ref.invalidate(storeDetailProvider(collection.id));
        ref.read(decShopProvider).value?.requestShopSync();
      } else {
        Toast.error();
      }
    }
  }

  delete(BuildContext context, Collection store) async {
    final success = await DstService().deleteCollection(store);
    if (success) {
      clear();
      ref.invalidate(listingListProvider(store.id));
      ref.read(collectionListProvider.notifier).refresh();
      ref.read(decShopProvider).value?.requestShopSync();
      AutoRouter.of(context).pop();
    } else {
      Toast.error();
    }
  }

  clear() {
    nameController.text = "";
    descriptionController.text = "";
    state = Collection.empty();
  }
}

final storeFormProvider = StateNotifierProvider<CollectionFormProvider, Collection>(
  (ref) => CollectionFormProvider(ref, Collection.empty()),
);
