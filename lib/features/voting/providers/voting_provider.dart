import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/models/vote.dart';
import 'package:rbx_wallet/features/voting/providers/my_vote_list_provider.dart';
import 'package:rbx_wallet/features/voting/providers/pending_votes_provider.dart';
import 'package:rbx_wallet/features/voting/providers/topic_detail_provider.dart';
import 'package:rbx_wallet/features/voting/services/topic_service.dart';
import 'package:rbx_wallet/features/voting/services/vote_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

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
