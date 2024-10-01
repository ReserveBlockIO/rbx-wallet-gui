import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../app.dart';
import '../../../../../core/base_component.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../features/royalty/rarity_modal.dart';
import '../../../models/rarity.dart';
import '../../../providers/create_smart_contract_provider.dart';
import '../common/form_group_container.dart';
import '../common/form_group_header.dart';
import '../common/help_button.dart';

class RaritiesFormGroup extends BaseComponent {
  const RaritiesFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Rarities",
            helpType: HelpType.unknown,
          ),
          ..._model.rarities.map((r) => _RarityCard(r)).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  label: "Add Rarity",
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: rootNavigatorKey.currentContext!,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return const RarityModal();
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

class _RarityCard extends StatelessWidget {
  final Rarity rarity;

  const _RarityCard(
    this.rarity, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 100,
          child: Text(
            rarity.percentLabel,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        title: Text(rarity.name),
        subtitle: Text(
          rarity.description,
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
            const SizedBox(width: 6),
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
