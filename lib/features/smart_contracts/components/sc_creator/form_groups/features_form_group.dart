import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/feature_chooser_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_sc_provider.dart';

class FeaturesFormGroup extends BaseComponent {
  const FeaturesFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createScProvider.notifier);
    final _model = ref.watch(createScProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FormGroupHeader("Features"),
          ..._model.features.map((f) => _FeatureCard(f)).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  label: "Add Feature",
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: rootNavigatorKey.currentContext!,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return FeatureChooserModal();
                      },
                    );
                  },
                  icon: Icons.add,
                  variant: AppColorVariant.Success,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final Feature feature;

  const _FeatureCard(
    this.feature, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(feature.icon),
        title: Text(feature.nameLabel),
        subtitle: Text(
          feature.descriptionLabel,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              label: "Edit",
              icon: Icons.edit,
              onPressed: () {},
            ),
            SizedBox(width: 6),
            AppButton(
              label: "Remove",
              icon: Icons.delete,
              variant: AppColorVariant.Danger,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
