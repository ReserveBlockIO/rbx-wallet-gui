import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../encrypt/utils.dart';
import '../providers/my_vote_list_provider.dart';
import '../providers/pending_votes_provider.dart';
import '../providers/voting_provider.dart';

class TopicVoteActions extends BaseComponent {
  const TopicVoteActions({
    Key? key,
    required this.topicUid,
  }) : super(key: key);

  final String topicUid;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final topic = ref.watch(votingProvider(topicUid));
    final provider = ref.read(votingProvider(topicUid).notifier);

    final myVotes = ref.watch(myVoteListProvider);

    if (topic == null) {
      return const SizedBox.shrink();
    }

    if (!topic.isActive) {
      return _ErrorMessage("Voting Ended on ${topic.endsAtFormatted}.");
    }

    final myAddress = ref.watch(sessionProvider.select((v) => v.currentWallet?.address));

    if (myAddress == null) {
      return const _ErrorMessage("Must have an account selected to vote.");
    }

    final isValidating = ref.watch(sessionProvider.select((v) => v.currentWallet?.isValidating)) == true;
    if (!isValidating) {
      return const _ErrorMessage("You must be a validator to vote.");
    }

    final existingVote = myVotes.firstWhereOrNull((a) => a.address == myAddress && a.topicUid == topic.uid);

    if (existingVote != null) {
      if (existingVote.blockHeight == 0) {
        return _ErrorMessage("You voted ${existingVote.voteTypeLabel}. Transaction is pending.");
      }
      return _ErrorMessage("You voted ${existingVote.voteTypeLabel} on block ${existingVote.blockHeight}");
    }

    if (ref.read(pendingVotesProvider).contains(topic.uid)) {
      return const _ErrorMessage("Vote transaction pending.");
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Cast Your Vote",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              label: "Vote Yes",
              onPressed: () async {
                if (!await passwordRequiredGuard(context, ref)) return;
                final confirmed = await ConfirmDialog.show(
                  title: "Confirm Vote [YES]",
                  body: "Are you sure you want to vote YES on this topic?",
                  confirmText: "Vote YES",
                  cancelText: "Cancel",
                );
                if (confirmed == true) {
                  provider.voteYes();
                }
              },
              variant: AppColorVariant.Success,
              size: AppSizeVariant.Lg,
            ),
            const SizedBox(
              width: 16,
            ),
            AppButton(
              label: "Vote No",
              onPressed: () async {
                if (!await passwordRequiredGuard(context, ref)) return;

                final confirmed = await ConfirmDialog.show(
                  title: "Confirm Vote [NO]",
                  body: "Are you sure you want to vote NO on this topic?",
                  confirmText: "Vote NO",
                  cancelText: "Cancel",
                );
                if (confirmed == true) {
                  provider.voteNo();
                }
              },
              variant: AppColorVariant.Danger,
              size: AppSizeVariant.Lg,
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Voting ends ${topic.endsAtFormatted}.",
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  final String message;
  const _ErrorMessage(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
