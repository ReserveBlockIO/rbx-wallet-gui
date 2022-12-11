import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/models/vote.dart';
import 'package:rbx_wallet/features/voting/services/vote_service.dart';

class VoteListProvider extends StateNotifier<List<Vote>> {
  final Reader read;
  final String topicUid;

  VoteListProvider(this.read, this.topicUid, [List<Vote> votes = const []]) : super(votes) {
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
  (ref, topicUid) => VoteListProvider(ref.read, topicUid),
);
