import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';

import '../../../core/base_screen.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../web/components/web_no_wallet.dart';
import '../components/web_transaction_card.dart';
import '../providers/web_transaction_list_provider.dart';

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
      actions: [
        IconButton(
            onPressed: () {
              final address = ref.read(webSessionProvider).keypair?.public;
              if (address != null) {
                ref.read(webTransactionListProvider(address).notifier).load();
              }
            },
            icon: const Icon(Icons.refresh))
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final address = ref.read(webSessionProvider).keypair?.public;

    if (address == null) {
      return const WebNotWallet();
    }

    final model = ref.watch(webTransactionListProvider(address));
    final transactions = model.transactions;

    if (model.isLoading) {
      return const CenteredLoader();
    }

    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];

          return WebTransactionCard(tx);
        });
  }
}
