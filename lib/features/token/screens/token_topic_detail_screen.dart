import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/encrypt/utils.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/token/models/token_vote_topic.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/features/voting/providers/pending_votes_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:collection/collection.dart';

import '../../voting/components/topic_detail.dart';
import '../models/token_vote.dart';

class TokenTopicDetailScreen extends BaseScreen {
  final TokenVoteTopic topic;
  final String address;
  final double balance;
  final bool isOwner;
  const TokenTopicDetailScreen(this.topic, this.address, this.balance, this.isOwner, {super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(topic.topicName),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return TokenTopicDetail(
      topic: topic,
      address: address,
      balance: balance,
      isOwner: isOwner,
    );
  }
}

class TokenTopicDetail extends BaseStatefulComponent {
  const TokenTopicDetail({
    super.key,
    required this.topic,
    required this.address,
    required this.balance,
    required this.isOwner,
  });

  final TokenVoteTopic topic;
  final String address;
  final double balance;
  final bool isOwner;

  @override
  _TokenTopicDetailState createState() => _TokenTopicDetailState();
}

class _TokenTopicDetailState extends BaseComponentState<TokenTopicDetail> {
  late TokenVoteTopic topic;
  late Timer timer;

  TokenVote? currentVote;

  @override
  void initState() {
    topic = widget.topic;
    poll();
    timer = Timer.periodic(const Duration(seconds: 20), (timer) {
      poll();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> poll() async {
    final nft = await NftService().getNftData(topic.smartContractUid);

    if (nft != null && nft.tokenStateDetails != null) {
      final t = nft.tokenStateDetails!.topicList.firstWhereOrNull((item) => item.topicUid == topic.topicUid);

      if (t != null) {
        setState(() {
          topic = t;
        });
      }
    }

    final votes = await TokenService().listAddressVotes(widget.address);

    setState(() {
      currentVote = votes.firstWhereOrNull((v) => v.topicUid == widget.topic.topicUid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    topic.topicName,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    "UID: ${topic.topicUid}",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            DateCard(
              label: "Topic Created",
              value: topic.createdAtFormatted,
            ),
            DateCard(
              label: "Voting Ends",
              value: topic.endsAtFormatted,
            )
          ],
        ),
        const Divider(),
        Text(topic.topicDescription, style: TextStyle(fontSize: 18)),
        const SizedBox(height: 6),
        SelectableText("Smart Contract UID: ${topic.smartContractUid}"),
        const SizedBox(height: 6),
        Text("Block Height: ${topic.blockHeight}"),
        const SizedBox(height: 6),
        Text("Minimum Tokens to Vote: ${topic.minimumVoteRequirement}"),
        const SizedBox(height: 6),
        Text("Your Balance: ${widget.balance}"),

        // const SizedBox(height: 6),
        // Text("Token Holder Count: ${topic.tokenHolderCount}"),
        Divider(),
        _TopicVotingDetails(
          topic: topic,
          isOwner: widget.isOwner,
        ),
        const SizedBox(height: 12),
        _TopicVotingActions(
          topic: topic,
          address: widget.address,
          balance: widget.balance,
          currentVote: currentVote,
        )
      ],
    );
  }
}

class _TopicVotingActions extends BaseComponent {
  const _TopicVotingActions({
    super.key,
    required this.topic,
    required this.address,
    required this.balance,
    required this.currentVote,
  });

  final String address;
  final TokenVoteTopic topic;
  final double balance;
  final TokenVote? currentVote;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    if (currentVote != null) {
      return _ErrorMessage("You voted ${currentVote!.voteTypeLabel} on block ${currentVote!.blockHeight}.");
    }

    final pendingVoteKey = "$address|${topic.topicUid}";

    if (ref.watch(pendingVotesProvider).contains(pendingVoteKey)) {
      return const _ErrorMessage("Vote transaction pending.");
    }

    if (!topic.isActive) {
      return _ErrorMessage("Voting Ended on ${topic.endsAtFormatted}.");
    }

    if (balance < topic.minimumVoteRequirement) {
      return _ErrorMessage("You need at least ${topic.minimumVoteRequirement} tokens to vote.");
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
                  body: "Are you sure you want to vote YES on this token topic?",
                  confirmText: "Vote YES",
                  cancelText: "Cancel",
                );
                if (confirmed == true) {
                  // provider.voteYes();
                  ref.read(globalLoadingProvider.notifier).start();
                  final success = await TokenService().castVote(
                    scId: topic.smartContractUid,
                    fromAddress: address,
                    topicUid: topic.topicUid,
                    yes: true,
                  );

                  if (success) {
                    ref.read(pendingVotesProvider.notifier).addId(pendingVoteKey);
                    Toast.message("Vote casted");
                  }

                  ref.read(globalLoadingProvider.notifier).complete();
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
                  body: "Are you sure you want to vote NO on this token topic?",
                  confirmText: "Vote NO",
                  cancelText: "Cancel",
                );
                if (confirmed == true) {
                  // provider.voteNo();
                  ref.read(globalLoadingProvider.notifier).start();

                  final success = await TokenService().castVote(
                    scId: topic.smartContractUid,
                    fromAddress: address,
                    topicUid: topic.topicUid,
                    yes: false,
                  );
                  if (success) {
                    ref.read(pendingVotesProvider.notifier).addId(pendingVoteKey);
                    Toast.message("Vote casted");
                  }
                  ref.read(globalLoadingProvider.notifier).complete();
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

class _TopicVotingDetails extends BaseComponent {
  const _TopicVotingDetails({
    super.key,
    required this.topic,
    required this.isOwner,
  });

  final TokenVoteTopic topic;
  final bool isOwner;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) {
        // if (topic.totalVotes < 1) {
        //   return const Center(
        //     child: Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Text(
        //         "No votes yet.",
        //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   );
        // }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.white.withOpacity(0.05),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vote Counts",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      children: [
                        buildDetailRow(
                          context,
                          "Votes Yes",
                          topic.voteYes.toString(),
                          Theme.of(context).colorScheme.success,
                        ),
                        buildDetailRow(
                          context,
                          "Votes No",
                          topic.voteNo.toString(),
                          Theme.of(context).colorScheme.danger,
                        ),
                        buildDetailRow(
                          context,
                          "Total Votes",
                          topic.totalVotes.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Card(
              color: Colors.white.withOpacity(0.05),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Percentages",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      children: [
                        buildDetailRow(
                          context,
                          "Votes Yes",
                          "${topic.percentVotesYes}%",
                          Theme.of(context).colorScheme.success,
                        ),
                        buildDetailRow(
                          context,
                          "Votes No",
                          "${topic.percentVotesNo}%",
                          Theme.of(context).colorScheme.danger,
                        ),
                        if (topic.isActive) buildDetailRow(context, "Result", "In Progress"),
                        if (!topic.isActive) buildDetailRow(context, "Result", topic.percentInFavor > topic.percentAgainst ? "Pass" : "Fail"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            PieChart(
              chartRadius: 100,
              chartType: ChartType.ring,
              chartValuesOptions: const ChartValuesOptions(decimalPlaces: 0),
              colorList: [
                Theme.of(context).colorScheme.success,
                Theme.of(context).colorScheme.danger,
              ],
              dataMap: {
                "Yes": topic.voteYes.toDouble(),
                "No": topic.voteNo.toDouble(),
              },
            ),
            const SizedBox(width: 16),
            if (isOwner)
              AppButton(
                label: "Vote History",
                onPressed: () async {
                  // await ref.read(voteListProvider(topic.uid).notifier).load();

                  final votes = await TokenService().listVotes(topic.topicUid);
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.black87,
                    context: context,
                    builder: (context) {
                      return ModalContainer(
                          padding: 8,
                          withClose: true,
                          withDecor: false,
                          children: votes
                              .map(
                                (vote) => ListTile(
                                  title: SelectableText(vote.address),
                                  subtitle: Text("Block ${vote.blockHeight}"),
                                  trailing: AppBadge(
                                    label: vote.voteTypeLabel,
                                    variant: vote.voteType == TokenVoteType.Yes ? AppColorVariant.Success : AppColorVariant.Danger,
                                  ),
                                ),
                              )
                              .toList());
                    },
                  );
                },
                type: AppButtonType.Elevated,
                variant: AppColorVariant.Light,
              )
          ],
        );
      },
    );
  }

  TableRow buildDetailRow(
    BuildContext context,
    String label,
    String value, [
    Color color = Colors.white,
  ]) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          textAlign: TextAlign.right,
        ),
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
