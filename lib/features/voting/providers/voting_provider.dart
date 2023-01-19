import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast.dart';
import '../../global_loader/global_loading_provider.dart';
import '../models/topic.dart';
import '../services/topic_service.dart';
import '../services/vote_service.dart';
import 'pending_votes_provider.dart';

class VotingProvider extends StateNotifier<Topic?> {
  final StateNotifierProviderRef ref;
  final String uid;
  VotingProvider(this.ref, this.uid) : super(null) {
    load();
  }

  load() async {
    final topic = await TopicService().retrieve(uid);
    state = topic;
  }

  voteYes() async {
    ref.read(globalLoadingProvider.notifier).start();
    final success = await VoteService().castVoteYes(uid);
    ref.read(globalLoadingProvider.notifier).complete();

    if (success == true) {
      ref.read(pendingVotesProvider.notifier).addId(uid);
      Toast.message("Vote Casted [YES]");

      return;
    }

    Toast.error();
  }

  voteNo() async {
    ref.read(globalLoadingProvider.notifier).start();
    final success = await VoteService().castVoteNo(uid);
    ref.read(globalLoadingProvider.notifier).complete();

    if (success == true) {
      ref.read(pendingVotesProvider.notifier).addId(uid);
      Toast.message("Vote Casted [NO]");
      return;
    }

    Toast.error();
  }
}

final votingProvider = StateNotifierProvider.family<VotingProvider, Topic?, String>(
  (ref, uid) => VotingProvider(ref, uid),
);
