import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../models/topic.dart';
import 'voting_category_badge.dart';

class TopicCard extends BaseComponent {
  final Topic topic;
  const TopicCard(this.topic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: glowingBox, color: Colors.black),
        child: InkWell(
          onTap: () {
            AutoRouter.of(context).push(TopicDetailScreenRoute(topicUid: topic.uid));
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopicDetailScreen(topic: topic)));
          },
          child: Card(
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        VotingCategoryBadge(topic: topic),
                        const SizedBox(height: 4),
                        Text(
                          topic.name,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "Ends ${topic.endsAtFormatted}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        topic.category != VoteTopicCategory.AdjVoteIn
                            ? Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  topic.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  topic.descriptionIsJson ? jsonDecode(topic.description)['RBXAddress'] : topic.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
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
        ),
      ),
    );
  }
}
