import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/components/badges.dart';
import '../providers/transaction_signal_provider.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/web_router.gr.dart';
import '../models/web_transaction.dart';
import '../../web_shop/components/complete_sale_button.dart';

class WebTransactionCard extends BaseComponent {
  final WebTransaction tx;

  const WebTransactionCard(
    this.tx, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat formatter = DateFormat('MM-dd-yyyy hh:mm a');

    var date1 = DateTime.fromMillisecondsSinceEpoch((tx.date.millisecondsSinceEpoch).round());
    var date = DateFormat('MM-dd-yyyy hh:mm a').format(date1);

    final address = ref.read(webSessionProvider).keypair?.address;
    final isMobile = BreakPoints.useMobileLayout(context);
    final toMe = tx.toAddress == address;

    final color = tx.type == TxType.rbxTransfer
        ? toMe
            ? Theme.of(context).colorScheme.success
            : Theme.of(context).colorScheme.danger
        : Colors.white;

    final text = tx.type == TxType.rbxTransfer ? "${tx.amount} RBX" : tx.typeLabel;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: glowingBox,
        ),
        child: Card(
          // color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
          color: Colors.black87,

          child: ListTile(
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
                    style: const TextStyle(fontSize: 12),
                  )
                : Text("To: ${tx.toAddress}\n$date", style: const TextStyle(fontSize: 12)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (tx.isPending)
                  AppBadge(
                    label: "Pending",
                    variant: AppColorVariant.Warning,
                  ),
                CompleteSaleButton(
                  tx: tx,
                  fallbackWidget: Icon(Icons.chevron_right),
                ),
              ],
            ),
            onTap: () {
              AutoRouter.of(context).push(WebTransactionDetailScreenRoute(hash: tx.hash));
              // if (kDebugMode) {
              //   ref.read(transactionSignalProvider.notifier).insert(tx.toNative());
              // }
            },
          ),
        ),
      ),
    );
  }
}
