import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/voting/components/topic_list_tile.dart';
import 'package:rbx_wallet/features/voting/providers/topic_search_provider.dart';

class TopicSearchModal extends BaseComponent {
  const TopicSearchModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(topicSearchProvider.notifier);
    final topics = ref.watch(topicSearchProvider);

    return ModalContainer(
      withClose: true,
      withDecor: false,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Search...",
          ),
          autofocus: true,
          controller: provider.controller,
          onChanged: (val) {
            if (val.isNotEmpty) {
              provider.query(val);
            }
          },
        ),
        ...topics.map((t) => TopicListTile(t)).toList()
      ],
    );
  }
}
