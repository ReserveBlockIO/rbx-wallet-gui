import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/models/stat.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_sc_provider.dart';

class StatModal extends BaseComponent {
  final Stat? initialStat;
  const StatModal({
    Key? key,
    this.initialStat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createScProvider.notifier);
    final _model = ref.watch(createScProvider);

    return ModalContainer(
      children: [
        FormGroupHeader(initialStat == null ? "Create Stat" : "Edit Stat"),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Label",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SmartSelect<StatType>.single(
                    title: "Stat Type",
                    modalType: S2ModalType.bottomSheet,
                    selectedValue: initialStat != null
                        ? initialStat!.type
                        : StatType.string,
                    onChange: (option) {
                      print(option.value);
                    },
                    choiceItems: Stat.allTypes()
                        .map(
                          (s) => S2Choice<StatType>(
                            value: s,
                            title: Stat.typeToString(s),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Value",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Description",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    minLines: 1,
                    maxLines: 3,
                  ),
                ),
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
        )
      ],
    );
  }
}
