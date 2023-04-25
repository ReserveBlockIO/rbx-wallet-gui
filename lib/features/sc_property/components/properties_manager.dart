import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/sc_property/components/property_modal.dart';
import 'package:rbx_wallet/features/sc_property/models/sc_property.dart';
import 'package:rbx_wallet/features/sc_property/providers/edit_sc_property_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';

class PropertiesManager extends BaseComponent {
  const PropertiesManager({Key? key}) : super(key: key);

  Future<ScProperty?> handleEdit(BuildContext context, WidgetRef ref, {ScProperty? property}) async {
    if (property == null) {
      ref.read(editScPropertyProvider.notifier).clear();
    } else {
      ref.read(editScPropertyProvider.notifier).set(property);
    }

    return await showModalBottomSheet(
        context: context,
        builder: (context) {
          return PropertyModal();
        });
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createSmartContractProvider.notifier);
    final properties = ref.watch(createSmartContractProvider).properties;

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Properties",
            helpType: HelpType.properties,
          ),
          properties.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Card(
                    color: Colors.black54,
                    child: SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("No Properties"),
                            AppButton(
                              icon: Icons.add,
                              label: "Add Property",
                              onPressed: () async {
                                final property = await handleEdit(context, ref);
                                if (property != null) {
                                  provider.addProperty(property);
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: properties.length,
                        itemBuilder: (context, index) {
                          final property = properties[index];

                          return Card(
                            key: Key("${property.name}|${property.value}"),
                            child: ListTile(
                              title: Text(property.value),
                              subtitle: Text(property.name),
                              leading: Builder(builder: (context) {
                                switch (property.type) {
                                  case ScPropertyType.text:
                                    return Icon(Icons.text_fields);
                                  case ScPropertyType.number:
                                    return Icon(Icons.numbers);
                                  case ScPropertyType.color:
                                    return Icon(Icons.color_lens);
                                }
                              }),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppButton(
                                    label: "Remove",
                                    type: AppButtonType.Text,
                                    variant: AppColorVariant.Danger,
                                    onPressed: () {
                                      provider.removeProperty(index);
                                    },
                                  ),
                                  AppButton(
                                    label: "Edit",
                                    type: AppButtonType.Text,
                                    variant: AppColorVariant.Light,
                                    onPressed: () async {
                                      final p = await handleEdit(context, ref, property: property);
                                      if (p != null) {
                                        provider.updateProperty(p, index);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      AppButton(
                        icon: Icons.add,
                        label: "Add Property",
                        onPressed: () async {
                          final property = await handleEdit(context, ref);
                          if (property != null) {
                            provider.addProperty(property);
                          }
                        },
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
