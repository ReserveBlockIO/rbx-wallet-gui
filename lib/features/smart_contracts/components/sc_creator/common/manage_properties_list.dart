import 'package:flutter/material.dart';

import '../../../../../core/components/buttons.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../utils/validation.dart';
import '../../../models/property.dart';

class ManagePropertiesList extends StatelessWidget {
  final List<Property> properties;
  final Function(Property) onCreate;
  final Function(int) onRemove;

  ManagePropertiesList({
    Key? key,
    this.properties = const [],
    required this.onCreate,
    required this.onRemove,
  }) : super(key: key);

  final TextEditingController labelController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...properties.asMap().entries.map((entry) {
          final index = entry.key;
          final property = entry.value;

          return Row(
            key: Key("${property.label}_${property.value}"),
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Label",
                  ),
                  initialValue: property.label,
                  readOnly: true,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Value"),
                  initialValue: property.value,
                  readOnly: true,
                ),
              ),
              AppButton(
                label: "Remove",
                variant: AppColorVariant.Danger,
                onPressed: () {
                  onRemove(index);
                },
              )
            ],
          );
        }).toList(),
        Form(
          key: formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: labelController,
                  decoration: const InputDecoration(hintText: "Label"),
                  validator: (value) => formValidatorNotEmpty(value, "Label"),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFormField(
                  controller: valueController,
                  decoration: const InputDecoration(hintText: "Value"),
                  validator: (value) => formValidatorNotEmpty(value, "Value"),
                ),
              ),
              AppButton(
                label: "Add",
                variant: AppColorVariant.Light,
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  final newProperty = Property(label: labelController.text, value: valueController.text);
                  onCreate(newProperty);

                  labelController.clear();
                  valueController.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
