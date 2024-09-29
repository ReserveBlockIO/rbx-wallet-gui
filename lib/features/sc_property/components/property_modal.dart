import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/dropdowns.dart';
import '../../../core/theme/app_theme.dart';
import '../providers/edit_sc_property_provider.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../models/sc_property.dart';

class PropertyModal extends BaseComponent {
  const PropertyModal({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(editScPropertyProvider.notifier);
    final model = ref.watch(editScPropertyProvider);

    return ModalContainer(
      withDecor: false,
      withClose: true,
      children: [
        Form(
          key: provider.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  AppDropdown<ScPropertyType>(
                    label: "Property Type",
                    selectedValue: model.type,
                    selectedLabel: model.typeLabel,
                    onChange: (val) {
                      provider.setType(val);
                    },
                    options: [
                      AppDropdownOption(label: "Text", value: ScPropertyType.text),
                      AppDropdownOption(label: "Number", value: ScPropertyType.number),
                      AppDropdownOption(label: "Color", value: ScPropertyType.color),
                    ],
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: provider.nameController,
                      validator: provider.nameValidator,
                      decoration: InputDecoration(
                        label: Text("Property Name"),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: provider.valueController,
                      validator: provider.valueValidator,
                      decoration: InputDecoration(
                        label: Text("Property Value"),
                      ),
                      inputFormatters: [
                        if (model.type == ScPropertyType.number)
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9.]"),
                          ),
                      ],
                    ),
                  ),
                  if (model.type == ScPropertyType.color)
                    IconButton(
                      icon: Icon(
                        Icons.color_lens,
                      ),
                      onPressed: () async {
                        final color = await showDialog(
                          context: context,
                          builder: (context) {
                            Color color = colorFromHex(provider.valueController.value.text) ?? Color.fromARGB(255, 255, 0, 0);

                            return StatefulBuilder(builder: (context, setState) {
                              return AlertDialog(
                                content: ConstrainedBox(
                                  constraints: BoxConstraints(maxHeight: 300),
                                  child: ColorPicker(
                                    pickerColor: color,
                                    enableAlpha: false,
                                    onColorChanged: (val) {
                                      setState(() {
                                        color = val;
                                      });
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(color);
                                    },
                                    child: Text(
                                      "Choose",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              );
                            });
                          },
                        );

                        if (color != null) {
                          final v = colorToHex(color, enableAlpha: false);
                          provider.valueController.text = "#$v";
                        }
                      },
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
                    variant: AppColorVariant.Light,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  AppButton(
                    label: "Save",
                    onPressed: () {
                      final property = provider.submit();
                      if (property != null) {
                        Navigator.of(context).pop(property);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
