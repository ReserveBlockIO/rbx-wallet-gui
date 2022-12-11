import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/providers/my_vote_list_provider.dart';
import 'package:rbx_wallet/features/voting/providers/pending_votes_provider.dart';
import 'package:rbx_wallet/features/voting/providers/voting_provider.dart';
import 'package:collection/collection.dart';

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
      return SizedBox.shrink();
    }

    final myAddress = ref.watch(sessionProvider).currentWallet?.address;

    if (myAddress == null) {
      return _ErrorMessage("Must have a wallet selected to vote.");
    }

    final isValidating = ref.watch(sessionProvider).currentWallet?.isValidating == true;
    if (!isValidating) {
      return _ErrorMessage("You must be a validator to vote.");
    }

    final existingVote = myVotes.firstWhereOrNull((a) => a.address == myAddress && a.topicUid == topic.uid);

    if (existingVote != null) {
      if (existingVote.blockHeight == 0) {
        return _ErrorMessage("You voted ${existingVote.voteTypeLabel}. Transaction is pending.");
      }
      return _ErrorMessage("You voted ${existingVote.voteTypeLabel} on block ${existingVote.blockHeight}");
    }

    if (ref.read(pendingVotesProvider).contains(topic.uid)) {
      return _ErrorMessage("Vote transaction pending.");
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
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              label: "Vote Yes",
              onPressed: () async {
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
            SizedBox(
              width: 16,
            ),
            AppButton(
              label: "Vote No",
              onPressed: () async {
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
        SizedBox(height: 8),
        Text(
          "Voting ends ${topic.endsAtFormatted}.",
          style: Theme.of(context).textTheme.caption,
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
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}