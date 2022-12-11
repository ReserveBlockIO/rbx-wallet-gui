import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/voting/components/voting_category_badge.dart';
import 'package:rbx_wallet/features/voting/screens/topic_detail_screen.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../models/topic.dart';
import '../utils.dart';

class TopicCard extends BaseComponent {
  final Topic topic;
  const TopicCard(this.topic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(TopicDetailScreenRoute(topicUid: topic.uid));
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopicDetailScreen(topic: topic)));
      },
      child: Card(
        // color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VotingCategoryBadge(topic: topic),
                    SizedBox(height: 4),
                    Text(
                      topic.name,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "Ends ${topic.endsAtFormatted}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        topic.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: AppBadge(
                  label: "${topic.yesPercent}%",
                  variant: AppColorVariant.Success,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: AppBadge(
                  label: "${topic.noPercent}%",
                  variant: AppColorVariant.Danger,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}