import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/providers/my_vote_list_provider.dart';
import 'package:rbx_wallet/features/voting/services/topic_service.dart';

enum TopicListType {
  All,
  Active,
  Inactive,
  VotedOn,
  NotVotedOn,
  Mine,
}

class TopicListProvider extends StateNotifier<List<Topic>> {
  final Reader read;
  final TopicListType listType;

  TopicListProvider(this.read, this.listType, [List<Topic> topics = const []]) : super(topics) {
    load();
  }

  Future<void> load() async {
    late final List<Topic> data;

    switch (listType) {
      case TopicListType.All:
        data = await TopicService().all();
        break;
      case TopicListType.Active:
        data = await TopicService().active();
        break;
      case TopicListType.Inactive:
        data = await TopicService().inactive();
        break;
      case TopicListType.VotedOn:
        data = await TopicService().hasVoted();
        break;
      case TopicListType.NotVotedOn:
        data = await TopicService().notVoted();
        break;
      case TopicListType.Mine:
        data = await TopicService().mine();
        break;
    }

    state = data;
  }

  void refresh() {
    load();
  }

  String emptyMessage(BuildContext context) {
    switch (listType) {
      case TopicListType.All:
        return "No Topics";
      case TopicListType.Active:
        return "No Active Topics";
      case TopicListType.Inactive:
        return "No Inactive Topics";
      case TopicListType.VotedOn:
        return "You haven't voted on any topics.";
      case TopicListType.NotVotedOn:
        return "You have voted on all topics.";
      case TopicListType.Mine:
        return "You haven't created any topics.";
    }
  }
}

final topicListProvider = StateNotifierProvider.family<TopicListProvider, List<Topic>, TopicListType>(
  (ref, listType) => TopicListProvider(ref.read, listType),
);
