import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_list_provider.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/features/web_shop/utils/shop_publishing.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebImportShopButton extends BaseComponent {
  final AppColorVariant variant;
  final AppButtonType type;
  const WebImportShopButton({
    super.key,
    this.variant = AppColorVariant.Light,
    this.type = AppButtonType.Text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Import Shop",
      type: type,
      variant: variant,
      icon: type == AppButtonType.Text ? null : Icons.upload,
      onPressed: () async {
        final myAddress = ref.read(webSessionProvider).keypair?.address;
        if (myAddress == null) {
          Toast.error("No wallet found");
          return;
        }

        String? shopUrl = await PromptModal.show(
          contextOverride: context,
          title: "Shop URL",
          validator: (_) => null,
          labelText: "Shop URL",
          body: "What is the shop URL you'd like to import?",
          prefixText: "rbx://",
        );

        if (shopUrl == null || shopUrl.isEmpty) {
          return;
        }

        if (!shopUrl.contains("rbx://")) {
          shopUrl = "rbx://$shopUrl";
        }

        final shop = await WebShopService().lookupShop(shopUrl);

        if (shop == null) {
          Toast.error("Shop Not Found");
          return;
        }

        if (shop.ownerAddress != myAddress) {
          Toast.error("You are not the owner of this shop. Please login as ${shop.ownerAddress}");
          return;
        }

        final confirmed = await ConfirmDialog.show(
          title: "Ready to Import",
          body:
              "Are you sure you want to import this shop? A $SHOP_UPDATE_COST RBX fee will be charged to publish this change to the network.\n\nThis is a destructive action and will not carry over your collections and listings.",
          confirmText: "Import & Publish",
          cancelText: "Cancel",
        );

        if (confirmed != true) {
          return;
        }

        ref.read(globalLoadingProvider.notifier).start();

        final success = await broadcastShopTx(ref.read(webSessionProvider).keypair!, shop, ShopPublishTxType.update);
        ref.read(globalLoadingProvider.notifier).complete();

        if (success == true) {
          InfoDialog.show(
            title: "TX Broadcasted",
            body: "Once the transaction relects on chain, your shop will appear here.",
          );
        }
      },
    );
  }
}
