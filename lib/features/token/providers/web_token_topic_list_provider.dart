import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/explorer_service.dart';
import '../models/token_vote_topic.dart';

class WebTokenTopicListModel {
  final List<WebTokenVoteTopic> topics;
  final bool isLoading;
  final bool canLoadMore;
  final int page;

  const WebTokenTopicListModel({
    this.topics = const [],
    this.isLoading = false,
    this.canLoadMore = true,
    this.page = 1,
  });

  WebTokenTopicListModel copyWith({
    List<WebTokenVoteTopic>? topics,
    bool? isLoading,
    bool? canLoadMore,
    int? page,
  }) {
    return WebTokenTopicListModel(
      topics: topics ?? this.topics,
      isLoading: isLoading ?? this.isLoading,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      page: page ?? this.page,
    );
  }
}

class WebTokenTopicListProvider extends StateNotifier<WebTokenTopicListModel> {
  final Ref ref;
  final String scId;

  WebTokenTopicListProvider(this.ref, this.scId) : super(const WebTokenTopicListModel()) {
    load(1);
  }

  load(int page) async {
    state = state.copyWith(isLoading: true);
    final data = await ExplorerService().listTokenVotingTopics(scId);

    state = state.copyWith(
      topics: [...state.topics, ...data.results],
      isLoading: false,
      canLoadMore: data.num_pages > data.page,
      page: page,
    );
  }
}

final webTokenTopicListProvider = StateNotifierProvider.family<WebTokenTopicListProvider, WebTokenTopicListModel, String>((ref, scId) {
  return WebTokenTopicListProvider(ref, scId);
});
