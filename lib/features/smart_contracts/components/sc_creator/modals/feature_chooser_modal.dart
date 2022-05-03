import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/rarity_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';

class FeatureChooserModal extends BaseComponent {
  const FeatureChooserModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ModalContainer(
      children: [
        FormGroupHeader("Add a Feature"),
        ...Feature.allTypes()
            .map((ft) => _FeatureOptionCard(
                feature: Feature(type: ft),
                onPressed: (Feature f) {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: rootNavigatorKey.currentContext!,
                    isScrollControlled: true,
                    isDismissible: true,
                    builder: (context) {
                      return RarityModal();
                    },
                  );
                }))
            .toList()
      ],
    );
  }
}

class _FeatureOptionCard extends StatelessWidget {
  final Feature feature;
  final Function(Feature feature) onPressed;

  const _FeatureOptionCard({
    Key? key,
    required this.feature,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        dense: false,
        contentPadding: EdgeInsets.zero,
        leading: Icon(feature.icon),
        title: Text(feature.nameLabel),
        subtitle: Text(feature.descriptionLabel),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          onPressed(feature);
        },
      ),
    );
  }
}
