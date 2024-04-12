import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/my_create_collection_container_screen.dart';
import '../../../core/app_constants.dart';
// import '../../../core/app_router.gr.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/web_router.gr.dart';
import '../../dst/providers/collection_list_provider.dart';
import '../../dst/providers/dec_shop_provider.dart';
import '../../dst/providers/listing_list_provider.dart';
import '../../dst/services/dst_service.dart';
import '../../global_loader/global_loading_provider.dart';
import '../models/web_shop.dart';
import 'web_auth_token_provider.dart';
import 'web_shop_detail_provider.dart';
import 'web_shop_list_provider.dart';
import '../utils/shop_publishing.dart';
import '../../../utils/guards.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';

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

  Future<bool?> complete(BuildContext context) async {
    final isNewShop = state.isNew;
    if (!formKey.currentState!.validate()) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();

    if (state.isNew) {
      final urlAvailable = await WebShopService().checkAvailabilty(state.url);

      if (!urlAvailable) {
        Toast.error("Shop URL is not available.");
        ref.read(globalLoadingProvider.notifier).complete();
        return null;
      }
    }
    final address = kIsWeb
        ? ref.read(webSessionProvider).keypair?.address
        : ref.read(sessionProvider).currentWallet?.address;
    state = state.copyWith(ownerAddress: address ?? '');
    if (state.ownerAddress.isEmpty) {
      Toast.error("Address Required.");
      ref.read(globalLoadingProvider.notifier).complete();

      return null;
    }

    if (!state.isNew) {
      if (!await guardWebAuthorizedFromProvider(ref, state.ownerAddress)) {
        ref.read(globalLoadingProvider.notifier).complete();

        return null;
      }
      ref.read(globalLoadingProvider.notifier).complete();

      final confirmed = await ConfirmDialog.show(
        title: "Update Shop?",
        body:
            "There is a cost of $SHOP_UPDATE_COST VFX to update your shop on the network (plus the transaction fee).",
        confirmText: "Update",
        cancelText: "Cancel",
      );
      if (confirmed == true) {
        ref.read(globalLoadingProvider.notifier).start();

        await broadcastShopTx(ref.read(webSessionProvider).keypair!, state,
            ShopPublishTxType.update);
        ref.read(globalLoadingProvider.notifier).complete();
      } else {
        return null;
      }
    }
    ref.read(globalLoadingProvider.notifier).start();

    final updatedShop = await WebShopService().saveWebShop(state);
    ref.read(globalLoadingProvider.notifier).complete();

    final authenticated = await guardWebAuthorizedFromProvider(ref, address);

    final currentEmail = ref.read(webAuthTokenProvider)?.email;

    if (authenticated && address != null && currentEmail == null) {
      String? email = await PromptModal.show(
        contextOverride: context,
        title: "Subscribe for updates?",
        body:
            "In order for the web wallet to provide notifications about bids/purchases for you to sign the transactions, an email address is required.",
        validator: formValidatorEmail,
        labelText: "Email Address",
      );

      email = email?.trim();

      if (email == null || email.isEmpty) {
        Toast.error(
            "You will not be notified. You can update this setting on the dashboard if you change your mind.");
      } else {
        ref.read(globalLoadingProvider.notifier).start();

        final subscribed = await WebShopService().createContact(email, address);
        ref.read(globalLoadingProvider.notifier).complete();

        if (subscribed) {
          ref.read(webAuthTokenProvider.notifier).addEmail(email);
          Toast.message("Subscribed");
        }
      }
    }

    if (updatedShop != null) {
      if (!updatedShop.isPublished) {
        final confirm = await ConfirmDialog.show(
          title: "Publish Shop?",
          body:
              "There is a cost of $SHOP_PUBLISH_COST VFX to publish your shop to the network (plus the transaction fee).",
          confirmText: "Publish",
          cancelText: "Cancel",
        );

        if (confirm == true) {
          final published = await broadcastShopTx(
              ref.read(webSessionProvider).keypair!,
              updatedShop,
              ShopPublishTxType.create);
          if (published) {
            final s = await WebShopService()
                .saveWebShop(updatedShop.copyWith(isPublished: true));

            if (s != null) {
              ref.invalidate(webShopDetailProvider(updatedShop.id));
            }
          }
        }
      }

      ref.invalidate(webShopDetailProvider(updatedShop.id));
      ref.read(globalLoadingProvider.notifier).complete();
      ref.read(webShopListProvider(WebShopListType.public).notifier).refresh();
      ref.read(webShopListProvider(WebShopListType.mine).notifier).refresh();
      clear();

      if (isNewShop) {
        AutoRouter.of(context)
            .popAndPush(WebShopDetailScreenRoute(shopId: updatedShop.id));
      } else {
        AutoRouter.of(context).pop();
      }

      return true;
    } else {
      Toast.error();
      ref.read(globalLoadingProvider.notifier).complete();
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
