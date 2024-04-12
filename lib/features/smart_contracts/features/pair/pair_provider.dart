import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/generators.dart';
import '../../../../utils/validation.dart';
import '../../../asset/asset.dart';
import '../../models/pair.dart';
import '../../models/property.dart';
import '../../providers/create_smart_contract_provider.dart';

class PairFormProvider extends StateNotifier<Pair> {
  final Ref ref;

  late final TextEditingController nftAddressController;
  late final TextEditingController descriptionController;
  late final TextEditingController reasonController;
  late final TextEditingController metadataUrlController;
  final GlobalKey<FormState> formKey = GlobalKey();

  PairFormProvider(this.ref, [Pair model = const Pair()]) : super(model) {
    nftAddressController = TextEditingController(text: model.nftAddress);
    descriptionController = TextEditingController(text: model.description);
    reasonController = TextEditingController(text: model.reason);
    metadataUrlController = TextEditingController(text: model.metadataUrl);
  }

  String? nftAddressValidator(String? value) =>
      formValidatorNotEmpty(value, "NFT Address");
  String? descriptionValidator(String? value) =>
      formValidatorNotEmpty(value, "Description");
  String? reasonValidator(String? value) =>
      formValidatorNotEmpty(value, "Reason");

  List<String> get networkOptions => [
        "VFX",
        "Etherium",
        "Solana",
        "Tezos",
        "Flow",
      ];

  void setPair(Pair pair) {
    state = pair;
    nftAddressController.text = pair.nftAddress;
    descriptionController.text = pair.description;
    reasonController.text = pair.reason;
    metadataUrlController.text = pair.metadataUrl;
  }

  void setNetwork(String value) {
    state = state.copyWith(network: value);
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
    state = Pair(id: id);
    nftAddressController.clear();
    descriptionController.clear();
    reasonController.clear();
    metadataUrlController.clear();
  }

  void complete(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    state = state.copyWith(
      nftAddress: nftAddressController.text,
      description: descriptionController.text,
      reason: reasonController.text,
      metadataUrl: metadataUrlController.text,
    );

    ref.read(createSmartContractProvider.notifier).savePair(state);
    clear();
    Navigator.of(context).pop();
  }
}

final pairFormProvider = StateNotifierProvider<PairFormProvider, Pair>(
  (ref) => PairFormProvider(ref),
);
