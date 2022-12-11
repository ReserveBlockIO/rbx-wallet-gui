import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/voting/components/vote_history_modal.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/services/topic_service.dart';

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
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
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
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "No votes yet.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
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
                SizedBox(
                  height: 4,
                ),
                Table(
                  defaultColumnWidth: IntrinsicColumnWidth(),
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
                    buildDetailRow(context, "", ""),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 16),
        Card(
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
                SizedBox(
                  height: 4,
                ),
                Table(
                  defaultColumnWidth: IntrinsicColumnWidth(),
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
                    buildDetailRow(context, "In Favor", "${topic.percentInFavor}%"),
                    buildDetailRow(context, "Against", "${topic.percentAgainst}%"),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        PieChart(
          chartRadius: 100,
          chartType: ChartType.ring,
          chartValuesOptions: ChartValuesOptions(decimalPlaces: 0),
          colorList: [
            Theme.of(context).colorScheme.success,
            Theme.of(context).colorScheme.danger,
          ],
          dataMap: {
            "Yes": topic.yesVotes.toDouble(),
            "No": topic.noVotes.toDouble(),
          },
        ),
        SizedBox(width: 16),
        AppButton(
          label: "Show History",
          onPressed: () async {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.black87,
              context: context,
              builder: (context) {
                return VoteListModal(topicUid: topic.uid);
              },
            );
          },
          type: AppButtonType.Outlined,
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
            style: TextStyle(fontSize: 16),
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
