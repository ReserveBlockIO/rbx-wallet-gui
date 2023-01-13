import 'package:flutter/material.dart';

import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../models/topic.dart';
import '../utils.dart';

class VotingCategoryBadge extends StatelessWidget {
  const VotingCategoryBadge({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return AppBadge(
      label: voteTopicCategoryToString(context, topic.category),
      variant: AppColorVariant.Light,
    );
  }
}
