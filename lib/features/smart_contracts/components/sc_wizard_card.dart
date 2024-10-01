import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../sc_property/models/sc_property.dart';
import 'sc_evolve_dialog.dart';
import 'sc_property_dialog.dart';
import 'sc_property_type_dialog.dart';
import 'sc_wizard_evolve_type_dialog.dart';
import '../features/evolve/evolve.dart';
import '../features/evolve/evolve_phase.dart';
import '../features/evolve/evolve_phase_wizard_form_provider.dart';
import '../models/bulk_smart_contract_entry.dart';

import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/files.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../features/royalty/royalty.dart';
import '../providers/property_wizard_form_provider.dart';
import '../providers/sc_wizard_provider.dart';
import 'sc_creator/common/file_selector.dart';
import 'sc_creator/common/help_button.dart';
import 'sc_wizard_asset_preview.dart';
import 'sc_wizard_royalty_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ScWizedCard extends BaseComponent {
  final int index;
  const ScWizedCard(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(scWizardProvider.notifier);
    final item = ref.watch(scWizardProvider)[index];

    final entry = item.entry;
    return Card(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 300, minHeight: 410),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.name.isEmpty ? "Name" : entry.name,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: entry.name.isEmpty ? Colors.white54 : Colors.white,
                            ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async {
                        final value = await PromptModal.show(
                          contextOverride: context,
                          title: entry.name.isEmpty ? "Add Name" : "Edit Name",
                          validator: (value) => formValidatorNotEmpty(value, "Name"),
                          labelText: "Name",
                          initialValue: entry.name,
                        );
                        if (value != null && value.isNotEmpty) {
                          provider.updateName(item.index, value);
                        }
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                      ),
                    ),
                    const HelpButton(
                      HelpType.smartContractName,
                      subtle: true,
                      mini: true,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Quantity: ${entry.quantity}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async {
                        String? value = await PromptModal.show(
                          contextOverride: context,
                          title: "Quantity to Mint",
                          validator: (value) => formValidatorNotEmpty(value, "Quantity"),
                          labelText: "Quantity",
                          initialValue: entry.quantity.toString(),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        );

                        if (value == null) {
                          return;
                        }

                        if (value.isEmpty) {
                          value = "1";
                        }

                        value = value.trim();
                        int v = int.tryParse(value) ?? 1;
                        if (v < 1) {
                          v = 1;
                          Toast.error("Min quanity is 1.");
                        }

                        if (v > 100) {
                          v = 100;
                          Toast.error("Max quanity is 100.");
                        }

                        provider.updateQuantity(item.index, v);
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                      ),
                    ),
                    const HelpButton(
                      HelpType.mintQuantity,
                      subtle: true,
                      mini: true,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.black87,
                    child: Center(
                      child: entry.primaryAsset == null
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Primary Asset"),
                                FileSelector(
                                  transparentBackground: true,
                                  asset: entry.primaryAsset,
                                  onChange: (asset) {
                                    if (asset != null) {
                                      provider.updatePrimaryAsset(item.index, asset);
                                    }
                                  },
                                ),
                              ],
                            )
                          : Stack(
                              children: [
                                ScWizardAssetPreview(entry: entry),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                      child: IconButton(
                                          onPressed: () async {
                                            if (kIsWeb) {
                                              launchUrlString(entry.primaryAsset!.location!);
                                            } else {
                                              openFile(entry.primaryAsset!.file);
                                            }
                                          },
                                          icon: const Icon(Icons.open_in_new)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Theme.of(context).colorScheme.danger,
                                      ),
                                      child: IconButton(
                                          onPressed: () async {
                                            final confirmed = await ConfirmDialog.show(
                                              context: context,
                                              title: "Delete Primary Asset?",
                                              body: "Are you sure you want to delete the primary asset?",
                                              confirmText: "Delete",
                                              cancelText: "Cancel",
                                              destructive: true,
                                            );

                                            if (confirmed == true) {
                                              provider.updatePrimaryAsset(item.index, null);
                                            }
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.creatorName.isEmpty ? "Creator Name" : "Creator: ${entry.creatorName}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: entry.creatorName.isEmpty ? Colors.white54 : Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async {
                        final value = await PromptModal.show(
                          contextOverride: context,
                          title: entry.creatorName.isEmpty ? "Add Creator Name" : "Edit Creator Name",
                          validator: (value) => formValidatorNotEmpty(value, "Creator Name"),
                          labelText: "Creator Name",
                          initialValue: entry.creatorName,
                        );
                        if (value != null && value.isNotEmpty) {
                          provider.updateCreatorName(item.index, value);
                        }
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                      ),
                    ),
                    const HelpButton(
                      HelpType.minterName,
                      subtle: true,
                      mini: true,
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.description.isEmpty ? "Description" : entry.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: entry.description.isEmpty ? Colors.white54 : Colors.white,
                            ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async {
                        final value = await PromptModal.show(
                          contextOverride: context,
                          title: entry.name.isEmpty ? "Add Description" : "Edit Description",
                          validator: (value) => formValidatorNotEmpty(value, "Description"),
                          labelText: "Description",
                          initialValue: entry.description,
                          lines: 3,
                        );
                        if (value != null && value.isNotEmpty) {
                          provider.updateDescription(item.index, value);
                        }
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 16,
                      ),
                    ),
                    const HelpButton(
                      HelpType.description,
                      subtle: true,
                      mini: true,
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Royalty",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: entry.royalty == null ? Colors.white54 : Colors.white,
                            ),
                      ),
                    ),
                    if (entry.royalty == null)
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () async {
                          final Royalty? royalty = await showDialog(
                            context: context,
                            builder: (context) {
                              return ScWizardRoyaltyDialog();
                            },
                          );

                          provider.updateRoyalty(item.index, royalty);
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 16,
                        ),
                      ),
                    if (entry.royalty != null)
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () async {
                          final confirmed = await ConfirmDialog.show(
                            title: "Remove Royalty?",
                            body: "Are you sure you want to remove the royalty?",
                            confirmText: "Remove",
                            cancelText: "Cancel",
                            destructive: true,
                          );

                          if (confirmed == true) {
                            provider.updateRoyalty(item.index, null);
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 16,
                        ),
                      ),
                  ],
                ),
                if (entry.royalty != null)
                  Text(
                    "${entry.royalty!.amountWithSuffix} to ${entry.royalty!.address}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11),
                  ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Additional Assets",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: entry.additionalAssets.isEmpty ? Colors.white54 : Colors.white,
                            ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async {
                        final asset = await selectAsset(ref);
                        if (asset != null) {
                          provider.addAdditionalAsset(item.index, asset);
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Column(
                      children: entry.additionalAssets.asMap().entries.map(
                        (e) {
                          final i = e.key;
                          final asset = e.value;
                          return Padding(
                            key: Key(kIsWeb ? asset.location! : asset.file.path),
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                asset.isImage
                                    ? Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: InkWell(
                                            onTap: () {
                                              if (kIsWeb) {
                                                launchUrlString(asset.location!);
                                              } else {
                                                openFile(asset.file);
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                kIsWeb
                                                    ? CachedNetworkImage(
                                                        imageUrl: asset.location!,
                                                        width: 32,
                                                        height: 32,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.asset(
                                                        asset.file.path,
                                                        width: 32,
                                                        height: 32,
                                                        fit: BoxFit.cover,
                                                      ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  asset.truncatedFileName(),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            if (kIsWeb) {
                                              launchUrlString(asset.location!);
                                            } else {
                                              openFile(asset.file);
                                            }
                                          },
                                          child: Text(
                                            asset.fileName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () async {
                                    final confirmed = await ConfirmDialog.show(
                                      title: "Remove Asset?",
                                      body: "Are you sure you want to remove this additional asset?",
                                      confirmText: "Remove",
                                      cancelText: "Cancel",
                                      destructive: true,
                                    );

                                    if (confirmed == true) {
                                      provider.removeAdditionalAsset(item.index, i);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                const Divider(),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            entry.evolve.phases.isEmpty ? "Evolve" : "Evolve (${entry.evolve.typeLabel})",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: entry.evolve.phases.isEmpty ? Colors.white54 : Colors.white,
                                ),
                          ),
                        ),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () async {
                            if (entry.evolve.phases.isEmpty) {
                              final EvolveType? type = await showDialog(
                                context: context,
                                builder: (context) {
                                  return const ScWizardEvolveTypeDialog();
                                },
                              );

                              if (type == null) {
                                return;
                              }
                              provider.setEvolvingType(index, type);
                            }

                            ref.read(evolvePhaseWizardFormProvider(item.entry.evolve.phases.length).notifier).clear();
                            final EvolvePhase? evolve = await showDialog(
                              context: context,
                              builder: (context) {
                                return ScWizardEvolvesDialog(entryIndex: item.index, phaseIndex: item.entry.evolve.phases.length);
                              },
                            );
                            provider.addEvolvePhase(item.index, evolve);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: SingleChildScrollView(
                        child: Column(
                          children: entry.evolve.phases.asMap().entries.map(
                            (e) {
                              final i = e.key;
                              final phase = e.value;
                              return Padding(
                                key: Key("$i-${phase.toString()}"),
                                padding: const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  children: [
                                    Expanded(child: Text('Phase #${i + 1}: ${phase.name}')),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () async {
                                        final confirmed = await ConfirmDialog.show(
                                          title: "Remove Phase?",
                                          body: "Are you sure you want to remove this evolution phase?",
                                          confirmText: "Remove",
                                          cancelText: "Cancel",
                                          destructive: true,
                                        );

                                        if (confirmed == true) {
                                          provider.removeEvolutionPhase(item.index, i);
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                _showProperties(context, entry, ref, item, provider),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showProperties(BuildContext context, BulkSmartContractEntry entry, WidgetRef ref, ScWizardItem item, ScWizardProvider provider) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Properties",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: entry.evolve.phases.isEmpty ? Colors.white54 : Colors.white,
                    ),
              ),
            ),
            IconButton(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () async {
                final ScPropertyType? type = await showDialog(
                  context: context,
                  builder: (context) {
                    return const ScWizardPropertyTypeDialog();
                  },
                );

                if (type == null) {
                  return;
                }

                ref.read(propertyWizardFormProvider(item.entry.properties.length).notifier).clear();
                final ScProperty? property = await showDialog(
                  context: context,
                  builder: (context) {
                    return ScWizardPropertyDialog(
                      propertyIndex: item.entry.properties.length,
                      type: type,
                    );
                  },
                );
                provider.addProperty(item.index, property);
              },
              icon: const Icon(
                Icons.add,
                size: 16,
              ),
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: SingleChildScrollView(
            child: Column(
              children: entry.properties.asMap().entries.map(
                (e) {
                  final i = e.key;
                  final property = e.value;
                  return Padding(
                    key: Key("$i-${property.toString()}"),
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        Builder(builder: (context) {
                          switch (property.type) {
                            case ScPropertyType.text:
                              return Icon(
                                Icons.text_fields,
                                size: 18,
                              );
                            case ScPropertyType.number:
                              return Icon(
                                Icons.numbers,
                                size: 18,
                              );
                            case ScPropertyType.url:
                              return Icon(
                                Icons.link,
                                size: 18,
                              );
                            case ScPropertyType.color:
                              return Icon(
                                Icons.color_lens,
                                size: 18,
                                color: colorFromHex(property.value),
                              );
                          }
                        }),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(child: Text('${property.name}: ${property.value}')),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () async {
                            final confirmed = await ConfirmDialog.show(
                              title: "Remove Property?",
                              body: "Are you sure you want to remove this property?",
                              confirmText: "Remove",
                              cancelText: "Cancel",
                              destructive: true,
                            );

                            if (confirmed == true) {
                              provider.removeProperty(item.index, i);
                            }
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
