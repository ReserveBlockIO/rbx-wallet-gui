import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/breakpoints.dart';
import '../../../app.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import 'sc_wizard_asset_preview.dart';
import '../screens/sc_wizard_edit_item_screen.dart';

import '../../../core/base_component.dart';
import '../providers/sc_wizard_provider.dart';

class ScWizardList extends BaseComponent {
  const ScWizardList({Key? key}) : super(key: key);

  void createNew({
    required BuildContext context,
    required ScWizardProvider provider,
    required int index,
    required int x,
    required int y,
    required ScWizardItem item,
  }) {
    provider.insert(
      entry: item.entry.copyWith(),
      index: index,
      y: y,
      x: x,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScWizardEditItemScreen(
          title: "Create Instance",
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(scWizardProvider.notifier);
    final items = ref.watch(scWizardProvider);
    final isMobile = BreakPoints.useMobileLayout(context);

    if (items.isEmpty) {
      return Center(
        child: AppButton(
          label: "Create First Instance",
          onPressed: () {
            createNew(context: context, provider: provider, index: 0, x: 0, y: 0, item: ScWizardItem.empty());
          },
          icon: Icons.add,
        ),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final entry = item.entry;

        String description = entry.description;
        if (entry.royalty != null || entry.additionalAssets.isNotEmpty) {
          if (entry.royalty != null) {
            description = "${entry.royalty!.amountWithSuffix} Royalty to ${entry.royalty!.address}";
            if (entry.additionalAssets.isNotEmpty) {
              description = "$description | ${entry.additionalAssets.length} Additional Asset${entry.additionalAssets.length == 1 ? '' : 's'}";
            }
          } else if (entry.additionalAssets.isNotEmpty) {
            description = "${entry.additionalAssets.length} Additional Asset${entry.additionalAssets.length == 1 ? '' : 's'}";
          }
        }

        if (item.entry.evolve.phases.isNotEmpty) {
          description = "$description | ${item.entry.evolve.phases.length} Evolve Phase${item.entry.evolve.phases.length == 1 ? '' : 's'}";
        }

        if (item.entry.properties.isNotEmpty) {
          description = "$description | ${item.entry.properties.length} ${item.entry.properties.length == 1 ? 'Property' : 'Properties'}";
        }

        return Container(
          decoration: BoxDecoration(
            boxShadow: glowingBox,
          ),
          child: Card(
            color: Colors.black,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: entry.name,
                    ),
                    TextSpan(
                      text: " (x${entry.quantity})",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.success),
                    ),
                  ],
                ),
              ),
              leading: SizedBox(
                width: 32,
                height: 32,
                child: ScWizardAssetPreview(entry: entry, small: true),
              ),
              subtitle: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: isMobile
                  ? PopupMenuButton(itemBuilder: ((context) {
                      return [
                        PopupMenuItem(
                            onTap: () {
                              createNew(context: context, provider: provider, index: items.length, x: 0, y: 0, item: item.copyWith());
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Duplicate",
                            )),
                        PopupMenuItem(
                            onTap: () {
                              Navigator.of(rootNavigatorKey.currentContext!).push(
                                MaterialPageRoute(
                                  builder: (context) => ScWizardEditItemScreen(
                                    title: "Edit Instance",
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Edit",
                            )),
                        PopupMenuItem(
                            onTap: () async {
                              final confirmed = await ConfirmDialog.show(
                                title: "Delete Instance?",
                                body: "Are you sure you want to delete this instance?",
                                confirmText: "Delete",
                                destructive: true,
                              );
                              if (confirmed == true) {
                                ref.read(scWizardProvider.notifier).removeAt(index, delay: 300);
                              }
                            },
                            child: Text(
                              "Delete",
                            )),
                      ];
                    }))
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppButton(
                          label: "Duplicate",
                          icon: Icons.copy,
                          onPressed: () {
                            createNew(context: context, provider: provider, index: items.length, x: 0, y: 0, item: item.copyWith());
                          },
                          variant: AppColorVariant.Light,
                        ),
                        const SizedBox(width: 6),
                        AppButton(
                          label: "Edit",
                          icon: Icons.edit,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ScWizardEditItemScreen(
                                  title: "Edit Instance",
                                  index: index,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 6),
                        AppButton(
                          label: "Delete",
                          icon: Icons.delete,
                          variant: AppColorVariant.Danger,
                          onPressed: () async {
                            final confirmed = await ConfirmDialog.show(
                              title: "Delete Instance?",
                              body: "Are you sure you want to delete this instance?",
                              confirmText: "Delete",
                              destructive: true,
                            );
                            if (confirmed == true) {
                              ref.read(scWizardProvider.notifier).removeAt(index, delay: 300);
                            }
                          },
                        ),
                      ],
                    ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScWizardEditItemScreen(
                      title: "Edit Instance",
                      index: index,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
