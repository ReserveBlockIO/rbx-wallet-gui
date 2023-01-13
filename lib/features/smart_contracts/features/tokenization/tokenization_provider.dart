import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/generators.dart';
import '../../../../utils/validation.dart';
import '../../../asset/asset.dart';
import '../../models/property.dart';
import '../../models/tokenization.dart';
import '../../providers/create_smart_contract_provider.dart';

class TokenizationFormProvider extends StateNotifier<Tokenization> {
  final Reader read;

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey = GlobalKey();

  TokenizationFormProvider(this.read, [Tokenization model = const Tokenization()]) : super(model) {
    nameController = TextEditingController(text: model.name);
    descriptionController = TextEditingController(text: model.description);
  }

  String? nameValidator(String? value) => formValidatorNotEmpty(value, "Name");
  String? descriptionValidator(String? value) => formValidatorNotEmpty(value, "Description");

  void setTokenization(Tokenization tokenization) {
    state = tokenization;
    nameController.text = tokenization.name;
    descriptionController.text = tokenization.description;
  }

  void addPhoto(Asset asset) {
    state = state.copyWith(photo: asset);
  }

  void removePhoto() {
    state = state.copyWith(photo: null);
  }

  void addProvenance(Asset asset) {
    state = state.copyWith(provenance: asset);
  }

  void removeProvenance() {
    state = state.copyWith(provenance: null);
  }

  void addProperty(Property property) {
    state = state.copyWith(properties: [...state.properties, property]);
  }

  void removeProperty(int index) {
    state = state.copyWith(properties: [...state.properties]..removeAt(index));
  }

  void clear() {
    final id = uniqueId();
    state = Tokenization(id: id);
    nameController.clear();
    descriptionController.clear();
  }

  void complete(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    state = state.copyWith(
      name: nameController.text,
      description: descriptionController.text,
    );

    read(createSmartContractProvider.notifier).saveTokenization(state);
    clear();
    Navigator.of(context).pop();
  }
}

final tokenizationFormProvider = StateNotifierProvider<TokenizationFormProvider, Tokenization>(
  (ref) => TokenizationFormProvider(ref.read),
);
