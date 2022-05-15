import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/basic_properties_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/features_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/primary_asset_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/rarities_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/stats_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/thumbnail_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/code_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class ScCreatorMain extends BaseComponent {
  const ScCreatorMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BasicPropertiesFormGroup(),
                Row(
                  children: [
                    Expanded(child: PrimaryAssetFormGroup()),
                    // Expanded(child: ThumbnailAssetFormGroup()),
                  ],
                ),
                FeaturesFormGroup(),
                // Row(
                //   children: [
                //     Expanded(child: RaritiesFormGroup()),
                //     Expanded(child: StatsFormGroup()),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  label: "View Code",
                  onPressed: _model.code.isNotEmpty
                      ? () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CodeModal(_model.code);
                            },
                          );
                        }
                      : null,
                  icon: Icons.code,
                ),
                AppButton(
                  label: "Save as Draft",
                  onPressed: _model.isCompiled
                      ? null
                      : () {
                          ref
                              .read(createSmartContractProvider.notifier)
                              .saveDraft();
                          Toast.message("Draft saved!");
                        },
                  icon: Icons.publish,
                ),
                AppButton(
                  label: "Compile",
                  onPressed: _model.isCompiled
                      ? null
                      : () async {
                          final success = await ConfirmDialog.show(
                            title: "Compile Smart Contract?",
                            body:
                                "Are you sure you want to proceed?\nOnce compiled you will not be able to make any changes.",
                            confirmText: "Compile",
                            cancelText: "Cancel",
                          );

                          if (success == true) {
                            await ref
                                .read(createSmartContractProvider.notifier)
                                .compile();
                          }
                        },
                  icon: Icons.computer,
                ),
                // AppButton(
                //   label: "Publish to Library",
                //   onPressed: () {},
                //   icon: Icons.publish,
                // ),
                AppButton(
                  label: "Delete",
                  onPressed: _model.isCompiled ? null : () {},
                  icon: Icons.delete,
                  variant: AppColorVariant.Danger,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
