import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/voting/components/topic_vote_actions.dart';
import 'package:rbx_wallet/features/voting/components/voting_category_badge.dart';
import 'package:rbx_wallet/features/voting/components/voting_details.dart';

import '../../../core/base_component.dart';
import '../models/topic.dart';

class TopicDetail extends BaseComponent {
  final Topic topic;
  const TopicDetail(this.topic, {Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
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
                      topic.name,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    VotingCategoryBadge(topic: topic),
                    SizedBox(height: 4),
                    SelectableText(
                      "UID: ${topic.uid}",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              _DateCard(
                label: "Topic Created",
                value: topic.createdAtFormatted,
              ),
              _DateCard(
                label: "Voting Ends",
                value: topic.endsAtFormatted,
              )
            ],
          ),
          Divider(),
          SelectableText("Block Height: ${topic.blockHeight}"),
          SelectableText("Topic Owner: ${topic.ownerAddress}"),
          Divider(),
          SizedBox(height: 6),
          Text(
            topic.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Divider(),
          VotingDetails(topic),
          Divider(),
          TopicVoteActions(topicUid: topic.uid),
          Divider(),
        ],
      ),
    );
  }
}

class _DateCard extends StatelessWidget {
  final String label;
  final String value;
  const _DateCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
