import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/node/components/node_info_card.dart';
import 'package:rbx_wallet/features/node/providers/node_info_provider.dart';

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
          style: Theme.of(context).textTheme.headline5,
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
