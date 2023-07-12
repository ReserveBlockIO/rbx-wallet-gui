import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/token/models/new_token_topic.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/features/voting/models/new_topic.dart';
import 'package:rbx_wallet/features/voting/utils.dart';
import '../../../core/app_constants.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/toast.dart';

import '../../../core/models/value_label.dart';
import '../../../utils/validation.dart';
import '../../global_loader/global_loading_provider.dart';
import '../utils.dart';

class TokenTopicFormProvider extends StateNotifier<NewTokenTopic> {
  final Ref ref;
  late final String scId;
  late final String address;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController miniumVotesController = TextEditingController();

  TokenTopicFormProvider(this.ref, NewTokenTopic model) : super(model) {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });

    descriptionController.addListener(() {
      state = state.copyWith(description: descriptionController.text);
    });

    miniumVotesController.addListener(() {
      state = state.copyWith(minimumVoteRequirement: int.tryParse(miniumVotesController.text) ?? 0);
    });
    load(state);
  }

  load(NewTokenTopic topic) {
    state = topic;
    nameController.text = topic.name;
    descriptionController.text = topic.description;
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? descriptionValidator(String? val) => formValidatorNotEmpty(val, "Description");
  String? minimumVotesValidator(String? val) => formValidatorNumber(val, "Minimum Token Requirement");

  List<ValueLabel> votingDaysOptions(BuildContext context) {
    return tokenVotingDaysValueLabels(context);
  }

  setVotingEndDays(TokenVotingDays days) {
    state = state.copyWith(votingEndDays: days);
  }

  clear() {
    load(NewTokenTopic.empty(state.smartContractUid, state.fromAddress));
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    final balance = ref.read(sessionProvider).currentWallet?.balance;

    if (balance == null || balance < VOTE_TOPIC_COST) {
      Toast.error("Submitting a topic costs $VOTE_TOPIC_COST RBX.");
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();

    final success = await TokenService().createTopic(state);
    ref.read(globalLoadingProvider.notifier).complete();

    if (success) {
      clear();
    }
    return success;
  }
}

final tokenTopicFormProvider = StateNotifierProvider.family<TokenTopicFormProvider, NewTokenTopic, String>((ref, family) {
  final scId = family.split("||").first;
  final address = family.split("||").last;

  return TokenTopicFormProvider(ref, NewTokenTopic.empty(scId, address));
});
