import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/evolve/evolve_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/fractional/fractional_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/fractional/fractional_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/multi_asset/multi_asset_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/multi_asset/multi_asset_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/pair/pair_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/pair/pair_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/features/ticket/ticket_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/tokenization/tokenization_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/features/tokenization/tokenization_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/models/feature.dart';

class FeatureChooserModal extends BaseComponent {
  final bool canAddRoyalty;
  final bool canAddEvolve;
  final bool canAddMultiAsset;
  const FeatureChooserModal({
    Key? key,
    this.canAddRoyalty = true,
    this.canAddEvolve = true,
    this.canAddMultiAsset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ModalContainer(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: const Text("Close"),
          ),
        ),
        const FormGroupHeader("Add a Feature"),
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
                      if (!canAddRoyalty) {
                        InfoDialog.show(title: "Can't add Royalty", body: "You already have a royalty feature in this smart contract.");
                        return null;
                      }
                      ref.read(royaltyFormProvider.notifier).clear();
                      modal = const RoyaltyModal();
                      break;
                    case FeatureType.evolution:
                      if (!canAddEvolve) {
                        InfoDialog.show(
                            title: "Can't add Evolve",
                            body:
                                "You already have an evolve feature in this smart contract. Edit the existing evolving feature to add more stages.");
                        return null;
                      }
                      ref.read(evolveFormProvider.notifier).clear();
                      modal = const EvolveModal();
                      break;
                    case FeatureType.multiAsset:
                      if (!canAddMultiAsset) {
                        InfoDialog.show(
                            title: "Can't add Multi Asset",
                            body:
                                "You already have a multi asset feature in this smart contract. Edit the existing multi asset feature to add more assets.");
                        return null;
                      }
                      ref.read(multiAssetFormProvider.notifier).clear();
                      modal = const MultiAssetModal();
                      break;
                    case FeatureType.tokenization:
                      ref.read(tokenizationFormProvider.notifier).clear();
                      modal = const TokenizationModal();
                      break;
                    case FeatureType.ticket:
                      ref.read(ticketFormProvider.notifier).clear();
                      modal = const TicketModal();
                      break;
                    case FeatureType.fractionalization:
                      ref.read(fractionalFormProvider.notifier).clear();
                      modal = const FractionalModal();
                      break;

                    case FeatureType.pair:
                      ref.read(pairFormProvider.notifier).clear();
                      modal = const PairModal();
                      break;
                    default:
                      return const ModalContainer(
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
                      return const ModalContainer(
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
        dense: !feature.isAvailable,
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          feature.icon,
          color: Theme.of(context).colorScheme.warning,
        ),
        title: Text(feature.nameLabel),
        subtitle: Text(feature.genericDescription),
        trailing: feature.isAvailable ? const Icon(Icons.chevron_right) : null,
        onTap: feature.isAvailable
            ? () {
                onPressed(feature);
              }
            : null,
      ),
    );
  }
}
