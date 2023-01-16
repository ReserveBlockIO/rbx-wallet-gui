import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset_thumbnail.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_wizard_asset_preview.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_wizard_royalty_dialog.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty.dart';
import 'package:rbx_wallet/features/smart_contracts/features/royalty/royalty_modal.dart';
import 'package:rbx_wallet/features/smart_contracts/models/bulk_smart_contract_entry.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';
import '../../../core/base_component.dart';
import '../../../core/dialogs.dart';
import '../providers/sc_wizard_provider.dart';
import '../../../utils/validation.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 300, minHeight: 410),
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
                                          openFile(entry.primaryAsset!.file);
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
                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 11),
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
                          key: Key(asset.file.path),
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            children: [
                              asset.isImage
                                  ? Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: InkWell(
                                          onTap: () {
                                            openFile(asset.file);
                                          },
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                asset.file.path,
                                                width: 32,
                                                height: 32,
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                asset.fileName,
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
                                          openFile(asset.file);
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
                                    // provider.updateRoyalty(item.index, null);
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
            ],
          ),
        ),
      ),
    );
  }
}
