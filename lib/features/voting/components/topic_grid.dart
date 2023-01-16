import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../providers/topic_list_provider.dart';
import 'topic_card.dart';

class TopicGrid extends BaseComponent {
  final TopicListType type;
  const TopicGrid({
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

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: BreakPoints.useMobileLayout(context) ? 1 : 3,
          childAspectRatio: 1,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return TopicCard(topic);
        });
  }
}
