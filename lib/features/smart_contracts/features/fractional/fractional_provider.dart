import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/generators.dart';
import '../../../../utils/validation.dart';
import '../../models/fractional.dart';
import '../../providers/create_smart_contract_provider.dart';

class FractionalFormProvider extends StateNotifier<Fractional> {
  final Ref ref;

  late final TextEditingController creatorRetainsController;
  late final TextEditingController fractionalInterestController;
  late final TextEditingController votingDescriptionController;
  final GlobalKey<FormState> formKey = GlobalKey();

  FractionalFormProvider(this.ref, [Fractional model = const Fractional()]) : super(model) {
    creatorRetainsController = TextEditingController(text: model.creatorRetains.toString());
    fractionalInterestController = TextEditingController(text: model.fractionalInterest.toString());
    votingDescriptionController = TextEditingController(text: model.votingDescription);
  }

  String? creatorRetainsValidator(String? value) => formValidatorNumber(value, "Creator Retained Ownership");
  String? fractionalInterestValidator(String? value) => formValidatorNumber(value, "Fractional Interest");

  void setFractional(Fractional fractional) {
    state = fractional;
    creatorRetainsController.text = fractional.creatorRetains.toString();
    fractionalInterestController.text = fractional.fractionalInterest.toString();
  }

  void setAllowVoting(bool value) {
    state = state.copyWith(allowVoting: value);
  }

  void clear() {
    final id = uniqueId();
    state = Fractional(id: id);
    creatorRetainsController.clear();
    fractionalInterestController.clear();
  }

  void complete(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    state = state.copyWith(
      creatorRetains: double.parse(creatorRetainsController.text),
      fractionalInterest: double.parse(fractionalInterestController.text),
    );

    ref.read(createSmartContractProvider.notifier).saveFractional(state);
    clear();
    Navigator.of(context).pop();
  }
}

final fractionalFormProvider = StateNotifierProvider<FractionalFormProvider, Fractional>(
  (ref) => FractionalFormProvider(ref),
);
