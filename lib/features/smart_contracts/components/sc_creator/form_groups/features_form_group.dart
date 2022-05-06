import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/modals/feature_chooser_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket_modal.dart';
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
          FormGroupHeader(
            "Features",
            helpType: HelpType.unknown,
          ),
          ..._model.features
              .asMap()
              .entries
              .map((entry) => _FeatureCard(entry.value, entry.key))
              .toList(),
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

class _FeatureCard extends BaseComponent {
  final Feature feature;
  final int index;

  const _FeatureCard(
    this.feature,
    this.index, {
    Key? key,
  }) : super(key: key);

  void showEditModal(Widget modal) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: rootNavigatorKey.currentContext!,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return modal;
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: Icon(feature.icon),
        title: Text(feature.nameLabel),
        subtitle: Text(
          feature.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              label: "Edit",
              icon: Icons.edit,
              onPressed: () {
                switch (feature.type) {
                  case FeatureType.royalty:
                    final royalty = Royalty.fromJson(feature.data);
                    ref.read(royaltyFormProvider.notifier).setRoyalty(royalty);
                    showEditModal(RoyaltyModal());
                    break;
                  case FeatureType.evolution:
                    final evolve = Evolve.fromJson(feature.data);
                    ref.read(evolveFormProvider.notifier).setEvolve(evolve);
                    showEditModal(EvolveModal());
                    break;
                  case FeatureType.ticket:
                    final ticket = Ticket.fromJson(feature.data);
                    ref.read(ticketFormProvider.notifier).setTicket(ticket);
                    showEditModal(TicketModal());
                    break;
                  default:
                    print("Not implemented");
                    break;
                }
              },
            ),
            SizedBox(width: 6),
            AppButton(
              label: "Remove",
              icon: Icons.delete,
              variant: AppColorVariant.Danger,
              onPressed: () async {
                final confirmed = await ConfirmDialog.show(
                    title: "Delete?",
                    body: "Are you sure you want to delete this?",
                    confirmText: "Delete",
                    destructive: true);

                if (confirmed != true) return;

                switch (feature.type) {
                  case FeatureType.royalty:
                    final royalty = Royalty.fromJson(feature.data);
                    ref.read(createScProvider.notifier).removeRoyalty(royalty);
                    break;
                  case FeatureType.evolution:
                    final evolve = Evolve.fromJson(feature.data);
                    ref.read(createScProvider.notifier).removeEvolve(evolve);
                    break;
                  default:
                    print("Not implemented");
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
