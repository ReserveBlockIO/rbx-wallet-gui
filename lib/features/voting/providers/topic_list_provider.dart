import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/services/topic_service.dart';

enum TopicListType {
  All,
  Active,
  Inactive,
  VotedOn,
  NotVotedOn,
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
    }

    state = data;
  }

  void refresh() {
    load();
  }
}

final topicListProvider = StateNotifierProvider.family<TopicListProvider, List<Topic>, TopicListType>(
  (ref, listType) => TopicListProvider(ref.read, listType),
);
