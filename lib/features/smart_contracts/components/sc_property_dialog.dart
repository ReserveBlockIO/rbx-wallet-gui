import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../sc_property/models/sc_property.dart';
import '../providers/property_wizard_form_provider.dart';

class ScWizardPropertyDialog extends BaseComponent {
  ScWizardPropertyDialog({
    Key? key,
    required this.propertyIndex,
    required this.type,
  }) : super(key: key);

  final int propertyIndex;
  final ScPropertyType type;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(propertyWizardFormProvider(propertyIndex).notifier);
    final model = ref.read(propertyWizardFormProvider(propertyIndex));

    return StatefulBuilder(builder: (context, setState) {
      return Form(
        key: formKey,
        child: AlertDialog(
          title: Text(_getTitle()),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: provider.nameValidator,
                        controller: provider.nameController,
                        decoration: const InputDecoration(
                          label: Text("Property Name"),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: provider.valueController,
                        validator: provider.valueValidator,
                        decoration: InputDecoration(
                          label: Text("Property Value"),
                        ),
                        inputFormatters: [
                          if (type == ScPropertyType.number)
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9.]"),
                            ),
                        ],
                      ),
                    ),
                    if (type == ScPropertyType.color)
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white60),
              ),
            ),
            TextButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                final e = provider.generateProperty(type);
                if (e != null) {
                  Navigator.of(context).pop(e);
                }
              },
              child: const Text(
                "Add property",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    });
  }

  String _getTitle() {
    switch (type) {
      case ScPropertyType.text:
        return 'Text Property';
      case ScPropertyType.number:
        return 'Numerical Property';
      case ScPropertyType.color:
        return 'Color Property';
      default:
        return 'Text Property';
    }
  }
}
