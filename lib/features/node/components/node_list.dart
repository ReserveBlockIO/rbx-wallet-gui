import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../providers/node_list_provider.dart';
import 'node_card.dart';

class NodeList extends BaseComponent {
  const NodeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeListProvider);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: nodes.length,
            itemBuilder: (context, index) {
              final node = nodes[index];
              return NodeCard(node);
            },
          ),
        ),
      ],
    );
  }
}
