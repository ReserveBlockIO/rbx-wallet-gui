import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import '../../../core/components/buttons.dart';
import '../../web/components/web_callback_button.dart';
import '../../../core/components/badges.dart';

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
    var date1 = DateTime.fromMillisecondsSinceEpoch((tx.date.millisecondsSinceEpoch).round());
    String date = DateFormat('MM-dd-yyyy hh:mm a').format(date1);

    if (tx.isPendingSettlement) {
      final settlementDate = DateFormat('MM-dd-yyyy hh:mm a').format(tx.unlockTime!);
      date = "$date | Settlement Date: $settlementDate";
    }

    final address = ref.watch(webSessionProvider).currentWallet?.address;
    final isMobile = BreakPoints.useMobileLayout(context);
    final toMe = tx.toAddress == address;

    final color = tx.type == TxType.rbxTransfer
        ? toMe
            ? Theme.of(context).colorScheme.success
            : Theme.of(context).colorScheme.danger
        : Colors.white;

    String text = tx.type == TxType.rbxTransfer ? "${tx.amount} VFX" : tx.typeLabel;

    if (tx.callbackDetails != null) {
      final cb = tx.callbackDetails!;
      text = "$text [${cb.amount} VFX from ${cb.toAddress}]";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
      child: AppCard(
        padding: 0,
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
              ? RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    children: [
                      TextSpan(text: "From: "),
                      TextSpan(
                          text: "${tx.fromAddress}\n",
                          style: TextStyle(color: tx.fromAddress.startsWith("xRBX") ? Colors.deepPurple.shade200 : Colors.white60)),
                      TextSpan(text: date)
                    ],
                  ),
                )
              : RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    children: [
                      TextSpan(text: "To: "),
                      TextSpan(
                          text: "${tx.toAddress}\n",
                          style: TextStyle(color: tx.toAddress.startsWith("xRBX") ? Colors.deepPurple.shade200 : Colors.white60)),
                      TextSpan(text: date)
                    ],
                  ),
                ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (tx.isPending)
                AppBadge(
                  label: "Pending",
                  variant: AppColorVariant.Warning,
                ),
              if (tx.callbackHash != null)
                AppButton(
                  label: "Original TX",
                  onPressed: () {
                    AutoRouter.of(context).push(WebTransactionDetailScreenRoute(hash: tx.callbackHash!));
                  },
                ),
              WebCallbackButton(tx),
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
    );
  }
}
