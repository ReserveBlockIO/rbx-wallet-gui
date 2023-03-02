import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/features/dst/models/store.dart';
import 'package:rbx_wallet/features/dst/providers/listing_list_provider.dart';
import 'package:rbx_wallet/features/dst/providers/store_detail_provider.dart';
import 'package:rbx_wallet/features/dst/providers/store_list_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class StoreFormProvider extends StateNotifier<Store> {
  final Ref ref;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey = GlobalKey();

  StoreFormProvider(this.ref, Store model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
  }

  load(Store store) {
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

    final success = await DstService().saveStore(state);

    if (success) {
      final stores = await DstService().listStores();
      // would be nice if the store data could just come back in the API response (so we know the ID)
      final thisStore = stores.where((s) => s.name == state.name).toList();

      clear();
      ref.read(storeListProvider.notifier).refresh();

      if (state.id == 0 && thisStore.length == 1) {
        AutoRouter.of(context).popAndPush(MyStoreDetailScreenRoute(storeId: thisStore.first.id));
        ref.invalidate(storeDetailProvider(thisStore.first.id));
      } else {
        if (state.id != 0) {
          ref.invalidate(storeDetailProvider(state.id));
        }
        AutoRouter.of(context).pop();
      }
    } else {
      Toast.error();
    }
  }

  delete(BuildContext context, Store store) async {
    final success = await DstService().deleteStore(store);
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
  }
}

final storeFormProvider = StateNotifierProvider<StoreFormProvider, Store>(
  (ref) => StoreFormProvider(ref, Store.empty()),
);
