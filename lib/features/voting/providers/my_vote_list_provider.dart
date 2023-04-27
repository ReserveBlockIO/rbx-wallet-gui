import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/vote.dart';
import '../services/vote_service.dart';

class MyVoteListProvider extends StateNotifier<List<Vote>> {
  final Ref ref;

  MyVoteListProvider(this.ref, [List<Vote> votes = const []]) : super(votes) {
    load();
  }

  Future<void> load() async {
    state = await VoteService().mine();
  }

  void refresh() {
    load();
  }

  void addVote(Vote newVote) {
    state = [...state, newVote];
  }
}

final myVoteListProvider = StateNotifierProvider<MyVoteListProvider, List<Vote>>(
  (ref) => MyVoteListProvider(ref),
);
