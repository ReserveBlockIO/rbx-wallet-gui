import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../providers/topic_list_provider.dart';
import 'topic_list_tile.dart';

class TopicList extends BaseComponent {
  final TopicListType type;
  const TopicList({
    Key? key,
    this.type = TopicListType.All,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicListProvider(type));

    if (topics.isEmpty) {
      final message = ref.read(topicListProvider(type).notifier).emptyMessage(context);
      return Center(
        child: Text(message),
      );
    }

    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];

        return TopicListTile(topic);
      },
    );
  }
}
