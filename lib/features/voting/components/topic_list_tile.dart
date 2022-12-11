import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/features/voting/components/voting_category_badge.dart';
import 'package:rbx_wallet/features/voting/screens/topic_detail_screen.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../models/topic.dart';

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
      subtitle: Text(
        topic.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(Icons.article),
    );
  }
}
