import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/transactions/models/web_transaction.dart';

class WebTransactionCard extends BaseComponent {
  final WebTransaction tx;

  const WebTransactionCard(
    this.tx, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = tx.parseTimeStamp;

    final address = ref.read(webSessionProvider).keypair?.public;
    final isMobile = BreakPoints.useMobileLayout(context);
    final toMe = tx.toAddress == address;

    final color = tx.type == TxType.rbxTransfer
        ? toMe
            ? Theme.of(context).colorScheme.success
            : Theme.of(context).colorScheme.danger
        : Colors.white;

    final text = tx.type == TxType.rbxTransfer ? "${tx.amount} RBX" : tx.typeLabel;

    return ListTile(
      leading: isMobile
          ? null
          : toMe
              ? const Icon(Icons.move_to_inbox)
              : const Icon(Icons.outbox),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      subtitle: toMe
          ? Text(
              "From: ${tx.fromAddress}\n$date",
              style: TextStyle(fontSize: 12),
            )
          : Text("To: ${tx.toAddress}\n$date", style: TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        AutoRouter.of(context).push(WebTransactionDetailScreenRoute(hash: tx.hash));
      },
    );
  }
}
