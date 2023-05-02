import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/dst/providers/collection_list_provider.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';
import 'package:rbx_wallet/features/dst/providers/listing_list_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/web_shop/models/web_shop.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_auth_token_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_detail_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/utils/shop_publishing.dart';
import 'package:rbx_wallet/utils/guards.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../models/web_collection.dart';
import '../services/web_shop_service.dart';

class WebShopFormProvider extends StateNotifier<WebShop> {
  final Ref ref;
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  // late final TextEditingController addressController;
  late final TextEditingController urlController;
  final GlobalKey<FormState> formKey = GlobalKey();

  WebShopFormProvider(this.ref, WebShop model) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);

    urlController = TextEditingController(text: model.url);
  }

  load(WebShop decShop) {
    state = decShop;
    nameController.text = decShop.name;
    descriptionController.text = decShop.description;
    urlController.text = decShop.url.replaceAll("rbx://", "");
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

  Future<bool?> complete(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (state.isNew) {
      final urlAvailable = await WebShopService().checkAvailabilty(state.url);

      if (!urlAvailable) {
        Toast.error("Shop URL is not available.");
        return null;
      }
    }
    final address = kIsWeb ? ref.read(webSessionProvider).keypair?.address : ref.read(sessionProvider).currentWallet?.address;
    state = state.copyWith(ownerAddress: address ?? '');
    if (state.ownerAddress.isEmpty) {
      Toast.error("Address Required.");
      return null;
    }

    if (!state.isNew) {
      if (!await guardWebAuthorizedFromProvider(ref, state.ownerAddress)) {
        return null;
      }

      final confirmed = await ConfirmDialog.show(
        title: "Update Shop?",
        body: "There is a cost of $SHOP_UPDATE_COST RBX to update your shop on the network (plus the transaction fee).",
        confirmText: "Update",
        cancelText: "Cancel",
      );
      if (confirmed == true) {
        await broadcastShopTx(ref.read(webSessionProvider).keypair!, state, ShopPublishTxType.update);
      } else {
        return null;
      }
    }

    final updatedShop = await WebShopService().saveWebShop(state);

    final currentEmail = ref.read(webAuthTokenProvider)?.email;

    if (address != null && currentEmail == null) {
      String? email = await PromptModal.show(
        contextOverride: context,
        title: "Subscribe for updates?",
        body: "Would you like to provide your email address to be notified of bids and buy nows? (Optional)",
        validator: formValidatorEmailOrEmpty,
        labelText: "Email Address",
      );

      email = email?.trim();

      if (email != null && email.isNotEmpty) {
        final subscribed = await WebShopService().createContact(email, address);
        if (subscribed) {
          ref.read(webAuthTokenProvider.notifier).addEmail(email);
          Toast.message("Subscribed");
        }
      }
    }

    if (updatedShop != null) {
      ref.read(webShopListProvider(WebShopListType.mine).notifier).refresh();
      ref.read(webShopListProvider(WebShopListType.public).notifier).refresh();
      ref.invalidate(webShopDetailProvider(updatedShop.id));

      AutoRouter.of(context).pop();

      clear();
      return true;
    } else {
      Toast.error();
      return false;
    }
  }

  delete(BuildContext context, WebShop store) async {
    if (!await guardWebAuthorizedFromProvider(ref, store.ownerAddress)) {
      return null;
    }

    final success = await WebShopService().deleteWebShop(store);
    if (success) {
      clear();
      ref.read(webShopListProvider(WebShopListType.mine).notifier).refresh();
      AutoRouter.of(context).pop();
    } else {
      Toast.error();
    }
  }

  clear() {
    nameController.text = "";
    descriptionController.text = "";
    urlController.text = "";
    state = WebShop.empty();
  }
}

final webShopFormProvider = StateNotifierProvider<WebShopFormProvider, WebShop>(
  (ref) => WebShopFormProvider(ref, WebShop.empty()),
);
