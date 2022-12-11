import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/models/vote.dart';
import 'package:rbx_wallet/features/voting/services/vote_service.dart';

class MyVoteListProvider extends StateNotifier<List<Vote>> {
  final Reader read;

  MyVoteListProvider(this.read, [List<Vote> votes = const []]) : super(votes) {
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
  (ref) => MyVoteListProvider(ref.read),
);
