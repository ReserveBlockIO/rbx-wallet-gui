import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/beacon/providers/beacon_list_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/dst/components/publish_shop_button.dart';
import 'package:rbx_wallet/features/dst/components/shop_online_button.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';
import 'package:rbx_wallet/features/dst/providers/dst_tx_pending_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../components/create_dec_shop_form_group.dart';
import '../components/create_store_form_group .dart';
import '../providers/dec_shop_form_provider.dart';

class CreateDecShopContainerScreen extends BaseScreen {
  const CreateDecShopContainerScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(decShopFormProvider.notifier);
    final model = ref.read(decShopFormProvider);

    return AppBar(
      title: Text(model.id != 0 ? "Edit Auction House" : "Create Auction House"),
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
            title: "Are you sure you want to close the shop ${model.id != 0 ? 'editing' : 'creation'} screen?",
            body: "All unsaved changes will be lost.",
            cancelText: "Cancel",
            confirmText: "Continue",
          );

          if (confirmed == true) {
            AutoRouter.of(context).pop();
            provider.clear();
            ref.invalidate(decShopFormProvider);
          }
        },
        icon: const Icon(Icons.close),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ShopOnlineButton(),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(decShopFormProvider.notifier);
    final model = ref.read(decShopFormProvider);

    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CreateDecShopFormGroup(),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF040f26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Discard Changes",
                  variant: AppColorVariant.Danger,
                  onPressed: () async {
                    final confirmed = await ConfirmDialog.show(
                      title: "Are you sure you want to close the shop ${model.id != 0 ? 'editing' : 'creation'} screen?",
                      body: "All unsaved changes will be lost.",
                      cancelText: "Cancel",
                      confirmText: "Continue",
                    );

                    if (confirmed == true) {
                      AutoRouter.of(context).pop();
                      provider.clear();
                      ref.invalidate(decShopFormProvider);
                    }
                  },
                ),
                if (model.id != 0) DecPublishShopButton(),
                AppButton(
                  label: model.id != 0 ? 'Save Changes' : 'Create',
                  variant: AppColorVariant.Success,
                  onPressed: () async {
                    final success = await provider.complete(context);

                    if (success == true) {
                      final confirmed = await ConfirmDialog.show(
                        title: "Publish Updates?",
                        body:
                            "Your local changes were saved succesfully. Would you like to publish this to the network?${model.updateWillCost ? '\n\n1 RBX is required since you have already published within the past 24 hours.' : ''}",
                      );

                      ref.invalidate(decShopProvider);

                      if (confirmed == true) {
                        final success = model.id == 0 ? await DstService().publishShop() : await DstService().updateShop();
                        if (success) {
                          ref.read(dstTxPendingProvider.notifier).set(true);
                          ref.invalidate(decShopProvider);
                          Toast.message("Publish Transaction Sent!");

                          final confirmed = await ConfirmDialog.show(
                            title: "CLI Restart Required",
                            body: "A CLI restart is required for this change to take effect. Would you like to restart now?",
                            confirmText: "Restart",
                            cancelText: "Later",
                          );

                          if (confirmed == true) {
                            ref.read(globalLoadingProvider.notifier).start();
                            await ref.read(sessionProvider.notifier).restartCli();
                            ref.read(beaconListProvider.notifier).refresh();
                            ref.read(globalLoadingProvider.notifier).complete();
                          }

                          AutoRouter.of(context).pop();
                        } else {
                          Toast.error();
                        }
                      } else {
                        Toast.message("Local changes saved!");

                        AutoRouter.of(context).pop();
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
