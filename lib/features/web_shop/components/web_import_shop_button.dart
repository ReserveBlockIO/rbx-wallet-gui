import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../global_loader/global_loading_provider.dart';
import '../providers/web_shop_list_provider.dart';
import '../services/web_shop_service.dart';
import '../utils/shop_publishing.dart';
import '../../../utils/toast.dart';

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
          prefixText: "vfx://",
        );

        if (shopUrl == null || shopUrl.isEmpty) {
          return;
        }

        if (!shopUrl.contains("vfx://")) {
          shopUrl = "vfx://$shopUrl";
        }

        final shop = await WebShopService().lookupShop(shopUrl);

        if (shop == null) {
          Toast.error("Shop Not Found");
          return;
        }

        if (shop.ownerAddress != myAddress) {
          Toast.error(
              "You are not the owner of this shop. Please login as ${shop.ownerAddress}");
          return;
        }

        final confirmed = await ConfirmDialog.show(
          title: "Ready to Import",
          body:
              "Are you sure you want to import this shop? A $SHOP_UPDATE_COST VFX fee will be charged to publish this change to the network.\n\nThis is a destructive action and will not carry over your collections and listings.",
          confirmText: "Import & Publish",
          cancelText: "Cancel",
        );

        if (confirmed != true) {
          return;
        }

        ref.read(globalLoadingProvider.notifier).start();

        final success = await broadcastShopTx(
            ref.read(webSessionProvider).keypair!,
            shop,
            ShopPublishTxType.update);
        ref.read(globalLoadingProvider.notifier).complete();

        if (success == true) {
          InfoDialog.show(
            title: "TX Broadcasted",
            body:
                "Once the transaction relects on chain, your shop will appear here.",
          );
        }
      },
    );
  }
}
