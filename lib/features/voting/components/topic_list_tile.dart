import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../models/topic.dart';
import 'voting_category_badge.dart';

class TopicListTile extends BaseComponent {
  final Topic topic;
  const TopicListTile(this.topic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(TopicDetailScreenRoute(topicUid: topic.uid));
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopicDetailScreen(topic: topic)));
      },
      title: Text(topic.name),
      trailing: VotingCategoryBadge(topic: topic),
      subtitle: topic.category != VoteTopicCategory.AdjVoteIn
          ? Text(
              topic.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : Text(
              topic.descriptionIsJson ? jsonDecode(topic.description)['RBXAddress'] : topic.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      leading: const Icon(Icons.article),
    );
  }
}
