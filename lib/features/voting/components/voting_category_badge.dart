import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/utils.dart';

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
