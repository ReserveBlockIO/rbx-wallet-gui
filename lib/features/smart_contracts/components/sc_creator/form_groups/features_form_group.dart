import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../app.dart';
import '../../../../../core/base_component.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/dialogs.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/components.dart';
import '../../../features/evolve/evolve.dart';
import '../../../features/evolve/evolve_form_provider.dart';
import '../../../features/evolve/evolve_modal.dart';
import '../../../features/fractional/fractional_modal.dart';
import '../../../features/fractional/fractional_provider.dart';
import '../../../features/multi_asset/multi_asset_modal.dart';
import '../../../features/multi_asset/multi_asset_provider.dart';
import '../../../features/pair/pair_modal.dart';
import '../../../features/pair/pair_provider.dart';
import '../../../features/royalty/royalty.dart';
import '../../../features/royalty/royalty_form_provider.dart';
import '../../../features/royalty/royalty_modal.dart';
import '../../../features/soul_bound/soul_bound.dart';
import '../../../features/soul_bound/soul_bound_modal.dart';
import '../../../features/soul_bound/sould_bound_form_provider.dart';
import '../../../features/ticket/ticket.dart';
import '../../../features/ticket/ticket_form_provider.dart';
import '../../../features/ticket/ticket_modal.dart';
import '../../../features/tokenization/tokenization_modal.dart';
import '../../../features/tokenization/tokenization_provider.dart';
import '../../../models/feature.dart';
import '../../../models/fractional.dart';
import '../../../models/multi_asset.dart';
import '../../../models/pair.dart';
import '../../../models/tokenization.dart';
import '../../../providers/create_smart_contract_provider.dart';
import '../common/form_group_container.dart';
import '../common/form_group_header.dart';
import '../common/help_button.dart';
import '../modals/feature_chooser_modal.dart';

class FeaturesFormGroup extends BaseComponent {
  const FeaturesFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Features",
            helpType: HelpType.features,
          ),
          SizedBox(
            height: 10,
          ),
          ..._model.features
              .asMap()
              .entries
              .map((entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _FeatureCard(
                      entry.value,
                      entry.key,
                      readOnly: _model.isCompiled,
                    ),
                  ))
              .toList(),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(right: 0),
            child: Center(
              child: AppButton(
                label: "Add${_model.features.isNotEmpty ? ' Another ' : ' '}Feature",
                onPressed: _model.isCompiled
                    ? null
                    : () {
                        final canAddRoyalty = _model.features.firstWhereOrNull((f) => f.type == FeatureType.royalty) == null;

                        final canAddEvolve = _model.features.firstWhereOrNull((f) => f.type == FeatureType.evolution) == null;

                        final canAddMultiAsset = _model.features.firstWhereOrNull((f) => f.type == FeatureType.multiAsset) == null;

                        final canAddSoulBound = _model.features.firstWhereOrNull((f) => f.type == FeatureType.soulBound) == null;

                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: rootNavigatorKey.currentContext!,
                          isScrollControlled: true,
                          isDismissible: true,
                          builder: (context) {
                            return FeatureChooserModal(
                                canAddRoyalty: canAddRoyalty,
                                canAddEvolve: canAddEvolve,
                                canAddMultiAsset: canAddMultiAsset,
                                canAddSoulBound: canAddSoulBound);
                          },
                        );
                      },
                icon: Icons.add,
                variant: AppColorVariant.Primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FeatureCard extends BaseComponent {
  final Feature feature;
  final int index;
  final bool readOnly;

  const _FeatureCard(
    this.feature,
    this.index, {
    this.readOnly = false,
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
    return AppCard(
      padding: 6,
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
            if (feature.canEdit)
              AppButton(
                type: AppButtonType.Outlined,
                variant: AppColorVariant.Secondary,
                label: "Edit",
                onPressed: readOnly
                    ? null
                    : () {
                        switch (feature.type) {
                          case FeatureType.royalty:
                            final royalty = Royalty.fromJson(feature.data);
                            ref.read(royaltyFormProvider.notifier).setRoyalty(royalty);
                            showEditModal(const RoyaltyModal());
                            break;
                          case FeatureType.evolution:
                            final evolve = Evolve.fromJson(feature.data);
                            ref.read(evolveFormProvider.notifier).setEvolve(evolve);
                            showEditModal(const EvolveModal());
                            break;
                          case FeatureType.ticket:
                            final ticket = Ticket.fromJson(feature.data);
                            ref.read(ticketFormProvider.notifier).setTicket(ticket);
                            showEditModal(const TicketModal());
                            break;
                          case FeatureType.multiAsset:
                            final multiAsset = MultiAsset.fromJson(feature.data);
                            ref.read(multiAssetFormProvider.notifier).setMultiAsset(multiAsset);
                            showEditModal(const MultiAssetModal());
                            break;
                          case FeatureType.tokenization:
                            final tokenization = Tokenization.fromJson(feature.data);
                            ref.read(tokenizationFormProvider.notifier).setTokenization(tokenization);
                            showEditModal(const TokenizationModal());
                            break;
                          case FeatureType.fractionalization:
                            final fractional = Fractional.fromJson(feature.data);
                            ref.read(fractionalFormProvider.notifier).setFractional(fractional);
                            showEditModal(const FractionalModal());
                            break;
                          case FeatureType.pair:
                            final pair = Pair.fromJson(feature.data);
                            ref.read(pairFormProvider.notifier).setPair(pair);
                            showEditModal(const PairModal());
                            break;
                          case FeatureType.soulBound:
                            final soulBound = SoulBound.fromJson(feature.data);
                            ref.read(soulBoundFormProvider.notifier).setSoulBound(soulBound);
                            showEditModal(const SoulBoundModal());
                            break;
                          default:
                            print("Not implemented");
                            break;
                        }
                      },
              ),
            const SizedBox(width: 6),
            AppButton(
              label: "Remove",
              variant: AppColorVariant.Danger,
              type: AppButtonType.Outlined,
              onPressed: readOnly
                  ? null
                  : () async {
                      final confirmed = await ConfirmDialog.show(
                          title: "Delete?", body: "Are you sure you want to delete this?", confirmText: "Delete", destructive: true);

                      if (confirmed != true) return;

                      switch (feature.type) {
                        case FeatureType.royalty:
                          final royalty = Royalty.fromJson(feature.data);
                          ref.read(createSmartContractProvider.notifier).removeRoyalty(royalty);
                          break;
                        case FeatureType.evolution:
                          final evolve = Evolve.fromJson(feature.data);
                          ref.read(createSmartContractProvider.notifier).removeEvolve(evolve);
                          break;
                        case FeatureType.multiAsset:
                          final multiAsset = MultiAsset.fromJson(feature.data);
                          ref.read(createSmartContractProvider.notifier).removeMultiAsset(multiAsset);
                          break;
                        case FeatureType.tokenization:
                          final tokenization = Tokenization.fromJson(feature.data);
                          ref.read(createSmartContractProvider.notifier).removeTokenization(tokenization);
                          break;
                        case FeatureType.fractionalization:
                          final fractional = Fractional.fromJson(feature.data);
                          ref.read(createSmartContractProvider.notifier).removeFractional(fractional);
                          break;
                        case FeatureType.pair:
                          final pair = Pair.fromJson(feature.data);
                          ref.read(createSmartContractProvider.notifier).removePair(pair);
                          break;
                        case FeatureType.soulBound:
                          final soulBound = SoulBound.fromJson(feature.data);
                          ref.read(createSmartContractProvider.notifier).removeSoulBound(soulBound);
                          break;
                        case FeatureType.btcTokenization:
                          ref.read(createSmartContractProvider.notifier).removeBtcTokenization();
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
