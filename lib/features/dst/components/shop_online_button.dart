import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/dec_shop_provider.dart';
import '../services/dst_service.dart';

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

    if (confirmed == true) {
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
