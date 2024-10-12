import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../models/adj_vote.dart';
import '../models/topic.dart';
import 'topic_vote_actions.dart';
import 'voting_category_badge.dart';
import 'voting_details.dart';

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
                    const SizedBox(height: 4),
                    VotingCategoryBadge(topic: topic),
                    const SizedBox(height: 4),
                    SelectableText(
                      "UID: ${topic.uid}",
                      style: Theme.of(context).textTheme.bodySmall,
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
          SelectableText("Block Height: ${topic.blockHeight}"),
          SelectableText("Topic Owner: ${topic.ownerAddress}"),
          const Divider(),
          const SizedBox(height: 6),
          topic.category == VoteTopicCategory.AdjVoteIn && topic.descriptionIsJson
              ? AdjudicatorInVoteDetails(
                  topic: topic,
                )
              : Text(
                  topic.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
          const Divider(),
          VotingDetails(topic),
          const Divider(),
          TopicVoteActions(topicUid: topic.uid),
          const Divider(),
        ],
      ),
    );
  }
}

class AdjudicatorInVoteDetails extends BaseComponent {
  const AdjudicatorInVoteDetails({Key? key, required this.topic}) : super(key: key);
  final Topic topic;
  @override
  Widget build(BuildContext context, ref) {
    final data = jsonDecode(topic.description);
    final details = AdjVote.fromJson(data);
    return Column(
      children: [
        _AdjudicatorDetailValue(
          label: 'Adjudicator to be VFX Address: ',
          value: details.rbxAddress,
        ),
        _AdjudicatorDetailValue(
          label: 'Adjudicator to be Ip Address: ',
          value: details.ipAddress,
        ),
        _AdjudicatorDetailValue(
          label: 'Machine Provider: ',
          value: details.provider.name,
        ),
        _AdjudicatorDetailValue(
          label: 'Operating System: ',
          value: details.machineOs.name,
        ),
        _AdjudicatorDetailValue(
          label: 'Machine type: ',
          value: details.machineType,
        ),
        Row(
          children: [
            _AdjudicatorDetailValue(
              label: 'CPU: ',
              value: details.machineCPU,
            ),
            const SizedBox(
              width: 10,
            ),
            _AdjudicatorDetailValue(
              label: 'CPU Cores: ',
              value: details.machineCPUCores.toString(),
            ),
            const SizedBox(
              width: 10,
            ),
            _AdjudicatorDetailValue(
              label: 'CPU Threads: ',
              value: details.machineCPUThreads.toString(),
            ),
          ],
        ),
        Row(
          children: [
            _AdjudicatorDetailValue(
              label: 'RAM (GB): ',
              value: details.machineRam.toString(),
            ),
            const SizedBox(
              width: 10,
            ),
            _AdjudicatorDetailValue(
              label: 'HD Size: ',
              value: details.machineRam.toString() + details.machineHDDSpecifier.name.toUpperCase(),
            ),
          ],
        ),
        Row(
          children: [
            _AdjudicatorDetailValue(
              label: 'Internet Speed down(Gbps): ',
              value: details.internetSpeedDown.toString(),
            ),
            const SizedBox(
              width: 10,
            ),
            _AdjudicatorDetailValue(
              label: 'Internet Speed up(Gbps): ',
              value: details.internetSpeedUp.toString(),
            ),
            const SizedBox(
              width: 10,
            ),
            _AdjudicatorDetailValue(
              label: 'Bandwith (TB): ',
              value: details.bandwith != 0 ? details.bandwith.toString() : 'Unlimitted',
            ),
          ],
        ),
        _AdjudicatorDetailValue(
          label: 'Technical background: ',
          value: details.technicalBackground,
          maxLines: 3,
        ),
        _AdjudicatorDetailValue(
          label: 'Reasons to be added as adjudicator: ',
          value: details.reasonForAdjJoin,
          maxLines: 3,
        ),
        _AdjudicatorDetailValue(
          label: 'Github Link: ',
          value: details.githubLink,
        ),
        _AdjudicatorDetailValue(
          label: 'Adittional Links: ',
          value: details.supplementalURLs,
        ),
      ],
    );
  }
}

class _AdjudicatorDetailValue extends StatelessWidget {
  const _AdjudicatorDetailValue({Key? key, required this.label, required this.value, this.maxLines = 1}) : super(key: key);
  final int maxLines;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}

class DateCard extends StatelessWidget {
  final String label;
  final String value;
  const DateCard({
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
