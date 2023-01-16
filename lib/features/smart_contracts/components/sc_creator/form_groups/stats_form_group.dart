import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app.dart';
import '../../../../../core/base_component.dart';
import '../../../../../core/components/buttons.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../models/stat.dart';
import '../../../providers/create_smart_contract_provider.dart';
import '../../../providers/stat_form_provider.dart';
import '../common/form_group_container.dart';
import '../common/form_group_header.dart';
import '../common/help_button.dart';
import '../modals/stat_modal.dart';

class StatsFormGroup extends BaseComponent {
  const StatsFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Stats",
            helpType: HelpType.unknown,
          ),
          ..._model.stats.asMap().entries.map((entry) => _StatCard(entry.value, entry.key)).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  label: "Add Stat",
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: rootNavigatorKey.currentContext!,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return StatModal(ref.read(createSmartContractProvider).stats.length);
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

class _StatCard extends BaseComponent {
  final Stat stat;
  final int index;

  const _StatCard(
    this.stat,
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: const Icon(FontAwesomeIcons.trophy),
        title: Text("${stat.label}: ${stat.value}"),
        subtitle: const Text("Type: String"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              label: "Edit",
              icon: Icons.edit,
              onPressed: () {
                final _provider = ref.read(statFormProvider(index).notifier);
                _provider.setStat(stat);

                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: rootNavigatorKey.currentContext!,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (context) {
                    return StatModal(index);
                  },
                );
              },
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
