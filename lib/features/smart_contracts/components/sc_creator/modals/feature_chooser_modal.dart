import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';

class FeatureChooserModal extends BaseComponent {
  const FeatureChooserModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ModalContainer(
      children: [
        FormGroupHeader("Add a Feature"),
        ...Feature.allTypes()
            .asMap()
            .entries
            .map((entry) => _FeatureOptionCard(
                feature: Feature(type: entry.value),
                onPressed: (Feature f) {
                  Navigator.of(context).pop();
                  Widget? modal;

                  switch (f.type) {
                    case FeatureType.royalty:
                      ref.read(royaltyFormProvider.notifier).clear();
                      modal = RoyaltyModal();
                      break;
                    case FeatureType.evolution:
                      ref.read(evolveFormProvider.notifier).clear();
                      modal = EvolveModal();
                      break;
                    case FeatureType.ticket:
                      ref.read(ticketFormProvider.notifier).clear();
                      modal = TicketModal();
                      break;
                    default:
                      return ModalContainer(
                        children: [Text("Not implemented.")],
                      );
                  }

                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: rootNavigatorKey.currentContext!,
                    isScrollControlled: true,
                    isDismissible: true,
                    builder: (context) {
                      if (modal != null) {
                        return modal;
                      }
                      return ModalContainer(
                        children: [Text("Not implemented.")],
                      );
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
        subtitle: Text(feature.genericDescription),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          onPressed(feature);
        },
      ),
    );
  }
}
