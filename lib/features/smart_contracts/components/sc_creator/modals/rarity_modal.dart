import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/models/rarity.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_sc_provider.dart';

class RarityModal extends BaseComponent {
  final Rarity? initialRarity;
  const RarityModal({
    Key? key,
    this.initialRarity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createScProvider.notifier);
    final _model = ref.watch(createScProvider);

    return ModalContainer(
      children: [
        FormGroupHeader(
            initialRarity == null ? "Create Rarity" : "Edit Rarity"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Label",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Rareness",
                        style: TextStyle(color: Colors.white),
                      ),
                      suffix: Text("%"),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Description",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    minLines: 3,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stats Override",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.white24, width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: _model.stats.length,
                            itemBuilder: (context, index) {
                              final stat = _model.stats[index];
                              return ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: TextFormField(
                                  initialValue: stat.value,
                                ),
                                subtitle: Text(stat.label),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: FileSelector(
                transparentBackground: true,
                title: "Primary Asset Override",
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: FileSelector(
                transparentBackground: true,
                title: "Thumbnail Override",
              ),
            )
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Cancel",
              type: AppButtonType.Text,
              variant: AppColorVariant.Info,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            AppButton(
              label: "Save",
              icon: Icons.check,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
