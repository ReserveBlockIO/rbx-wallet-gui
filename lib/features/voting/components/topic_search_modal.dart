import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../providers/topic_search_provider.dart';
import 'topic_list_tile.dart';

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
