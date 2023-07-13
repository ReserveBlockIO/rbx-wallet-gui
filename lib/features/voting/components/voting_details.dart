// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:rbx_wallet/features/voting/providers/vote_list_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../models/topic.dart';
import '../services/topic_service.dart';
import 'vote_history_modal.dart';

class VotingDetails extends BaseStatefulComponent {
  final Topic topic;
  const VotingDetails(this.topic, {Key? key}) : super(key: key);

  @override
  _VotingDetailsState createState() => _VotingDetailsState();
}

class _VotingDetailsState extends BaseComponentState<VotingDetails> {
  late Topic topic;
  late Timer timer;
  @override
  void initState() {
    topic = widget.topic;
    poll();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
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
    final t = await TopicService().retrieve(topic.uid);
    if (t != null) {
      setState(() {
        topic = t;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (topic.totalVotes < 1) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "No votes yet.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    final includeShowHistoryButton = ref.read(walletListProvider).where((w) => w.address == topic.ownerAddress).toList().isNotEmpty;

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
                      topic.yesVotes.toString(),
                      Theme.of(context).colorScheme.success,
                    ),
                    buildDetailRow(
                      context,
                      "Votes No",
                      topic.noVotes.toString(),
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
                      "${topic.yesPercent}%",
                      Theme.of(context).colorScheme.success,
                    ),
                    buildDetailRow(
                      context,
                      "Votes No",
                      "${topic.noPercent}%",
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
          chartValuesOptions: const ChartValuesOptions(
            decimalPlaces: 0,
            showChartValues: false,
          ),
          colorList: [
            Theme.of(context).colorScheme.success,
            Theme.of(context).colorScheme.danger,
          ],
          dataMap: {
            "Yes": topic.yesVotes.toDouble(),
            "No": topic.noVotes.toDouble(),
          },
        ),
        const SizedBox(width: 16),
        if (includeShowHistoryButton)
          AppButton(
            label: "Show History",
            onPressed: () async {
              await ref.read(voteListProvider(topic.uid).notifier).load();
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.black87,
                context: context,
                builder: (context) {
                  return VoteListModal(topicUid: topic.uid);
                },
              );
            },
            type: AppButtonType.Elevated,
            variant: AppColorVariant.Light,
          )
      ],
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
