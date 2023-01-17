import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/models/vote.dart';
import 'package:rbx_wallet/features/voting/providers/adj_vote_form_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/models/value_label.dart';
import '../../../utils/validation.dart';
import '../../global_loader/global_loading_provider.dart';
import '../models/new_topic.dart';
import '../models/topic.dart';
import '../services/topic_service.dart';
import '../utils.dart';
import 'topic_list_provider.dart';

class TopicFormProvider extends StateNotifier<NewTopic> {
  final Reader read;
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TopicFormProvider(this.read, NewTopic model) : super(model) {
    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });

    descriptionController.addListener(() {
      state = state.copyWith(description: descriptionController.text);
    });
    load(state);
  }

  load(NewTopic topic) {
    state = topic;
    nameController.text = topic.name;
    descriptionController.text = topic.description;
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Name");
  String? descriptionValidator(String? val) => formValidatorNotEmpty(val, "Description");

  List<ValueLabel> categoryOptions(BuildContext context) {
    return voteTopicCategoryValueLabels(context);
  }

  List<ValueLabel> votingDaysOptions(BuildContext context) {
    return votingDaysValueLabels(context);
  }

  setCategory(VoteTopicCategory category) {
    state = state.copyWith(category: category);
  }

  setVotingEndDays(VotingDays days) {
    state = state.copyWith(votingEndDays: days);
  }

  clear() {
    load(NewTopic.empty());
  }

  Future<bool?> submit() async {
    Map<String, dynamic>? adjVoteData;
    if (state.category == VoteTopicCategory.AdjVoteIn) {
      final adjFormKey = read(adjVoteFormProvider.notifier).formKey;

      bool isValid = true;
      if (!formKey.currentState!.validate()) {
        isValid = false;
      }

      if (!adjFormKey.currentState!.validate()) {
        isValid = false;
      }
      if (!isValid) {
        return null;
      }

      adjVoteData = read(adjVoteFormProvider.notifier).serialize();
    } else {
      if (!formKey.currentState!.validate()) {
        return null;
      }
    }

    if (kDebugMode) {
      state = state.copyWith(description: jsonEncode(adjVoteData));
      descriptionController.text = state.description;
    }

    read(globalLoadingProvider.notifier).start();

    final success = await TopicService().create(state, adjVoteData);
    read(globalLoadingProvider.notifier).complete();

    if (success) {
      if (!kDebugMode) {
        clear();
      }
      for (final t in TopicListType.values) {
        read(topicListProvider(t).notifier).refresh();
      }
    }
    return success;
  }
}

final topicFormProvider = StateNotifierProvider<TopicFormProvider, NewTopic>((ref) {
  return TopicFormProvider(ref.read, NewTopic.empty());
});
