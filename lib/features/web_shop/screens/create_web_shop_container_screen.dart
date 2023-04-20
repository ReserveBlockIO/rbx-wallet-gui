import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/components/publish_shop_button.dart';
import 'package:rbx_wallet/features/dst/components/shop_online_button.dart';
import 'package:rbx_wallet/features/dst/providers/dec_shop_provider.dart';
import 'package:rbx_wallet/features/dst/providers/dst_tx_pending_provider.dart';
import 'package:rbx_wallet/features/dst/services/dst_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../components/create_web_shop_form_group.dart';
import '../providers/web_shop_form_provider.dart';

class CreateWebShopContainerScreen extends BaseScreen {
  const CreateWebShopContainerScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(webShopFormProvider.notifier);
    final model = ref.read(webShopFormProvider);

    return AppBar(
      title: Text(model.id != 0 ? "Edit Auction House" : "Create Auction House"),
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
            ref.invalidate(webShopFormProvider);
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
    final provider = ref.read(webShopFormProvider.notifier);
    final model = ref.read(webShopFormProvider);

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
                const CreateWebShopFormGroup(),
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
                      ref.invalidate(webShopFormProvider);
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
                      AutoRouter.of(context).pop();
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
