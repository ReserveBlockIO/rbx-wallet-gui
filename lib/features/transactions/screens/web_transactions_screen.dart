import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/transactions/providers/web_transaction_list_provider.dart';
import 'package:rbx_wallet/features/web/components/web_no_wallet.dart';

class WebTransactionScreen extends BaseScreen {
  const WebTransactionScreen({Key? key})
      : super(
          key: key,
          includeWebDrawer: true,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Transactions"),
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(webTransactionListProvider);
    final address = ref.read(webSessionProvider).keypair?.public;
    final isMobile = BreakPoints.useMobileLayout(context);

    if (address == null) return const WebNotWallet();

    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];

          final toMe = tx.toAddress == address;
          return ListTile(
            leading: isMobile
                ? null
                : toMe
                    ? const Icon(Icons.move_to_inbox)
                    : const Icon(Icons.outbox),
            title: Text(
              "${tx.amount} RBX",
              style: TextStyle(color: toMe ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.danger),
            ),
            subtitle: toMe ? Text("From: ${tx.fromAddress}") : Text("To: ${tx.toAddress}"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              print(tx.hash);
              AutoRouter.of(context).push(WebTransactionDetailScreenRoute(hash: tx.hash));
            },
          );
        });
  }
}
