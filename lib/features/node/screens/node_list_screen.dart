import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/features/node/components/node_info_list.dart';
import 'package:rbx_wallet/features/node/components/node_list.dart';
import 'package:rbx_wallet/features/node/providers/node_list_provider.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';

class NodeListScreen extends BaseScreen {
  const NodeListScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Validator Pool"),
      backgroundColor: Colors.black12,
      shadowColor: Colors.transparent,
      actions: [WalletSelector()],
      // leading: IconButton(
      //   icon: Icon(Icons.refresh),
      //   onPressed: () {
      //     ref.read(nodeListProvider.notifier).load();
      //   },
      // ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: NodeInfoList(),
        ),
        Expanded(child: NodeList()),
      ],
    );
  }
}
