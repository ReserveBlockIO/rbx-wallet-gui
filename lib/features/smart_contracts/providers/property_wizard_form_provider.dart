import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../sc_property/models/sc_property.dart';

import '../../../../utils/validation.dart';

class PropertyWizardFormProvider extends StateNotifier<ScProperty> {
  final Ref ref;
  final int index;
  late final TextEditingController nameController;
  late final TextEditingController valueController;

  PropertyWizardFormProvider(this.ref, this.index, [ScProperty model = const ScProperty()]) : super(model) {
    nameController = TextEditingController(text: model.name);
    valueController = TextEditingController(text: model.value);
  }

  String? nameValidator(value) => formValidatorNotEmpty(value, "Name");

  String? valueValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Value is required";
    }

    if (state.type == ScPropertyType.color) {
      if (!value.contains("#") || value.length != 7) {
        return "Invalid hex color";
      }
    }

    return null;
  }

  clear() {
    nameController.text = "";
    valueController.text = "";
  }

  generateProperty(ScPropertyType type) {
    return ScProperty(name: nameController.text, value: valueController.text, type: type);
  }
}

final propertyWizardFormProvider = StateNotifierProvider.family<PropertyWizardFormProvider, ScProperty, int>(
  (ref, index) => PropertyWizardFormProvider(ref, index),
);
