import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../providers/node_info_provider.dart';
import 'node_info_card.dart';

class NodeInfoList extends BaseComponent {
  NodeInfoList({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeInfoProvider);

    if (nodes.isEmpty) {
      return const SizedBox();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Peer Info",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 90,
          color: Colors.black38,
          width: double.infinity,
          child: Scrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: nodes.length,
              itemBuilder: (context, index) {
                final node = nodes[index];
                return NodeInfoCard(node);
              },
            ),
          ),
        ),
      ],
    );
  }
}
