import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/basic_properties_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/features_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/primary_asset_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/rarities_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/stats_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/form_groups/thumbnail_form_group.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_sc_provider.dart';

class ScCreatorMain extends BaseComponent {
  const ScCreatorMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    Expanded(child: ThumbnailAssetFormGroup()),
                  ],
                ),
                FeaturesFormGroup(),
                Row(
                  children: [
                    Expanded(child: RaritiesFormGroup()),
                    Expanded(child: StatsFormGroup()),
                  ],
                ),
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
                  onPressed: () {},
                  icon: Icons.code,
                ),
                AppButton(
                  label: "Compile",
                  onPressed: () async {
                    await ref.read(createScProvider.notifier).compile();
                  },
                  icon: Icons.computer,
                ),
                AppButton(
                  label: "Publish to Library",
                  onPressed: () {},
                  icon: Icons.publish,
                ),
                AppButton(
                  label: "Delete",
                  onPressed: () {},
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
