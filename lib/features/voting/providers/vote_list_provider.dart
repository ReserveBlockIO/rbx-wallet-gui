import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/vote.dart';
import '../services/vote_service.dart';

class VoteListProvider extends StateNotifier<List<Vote>> {
  final Ref ref;
  final String topicUid;

  VoteListProvider(this.ref, this.topicUid, [List<Vote> votes = const []]) : super(votes) {
    load();
  }

  Future<void> load() async {
    state = await VoteService().topic(topicUid);
  }

  void refresh() {
    load();
  }
}

final voteListProvider = StateNotifierProvider.family<VoteListProvider, List<Vote>, String>(
  (ref, topicUid) => VoteListProvider(ref, topicUid),
);
