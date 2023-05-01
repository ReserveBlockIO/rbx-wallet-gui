import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/beacon/providers/beacon_list_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';
import 'package:rbx_wallet/features/dst/providers/dst_tx_pending_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/web_shop/services/web_shop_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/providers/session_provider.dart';

class DecPublishShopButton extends BaseComponent {
  const DecPublishShopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(decShopProvider);

    return data.when(
      loading: () => SizedBox(),
      error: (_, __) => SizedBox(),
      data: (shop) {
        if (shop == null) {
          return SizedBox.shrink();
        }

        if (ref.watch(dstTxPendingProvider)) {
          return AppButton(
            label: "Pending",
            processing: true,
          );
        }

        if (shop.isPublished) {
          if (shop.needsPublishToNetwork || shop.ipIsDifferent) {
            return AppButton(
              variant: shop.ipIsDifferent ? AppColorVariant.Danger : AppColorVariant.Warning,
              label: shop.ipIsDifferent ? "Publish IP Change" : "Publish Changes",
              icon: shop.ipIsDifferent ? Icons.error : Icons.publish,
              onPressed: () async {
                if (shop.updateWillCost) {
                  final confirm = await ConfirmDialog.show(
                    title: "Publish Shop?",
                    body: "There is a cost of $SHOP_UPDATE_COST RBX to publish your shop changes to the network (plus the transaction fee).",
                    confirmText: "Publish Changes",
                    cancelText: "Cancel",
                  );

                  if (confirm != true) {
                    return;
                  }
                }
                ref.read(dstTxPendingProvider.notifier).set(true);

                if (shop.ipIsDifferent) {
                  await DstService().saveDecShop(shop);
                  await Future.delayed(Duration(milliseconds: 500));
                }

                final success = await DstService().updateShop();
                if (success) {
                  ref.invalidate(decShopProvider);
                  ref.read(dstTxPendingProvider.notifier).set(true);

                  Toast.message("Publish Transaction Sent!");
                  ref.invalidate(decShopProvider);
                } else {
                  ref.read(dstTxPendingProvider.notifier).set(false);

                  Toast.error();
                }
              },
            );
          }
          return AppButton(
            label: "Published",
            icon: Icons.check,
          );
        }

        return AppButton(
          label: "Publish Shop",
          variant: AppColorVariant.Light,
          onPressed: () async {
            final confirm = await ConfirmDialog.show(
              title: "Publish Shop?",
              body: "There is a cost of $SHOP_PUBLISH_COST RBX to publish your shop to the network (plus the transaction fee).",
              confirmText: "Publish",
              cancelText: "Cancel",
            );

            if (confirm == true) {
              final success = await DstService().publishShop();

              if (success) {
                Toast.message("Publish Transaction Sent!");

                ref.invalidate(decShopProvider);
                ref.read(dstTxPendingProvider.notifier).set(true);
                final confirmed = await ConfirmDialog.show(
                  title: "CLI Restart Required",
                  body: "A CLI restart is required for this change to take effect. Would you like to restart now?",
                  confirmText: "Restart",
                  cancelText: "Cancel",
                  destructive: true,
                );

                if (confirmed == true) {
                  ref.read(sessionProvider.notifier).restartCli();
                }
              } else {
                Toast.error();
              }
            }
          },
        );
      },
    );
  }
}
