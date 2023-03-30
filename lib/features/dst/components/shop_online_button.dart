import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class ShopOnlineButton extends BaseComponent {
  const ShopOnlineButton({super.key});

  Future<void> promptForRestart(WidgetRef ref) async {
    final confirmed = await ConfirmDialog.show(
      title: "CLI Restart Required",
      body: "A CLI restart is required for this change to take affect. Would you like to restart now?",
      confirmText: "Restart",
      cancelText: "Cancel",
      destructive: true,
    );

    if (confirmed) {
      ref.read(sessionProvider.notifier).restartCli();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(decShopProvider);

    return data.when(
      error: (_, __) => SizedBox(),
      loading: () => SizedBox(),
      data: (shop) {
        if (shop == null) {
          return SizedBox();
        }

        if (!shop.isPublished) {
          return SizedBox();
        }

        if (shop.isOffline) {
          return AppButton(
            label: "Shop Offline",
            variant: AppColorVariant.Danger,
            icon: Icons.offline_bolt_outlined,
            onPressed: () async {
              final confirm = await ConfirmDialog.show(title: "Set Online?", body: "Are you sure you want to set this store online?");
              if (confirm == true) {
                final success = await DstService().toggleOnlineOffline();
                if (success) {
                  ref.invalidate(decShopProvider);
                  promptForRestart(ref);
                }
              }
            },
          );
        } else {
          return AppButton(
            label: "Shop Online",
            variant: AppColorVariant.Success,
            icon: Icons.offline_bolt,
            onPressed: () async {
              final confirm = await ConfirmDialog.show(title: "Set Offline?", body: "Are you sure you want to set this store offline?");
              if (confirm == true) {
                final success = await DstService().toggleOnlineOffline();
                if (success) {
                  ref.invalidate(decShopProvider);
                  promptForRestart(ref);
                }
              }
            },
          );
        }
      },
    );
  }
}
