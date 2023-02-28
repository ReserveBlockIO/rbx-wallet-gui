import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/models/store.dart';
import 'package:rbx_wallet/features/dst/providers/store_list_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';

class StoreFormProvider extends StateNotifier<Store> {
  final Ref ref;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey = GlobalKey();

  StoreFormProvider(this.ref, Store model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
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
    ref.read(globalLoadingProvider.notifier).start();
    if (await DstService().saveStore(state)) {
      clear();
      ref.read(storeListProvider.notifier).refresh();
      ref.read(globalLoadingProvider.notifier).complete();
      AutoRouter.of(context).pop();
    }
    ref.read(globalLoadingProvider.notifier).complete();
  }

  clear() {
    nameController.text = "";
    descriptionController.text = "";
  }
}

final storeFormProvider = StateNotifierProvider<StoreFormProvider, Store>(
  (ref) => StoreFormProvider(ref, Store.empty()),
);
