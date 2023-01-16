import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/transaction_service.dart';
import '../../../utils/html_helpers.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../store/models/store.dart';

class CreateStoreModel {
  final String name;

  const CreateStoreModel({
    this.name = '',
  });

  CreateStoreModel copyWith({
    String? name,
  }) {
    return CreateStoreModel(
      name: name ?? this.name,
    );
  }
}

class CreateStoreProvider extends StateNotifier<CreateStoreModel> {
  final Reader read;
  final String accountId;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController stripeController = TextEditingController();

  CreateStoreProvider(this.read, this.accountId, [CreateStoreModel model = const CreateStoreModel()]) : super(model) {
    init();
  }

  init() async {
    stripeController.text = accountId;
  }

  String? nameValidator(String? value) => formValidatorNotEmpty(value, "Name");
  String? stripeValidator(String? value) => formValidatorNotEmpty(value, "Stripe Account");

  onboardStripe() async {
    read(globalLoadingProvider.notifier).start();
    final redirect = await TransactionService().stripeOnboard();
    read(globalLoadingProvider.notifier).complete();

    if (redirect != null) {
      HtmlHelpers().redirect(redirect);
      // launchUrl(Uri.parse(redirect));
    } else {
      Toast.error();
    }
  }

  Future<Store?> submit() async {
    final keypair = read(webSessionProvider).keypair;
    if (keypair == null) {
      Toast.error("No keypair");
      return null;
    }

    if (!formKey.currentState!.validate()) {
      return null;
    }

    final store = await TransactionService().createStore(
      email: keypair.email,
      address: keypair.public,
      name: nameController.text.trim(),
      account: stripeController.text.trim(),
    );

    if (store == null) {
      Toast.error();
      return null;
    }

    return store;
  }
}

final createStoreProvider = StateNotifierProvider.family<CreateStoreProvider, CreateStoreModel, String>((ref, accountId) {
  return CreateStoreProvider(ref.read, accountId);
});
