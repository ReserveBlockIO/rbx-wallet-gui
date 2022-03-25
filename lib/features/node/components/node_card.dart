import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import 'package:rbx_wallet/features/node/models/node.dart';
import 'package:rbx_wallet/features/validator/providers/validator_list_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';

class NodeCard extends BaseComponent {
  final Node node;
  const NodeCard(this.node, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestBlock = ref.watch(walletInfoProvider)?.lastestBlock;

    final isLatest =
        (latestBlock != null && latestBlock.validator == node.address);

    final isNext =
        (latestBlock != null && latestBlock.nextValidator == node.address);

    print(latestBlock?.nextValidator ?? "NONE");

    final myAddresses =
        ref.read(validatorListProvider).map((w) => w.address).toList();

    final isMine = myAddresses.contains(node.address);

    Color borderColor = Colors.transparent;

    if (isLatest) {
      borderColor = Theme.of(context).colorScheme.success.withOpacity(0.5);
    } else if (isNext) {
      borderColor = Theme.of(context).colorScheme.warning.withOpacity(0.5);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          color: borderColor,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              color: isMine
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface,
              child: ListTile(
                horizontalTitleGap: 0,
                dense: true,
                leading: Text(
                  "${node.position}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white54,
                  ),
                ),
                title: Text(
                  "${node.uniqueName} [${node.nodeIp}]",
                ),
                subtitle: Text(
                  node.address,
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      node.isActive ? "Active" : "Inactive",
                      style: TextStyle(
                        color: node.isActive
                            ? Theme.of(context).colorScheme.success
                            : Theme.of(context).colorScheme.danger,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 3.0),
                    //   child: Text(
                    //     "Fails: ${node.failCount}",
                    //     style: TextStyle(color: Colors.white54, fontSize: 12),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
