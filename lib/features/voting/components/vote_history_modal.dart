import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/voting/models/vote.dart';
import 'package:rbx_wallet/features/voting/providers/vote_list_provider.dart';

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
