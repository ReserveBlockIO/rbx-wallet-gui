import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/badges.dart';
import '../../../core/theme/app_theme.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../models/vote.dart';
import '../providers/vote_list_provider.dart';

class VoteListModal extends BaseComponent {
  final String topicUid;
  const VoteListModal({
    required this.topicUid,
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final votes = ref.watch(voteListProvider(topicUid));

    return ModalContainer(
      padding: 8,
      withDecor: false,
      withClose: true,
      children: votes
          .map(
            (vote) => ListTile(
              title: SelectableText(vote.address),
              subtitle: Text("Block ${vote.blockHeight}"),
              trailing: AppBadge(
                label: vote.voteTypeLabel,
                variant: vote.type == VoteType.Yes ? AppColorVariant.Success : AppColorVariant.Danger,
              ),
            ),
          )
          .toList(),
    );
  }
}
