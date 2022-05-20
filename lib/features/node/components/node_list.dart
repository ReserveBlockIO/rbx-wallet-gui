import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/node/components/node_card.dart';
import 'package:rbx_wallet/features/node/providers/node_list_provider.dart';

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
